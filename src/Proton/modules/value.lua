local Proton = require(script.Parent.Parent)


local value = {}


value.new = function(initialValue: any, fixedType: any | nil, name: string | nil)
    -- create internal container
    local this = nil
    local isLocked = false
    local observers = {}
    local numObservers = 0

    -- create accessor & mutator for this value
    local ret = {
        __is_proton_value = true, -- internal value identification

        get = function(self): any
            return this or nil
        end,

        set = function(self, newValue: any): nil
            if (newValue == self:get()) then
                -- the value is the same; don't waste effort changing anything.
                return
            end

            -- check for lock
            if (isLocked) then
                return Proton.warn(
                    ("%* is locked!"):format(
                        (name or "This value")
                    )
                )
            end

            -- validate value type
            if (fixedType ~= nil) and (typeof(newValue) ~= fixedType) then
                return Proton.warn(
                    ("Could not set %*! (%* is not of type %*)"):format(
                        (name ~= nil
                            and ("the value of " .. tostring(name))
                            or "this value"),
                        ('"'..tostring(newValue)..'"' or "the new value"),
                        (tostring(fixedType) or "unknown type")
                    )
                )
            end

            -- if there are no errors, set the value
            local prevValue = self:get()
            this = newValue

            -- call incrementor functions if there are any
            for _, func in pairs(observers) do
                func(newValue, prevValue)
            end

            return nil
        end,

        increment = function(self, increment: any)
            local val = self:get()

            -- ensure the types of the new/old values match
            local incrementType = typeof(increment)
            local currentType = typeof(self:get())
            if incrementType ~= currentType then
                return Proton.warn(
                    ("Could not increment %*! (%* is not of type %*)"):format(
                        (name ~= nil
                            and ("the value of " .. tostring(name))
                            or "this value"),
                        ('"'..tostring(increment)..'"' or "the increment"),
                        ('"'..currentType..'"')
                    )
                )
            end

            -- increment the value
            if currentType == "string" then
                self:set(val .. increment)
                return
            end

            local succ = pcall(self.set, self, val + increment)
            if not succ then
                return Proton.warn(
                    ("Could not increment %*!"):format(
                        (name ~= nil
                            and ("the value of " .. tostring(name))
                            or "this value")
                    )
                )
            end

            return
        end,

        lock = function(self)   isLocked = true  end,
        unlock = function(self) isLocked = false end,

        onChange = function(changeFunc): { [string]: (nil) -> nil }
            numObservers += 1
            local id = numObservers

            observers[id] = changeFunc

            -- return a disconnector function that .. disconnects the function
            return {
                disconnect = function()
                    observers[id] = nil
                end
            }
        end
    }

    -- set initial value if needed
    if (initialValue ~= nil) then
        ret:set(initialValue)
    end

    return ret
end


return value