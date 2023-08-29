-- Proton UI library

local Proton = {}


Proton.require = function(name: string)
    return require(script.Parent.functions[name])
end


return Proton