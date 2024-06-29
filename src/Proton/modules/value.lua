local Proton = require(script.Parent.Parent)


local value = {}


value.new = function(initialValue: any, fixedType: any | nil, name: string | nil)
    -- create internal container
    local this = nil
    local isLocked = false
    local incrementorFunctions = {}
    local numIncrementors = 0

    -- create accessor & mutator for this value
    local ret = {
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
            for _, func in pairs(incrementorFunctions) do
                func(newValue, prevValue)
            end

            return nil
        end,

        increment = function(self, increment: number): nil
            local val = self:get()

            -- ensure the value is a number
            if typeof(tonumber(val)) ~= "number" then
                return Proton.warn(
                    ("Could not increment %*! (%* is not of type number)"):format(
                        (name ~= nil
                            and ("the value of " .. tostring(name))
                            or "this value"),
                        ('"'..tostring(increment)..'"' or "the increment")
                    )
                )
            end

            -- increment the value
            self:set(val + increment)
            return nil
        end,

        lock = function()   isLocked = true  end,
        unlock = function() isLocked = false end,

        onChange = function(self, changeFunc)
            numIncrementors += 1
            local id = numIncrementors

            incrementorFunctions[id] = changeFunc

            -- return a disconnector function that .. disconnects the function
            return {
                disconnect = function()
                    incrementorFunctions[id] = nil
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