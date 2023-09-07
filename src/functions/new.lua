--[[

    The main function for creating UI instances.

]]

local Proton = require(script.Parent.Parent)
Proton.print("print", "Loading module <new.lua>")

return function(className: string)
    return function(properties: table): Instance
        local success, inst = pcall(Instance.new, className)
        
        if (not success) or (not inst) then
            return nil, Proton.print("error", "Unable to create instance")
        end

        for propertyName, propertyValue in pairs(properties) do
            local success, err = pcall(function()
                inst[i] = v
            end)

            if (not success) then
                -- check for special property
                if propertyName == "Children" then
                    for _, target in pairs(propertyValue) do
                        local success = pcall(function()
                            target.Parent = inst
                        end)
                        if success and Proton.verboseEnabled() then
                            Proton.print("print", "Successfully parented " .. (target.Name or "?") .. " to " .. (inst.Name or "?"))
                        elseif not success then
                            Proton.print("warn", "Could not parent " .. (target.Name or "?") .. " to " .. (inst.Name or "?"))
                        end
                    end
                elseif propertyName == "Events" then
                    for _, event in pairs(propertyValue) do
                        local success = pcall(function()
                            inst[event[1]]:Connect(event[2])
                        end)
                        if success and Proton.verboseEnabled() then
                            Proton.print("print", "Successfully connected " .. (tostring(event[1]) or "?") .. " to " .. (inst.Name or "?") .. " via property")
                        elseif not success then
                            Proton.print("warn", "Could not connect " .. (tostring(event[1]) or "?") .. " to " .. (inst.Name or "?") .. " via property")
                        end
                    end
                    return
                -- Events
                elseif string.sub(propertyName, 1, 1) == "*" then
                    local eventName = string.sub(propertyName, 2, string.len(propertyName))
                    local success = pcall(function()
                        inst[eventName]:Connect(propertyValue)
                    end)
                    if success and Proton.verboseEnabled() then
                        Proton.print("print", "Successfully connected " .. (tostring(eventName) or "?") .. " to " .. (inst.Name or "?") .. " via asterisk")
                    elseif not success then
                        Proton.print("warn", "Could not connect " .. (tostring(eventName) or "?") .. " to " .. (inst.Name or "?") .. " via asterisk")
                    end
                    return
                else
                    return nil, Proton.print("error", "Unable to set property ("..(tostring(err) or "")..")")
                end
            end
        end

        return inst
    end
end