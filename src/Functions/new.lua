return function (className: string)
	return function(properties: table): Instance
		local success, inst = pcall(Instance.new, className)
		
		if not (success and inst) then
			return warn("Unable to create instance")
		end
		
		for i, v in pairs(properties) do
			local success, err = pcall(function()
				inst[i] = v
			end)
			
			if not success then
				warn(err)
			end
		end

		return inst
	end
end