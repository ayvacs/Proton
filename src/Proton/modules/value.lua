local Proton = require(script.Parent.Parent)


local value = {}


value.new = function(initialValue: any, fixedType: any | nil, name: string | nil)
    -- create internal container
    local this = nil
    local isLocked = false

    -- create accessor & mutator for this value
    local ret = {
        get = function(self): any
            return this or nil
        end,

        set = function(self, newValue: any): nil
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
            this = newValue
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
        unlock = function() isLocked = false end
    }

    -- set initial value if needed
    if (initialValue ~= nil) then
        ret:set(initialValue)
    end

    return ret
end


return value