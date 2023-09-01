-- Proton UI library
-- Copyright (c) 2023 ayvacs
VERSION = "beta 0.04"

-- Documentation:
-- https://ave.is-a.dev/Proton

local Proton = {}
local verbose = false


Proton.print = function(mode: string, content)
    return print("[Proton] [" .. ((({
        ["print"] = "*",
        ["warn"] = "?",
        ["error"] = "!"
    })[mode]) or "?") .. "] " .. (tostring(content) or "?"))
end

Proton.require = function(name: string)
    return require(script.functions[name])
end

Proton.verbose = function(set: bool): bool
    if (set == true) or (set == false) then
        Proton.print("print", "Toggled verbose mode (" .. tostring(set) .. "->" .. tostring(not set) .. ")")
        verbose = set
        return true
    end
    return false
end

Proton.verboseEnabled = function(): bool
    return verbose
end


Proton.print("print", "Loaded Proton " .. VERSION)
Proton.print("print", "https://ave.is-a.dev/Proton")
print(" ")
return Proton