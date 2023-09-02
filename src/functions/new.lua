--[[

    The main function for creating UI instances.

]]

local Proton = require(script.Parent.Parent)
Proton.print("print", "Loading module <new.lua>")

-- Special Properties code
-- If a property is unable to be set, first check if it is a "special" property (Child, Children, ...) and if not, error.
function AddSpecialProperties(inst, propertyName: string, propertyValue: string, err)
    
end


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
                    for _, inst in pairs(propertyValue) do
                        local success = pcall(function()
                            inst.Parent = inst
                        end)
                        if success and Proton.verboseEnabled() then
                            Proton.print("print", "Successfully parented " .. (inst.Name or tostring(inst) or "?") .. " to " .. (inst.Name or tostring(inst) or "?"))
                        end
                    end
                elseif propertyName == "Connections" then
                    for _, connection in pairs(propertyValue) do
                        local success = pcall(function()
                            inst[connection[1]]:Connect(connection[2])
                        end)
                        if success and Proton.verboseEnabled() then
                            Proton.print("print", "Successfully connected " .. (tostring(connection[1]) or "?") .. " to " .. (inst.Name or tostring(inst) or "?") .. " via property")
                        end
                    end
                    return
                -- connections
                elseif string.sub(propertyName, 1, 1) == "*" then
                    local connectionName = string.sub(propertyName, 2, string.len(propertyName))
                    local success = pcall(function()
                        inst[connectionName]:Connect(propertyValue)
                    end)
                    if success and Proton.verboseEnabled() then
                        Proton.print("print", "Successfully connected " .. (tostring(connectionName) or "?") .. " to " .. (inst.Name or tostring(inst) or "?") .. " via asterisk")
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