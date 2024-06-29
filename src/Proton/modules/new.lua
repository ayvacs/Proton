local Proton = require(script.Parent.Parent)


-- Attempt to create an instance of this class
function attemptCreateInstance(className: string): Instance
    local success, inst = pcall(Instance.new, className)
    if (not success) or (not inst) then
        Proton.error("Unable to create instance of " .. className .. " type")
    end

    return inst
end

-- Attempt to set property of this instance
function attemptSetInstanceProperty(inst: Instance, propertyName: string, propertyValue: any)
    local success = pcall(function() inst[propertyName] = propertyValue end)
    if (not success) then
        Proton.warn(("Unable to set instance.%s = %s"):format(
            propertyName, (tostring(propertyValue) or "(non-string value)")
        ))
    end
end

-- Attempt to parent this instance to another
function attemptParentInstance(target: Instance, newParent: Instance)
    local success = pcall(function() target.Parent = newParent end)
    if (not success) then
        Proton.warn(("Could not parent %s to %s"):format(
            target.Name, newParent.Name
        ))
    end
end

-- Attempt to connect this event to the instance
function attemptConnectEvent(inst: Instance, eventData: { any })
    local eventName: string, eventFunction = unpack(eventData)
    local event: RBXScriptSignal = inst[eventName]

    if (not event) then
        Proton.warn(("Event %s of %s does not exist"):format(
            eventName, inst.Name
        ))
    end

    local success = pcall(function()
        event:Connect(eventFunction)
    end)

    if (not success) then
        Proton.warn(("Could not connect %s to %s"):format(
            eventName, inst.Name
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

            elseif pName:sub(1, 1) == "*" then

                local eventName = pName:sub(2)
                attemptConnectEvent(inst, { eventName, pValue })

            elseif pName == "Events" then

                for eventName, eventFunction in pairs(pValue) do
                    attemptConnectEvent(inst, { eventName, eventFunction })
                end

            else
                -- This is not a special property
                attemptSetInstanceProperty(inst, pName, pValue)
            end
        end

        return inst
    end
end