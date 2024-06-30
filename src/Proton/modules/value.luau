local Proton = require(script.Parent.Parent)


local value = {}


function value.new(initialValue: any, fixedType: any | nil, name: string | nil)
    -- internal values
    local myValue = nil -- initialValue will be applied once we define the self:set method
    local isLocked = false
    local observers = {}
    local numObservers = 0


    local self = {}


    self.__is_proton_value = true   -- internal value identification (can be spoofed but who cares)


    function self:lock()   isLocked = true  end
    function self:unlock() isLocked = false end


    function self:get(): any
        return myValue or nil
    end


    function self:set(newValue: any): nil
        local currentVal = self:get()

        -- ensure the new value is not the same as the previous one
        if (newValue == currentVal) then return currentVal end
        
        -- ensure the value is not locked
        if (isLocked) then
            Proton.warn(("%* is locked!"):format( (name or "This value") ))
            return currentVal
        end

        -- ensure the types are the same if the type if fixed
        if (fixedType ~= nil) and (typeof(newValue) ~= fixedType) then
            Proton.warn(
                ("Could not set %*! (%* is not of type %*)"):format(
                    (name ~= nil
                        and ("the value of " .. tostring(name))
                        or "this value"),
                    ('"'..tostring(newValue)..'"' or "the new value"),
                    (tostring(fixedType) or "unknown type")
                )
            )
            return currentVal
        end

        -- if there are no errors, set the value
        myValue = newValue

        -- call incrementor functions if there are any
        for _, observer in pairs(observers) do
            -- get the observer and validation functions
            local changeFunc, validateFunc = table.unpack(observer)

            -- check if we should call the observer function
            local doIncrement = true
            if validateFunc and typeof(validateFunc) == "function" then
                doIncrement = validateFunc(myValue, currentVal)
            end

            -- call the observer function if we should
            if doIncrement then
                changeFunc(myValue, currentVal)
            end
        end

        return myValue
    end

    function self:increment(increment: any): any
        local currentVal = self:get()

        -- ensure the types of the new and old values match
        local currentType = typeof(currentVal)
        local incrementType = typeof(increment)

        if (incrementType ~= currentType) then
            Proton.warn(
                ("Could not increment %*! (%* is not of type %*)"):format(
                    (name ~= nil
                        and ("the value of " .. tostring(name))
                        or "this value"),
                    ('"'..tostring(increment)..'"' or "the increment"),
                    ('"'..currentType..'"')
                )
            )
            return currentVal
        end

        -- increment the value

        -- case 1: string
        if currentType == "string" then
            self:set(currentVal .. increment)

        -- case 2: everything else
        else
            local succ = pcall(self.set, self, currentVal + increment)
            if not succ then
                Proton.warn(
                    ("Could not increment %*!"):format(
                        (name ~= nil
                            and ("the value of " .. tostring(name))
                            or "this value")
                    )
                )
            end
        end

        return self:get()
    end


    function self:onChange(
        changeFunc: (any) -> any,
        validateFunc: (any) -> any
    ): { [string]: (nil) -> nil }

        numObservers += 1
        local id = numObservers

        observers[id] = { changeFunc, validateFunc }

        -- return a disconnector function that .. disconnects the function
        return { disconnect = function()
            observers[id] = nil
        end }
    end

    
    -- set the initial value, if needed
    if (initialValue ~= nil) then
        self:set(initialValue)
    end

    return self
end



return value