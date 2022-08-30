--[[

	Proton
	<src/Functions/new.lua>
	
	Returns Proton.new(), the main function for creating UI instances.

]]


-- Function used by new().
-- If a property is unable to be set, first check if it is a "special" property (Child, Children, ...) and if not, error.
function brakeCheck(data)
	
	if data.i == "Child" then
		data.v.Parent = data.inst
		return
	end
	
	if data.i == "Children" then
		for _, inst in pairs(data.v) do
			inst.Parent = data.inst
		end
		return
	end
	
	if data.i == "Connections" then
		for _, conn in pairs(data.v) do
			pcall(function()
				data.inst[conn[1]]:Connect(function(...)
					conn[2](data.inst, ...)
				end)
			end)
		end
		return
	end
	
	warn(data.err)
end


new = function (className: string)
	-- Return a function, since parentheses-less functions must have only one argument, this bypasses that.
	return function(properties: table): Instance
		local success, inst = pcall(Instance.new, className)
		
		-- If unable to create the instance:
		if not (success and inst) then
			return warn("Unable to create instance")
		end
		
		-- Apply properties
		for i, v in pairs(properties) do
			local success, err = pcall(function()
				inst[i] = v
			end)
			
			-- If a property is unable to be set, first check if it is a "special" property (Child, Children, ...) and if not, error.
			if not success then
				brakeCheck { inst = inst, i = i, v = v, err = err }
			end
		end

		return inst
	end
end

return new