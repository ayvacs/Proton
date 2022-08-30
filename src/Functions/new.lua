local Proton = script.Parent.Parent

local LogError = Proton.Utilities.LogError


return function (className: string)
	return function(properties: table): Instance
		local success, inst = pcall(Instance.new, className)
		
		if not (success and inst) then
			return LogError("Unable to create instance", success, inst)
		end
		
		for i, v in pairs(properties) do
			pcall(function()
				inst[i] = v
			end)
		end

		return inst
	end
end