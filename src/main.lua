-- Proton UI library
-- Copyright (c) 2023 ayvacs

-- Documentation:
-- https://ave.is-a.dev/Proton

local Proton = {}
local verbose = false


Proton.require = function(name: string)
    return require(script.functions[name])
end

Proton.verbose = function(set: bool)
    if (set == true) or (set == false) then
        verbose = set
        return true
    end
    return false
end

Proton.verboseEnabled = function()
    return verbose
end

Proton.print = function(mode: string, content)
    return print("[" .. ((({
        ["print"] = "*",
        ["warn"] = "?",
        ["error"] = "!"
    })[mode]) or "?") .. "] " .. (tostring(content) or "?"))
end


return Proton