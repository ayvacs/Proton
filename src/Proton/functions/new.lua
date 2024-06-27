local Proton = require(script.Parent.Parent)
Proton.print(("Loading module <%s>"):format(script.Name))


-- Attempt to create an instance of this class
function attemptCreateInstance(className: string): Instance
    local success, inst = pcall(Instance.new, className)
    if (not success) or (not inst) then
        Proton.error("Unable to create instance of " .. (className) .. " type")
    end

    return inst
end

-- Attempt to set property of this instance
function attemptSetInstanceProperty(inst: Instance, propertyName: string, propertyValue: any): nil
    local success = pcall(function() inst[propertyName] = propertyValue end)
    if (not success) then
        Proton.warn(("Unable to set instance.%s = %s"):format(
            propertyName, (tostring(propertyValue) or "(could not convert to string")
        ))
    end
    return nil
end

-- Attempt to parent this instance to another
function attemptParentInstance(target: Instance, newParent: Instance)
    local success = pcall(function() target.Parent = newParent end)
    if (not success) then
        Proton.warn(("Could not parent %s to %s"):format(
            (target.Name or "?"), (newParent.Name or "?")
        ))
    end
end



-- Create a new UI instance

return function(className: string)
    return function(properties: { string: any }): Instance

        -- Attempt to create the instance
        local inst = attemptCreateInstance(className)

        -- Apply all properties
        for pName: string, pValue: any in pairs(properties) do
            
            -- Check for special properties
            if pName == "Child" then
                attemptParentInstance(pValue, inst)
            elseif pName == "Children" then
                for _, target in pairs(pValue) do
                    attemptParentInstance(target, inst)
                end
            else
                -- This is not a special property
                attemptSetInstanceProperty(inst, pName, pValue)
            end
        end

        return inst
    end
end