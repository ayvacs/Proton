--[[

    The main function for creating UI instances.

]]

local Proton = require(script.Parent.Parent)
Proton.print("print", "Loading module <new.lua>")

-- Special Properties code
-- If a property is unable to be set, first check if it is a "special" property (Child, Children, ...) and if not, error.
function AddSpecialProperties(instance, PropertyName: string, PropertyValue: string, initialError)
    if PropertyName == "Children" then
        for _, inst in pairs(PropertyValue) do
            local success = pcall(function()
                inst.Parent = instance
            end)
            if success and Proton.verboseEnabled() then
                Proton.print("warn", "Successfully parented " .. (inst.Name or tostring(inst) or "?") .. " to " .. (instance.Name or tostring(instance) or "?"))
            end
        end
        return
    elseif PropertyName == "Connections" then
        for _, connection in pairs(PropertyValue) do
            local success = pcall(function()
                instance[connection[1]]:Connect(connection[2])
            end)
            if success and Proton.verboseEnabled() then
                Proton.print("warn", "Successfully connected " .. (tostring(connection[1]) or "?") .. " to " .. (instance.Name or tostring(instance) or "?") .. " via property")
            end
        end
        return
    -- connections
    elseif string.sub(PropertyName, 1, 1) == "*" then
        local connectionName = string.sub(PropertyName, 2, string.len(PropertyName))
        local success = pcall(function()
            instance[connectionName]:Connect(PropertyValue)
        end)
        if success and Proton.verboseEnabled() then
            Proton.print("warn", "Successfully connected " .. (tostring(connectionName) or "?") .. " to " .. (instance.Name or tostring(instance) or "?") .. " via asterisk")
        end
        return
    end

    return nil, warn("Unable to set property ("..(tostring(initialError) or "")..")")
end


return function(className: string)
    return function(properties: table): Instance
        local success, inst = pcall(Instance.new, className)
        
        if (not success) or (not inst) then
            return nil, warn("Unable to create instance")
        end

        for i, v in pairs(properties) do
            local success, err = pcall(function()
                inst[i] = v
            end)

            if (not success) then
                AddSpecialProperties(inst, i, v, err)
            end
        end

        return inst
    end
end