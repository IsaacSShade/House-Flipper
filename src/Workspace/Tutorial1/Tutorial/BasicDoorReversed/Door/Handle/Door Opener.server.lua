script.Parent.ClickDetector.MouseClick:Connect(function(player)
	if script:FindFirstChild("Value") then
		
	else
		if script.Parent.ClickDetector:FindFirstChild("Locked") then
			if script.Parent.ClickDetector:FindFirstChild("PlayerName").Value == player.Name then
				if script.Parent.ClickDetector.Locked.Value == true then
					script.Parent.Anchored = false
					script.Parent.ClickDetector.Locked.Value = false
				elseif script.Parent.ClickDetector.Locked.Value == false then
					script.Parent.Anchored = true
					script.Parent.ClickDetector.Locked.Value = true
				end
			end
		else
			local value = Instance.new("BoolValue")
			value.Parent = script
			local plr = game.Workspace:FindFirstChild(player.Name)
			local spring = Instance.new("SpringConstraint")
			spring.Parent = script.Parent
			
			spring.Attachment0 = script.Parent.Parent.Door["Spring Attatchment"]
			spring.Attachment1 = plr.HumanoidRootPart.RootRigAttachment
			spring.Damping = 0
			spring.FreeLength = 0.01
			spring.MaxForce = 100000000
			spring. Stiffness = 60
			wait(1)
			script.Parent.Anchored = true
			spring:Destroy()
			wait(0.7)
			script.Parent.Anchored = false
			value:Destroy()
		end
	end
end)
