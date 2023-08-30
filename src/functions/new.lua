--[[

    The main function for creating UI instances.

]]


-- Special Properties code
-- If a property is unable to be set, first check if it is a "special" property (Child, Children, ...) and if not, error.
function AddSpecialProperties(instance, PropertyName, PropertyValue, initialError)
    if PropertyName == "Children" then
        for _, inst in pairs(PropertyValue) do
            pcall(function()
                PropertyValue.Parent = instance
            end)
        end
        return
    elseif PropertyName == "Connections" then
        for _, connection in pairs(PropertyValue) do
            pcall(function()
                instance[connection[1]]:Connect(connection[2])
            end)
        end
        return
    -- connections
    elseif string.sub(PropertyName, 1, 1) == "*" then
        pcall(function()
            instance[string.sub(PropertyName, 2, string.len(PropertyName))]:Connect(PropertyValue)
        end)
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