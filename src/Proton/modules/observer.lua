local Proton = require(script.Parent.Parent)


local observer = {}


observer.new = function(value, changeFunc)
    -- ensure the value is a Proton value
    if not (
        value.get
        and value.set
        and value.increment
        and value.lock
        and value.unlock
    ) then
        return Proton.warn("This is not a Proton value!")
    end

    -- hook the function and return a disconnector
    local disconnector = value:onChange(changeFunc)
    return {
        disconnect = function(self)
            disconnector.disconnect()
        end
    }
end


return observer