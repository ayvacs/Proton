-- Proton UI library
-- Copyright (c) 2023 ayvacs

-- Documentation:
-- https://ave.is-a.dev/Proton

local Proton = {}


Proton.require = function(name: string)
    return require(script.Parent.functions[name])
end


return Proton