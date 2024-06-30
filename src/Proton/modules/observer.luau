local Proton = require(script.Parent.Parent)


local observer = {}


observer.new = function(
    value: any,
    changeFunc: (any) -> any,
    validateFunc: ((any) -> any)
): { [string]: (nil) -> nil }

    -- ensure the value is a Proton value (this can technically be bypassed but who cares)
    if not (value.__is_proton_value) then
        Proton.error("This is not a Proton value!")
    end

    -- hook the function and return a disconnector
    local disconnector = value:onChange(changeFunc, validateFunc)
    return { disconnect = function(self)
        disconnector.disconnect()
    end }
end


return observer