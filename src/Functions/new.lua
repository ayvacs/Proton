--[[

	Proton
	<src/Functions/new.lua>
	
	Returns Proton.new(), the main function for creating UI instances.

]]


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
			local success = pcall(function()
				data.inst[conn[1]]:Connect(conn[2])
			end)

			if not success then
				warn("Unable to connect")
			end
		end
		return
	end
	
	warn(data.err)
end


return function (className: string)
	return function(properties: table): Instance
		local success, inst = pcall(Instance.new, className)
		
		if not success and inst then
			return warn("Unable to create instance")
		end
		
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