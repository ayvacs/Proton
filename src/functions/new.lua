--[[

    The main function for creating UI instances.

]]


-- Special Properties code
-- If a property is unable to be set, first check if it is a "special" property (Child, Children, ...) and if not, error.
function AddSpecialProperties(data: table)
    if data.i == "Child" then
        pcall(function()
            data.v.Parent = data.inst
        end)
        return
    end
    
    if data.i == "Children" then
        for _, inst in pairs(data.v) do
            pcall(function()
                data.v.Parent = data.inst
            end)
        end
        return
    end

    warn(data.err)
    return nil, warn("Unable to set property, " .. (tostring(err) or ""))
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
                AddSpecialProperties({inst = inst, i = i, v = v, err = err})
            end
        end

        return inst
    end
end