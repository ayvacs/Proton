local Proton = require(script.Parent.Parent)


return {
    onEvent = function(eventName)
        return "*" .. eventName
    end,

    cleanup = "Destroying"
}