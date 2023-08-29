--[[

    Returns Proton.new(), the main function for creating UI instances.

]]

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
                return nil, warn("Unable to set property, " .. (tostring(err) or ""))
            end
        end

        return inst
    end
end