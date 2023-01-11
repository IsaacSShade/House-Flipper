script.Parent.ProximityPrompt.Triggered:Connect(function(player)
	
	local adjust = 0
	local lock = script.Parent.Parent.Lock
	
	--finding connected door
	local door = nil
	local radius = Instance.new("Part")
	radius.Transparency = 1
	radius.Shape = Enum.PartType.Ball
	radius.Size = Vector3.new(0.7, 0.7, 0.7)
	radius.Parent = script.Parent.Parent
	radius.Position = script.Parent.Parent:FindFirstChild("Door Lock").Position
	
	for i,v in pairs(radius:GetTouchingParts()) do
		if v.Parent:IsA("Model") and v.Parent.Name == "Door" then
			door = v.Parent
		end
	end

	radius:Destroy()
	
	if door == nil then
		return
	end
	
	
	local click = door:FindFirstChild("Handle"):FindFirstChild("ClickDetector")
	if script.Parent.Side.Value == true then
		--if lock is left go right
		adjust = 0.7
		local value = click:FindFirstChild("Locked")
		if value.Value then
			value.Parent.Parent.Anchored = false
		end
		click:FindFirstChild("PlayerName"):Destroy()
		value:Destroy()
		script.Parent.Side.Value = false
		
	elseif script.Parent.Side.Value == false then
		--if lock is right go left
		adjust = -0.7
		local playername = Instance.new("StringValue")
		playername.Name = "PlayerName"
		playername.Value = player.Name
		playername.Parent = click
		local value = Instance.new("BoolValue")
		value.Parent = click
		value.Name = "Locked"
		value.Value = false
		
		script.Parent.Side.Value = true
	end
	
	local goal = {}
	goal.CFrame = lock.CFrame * CFrame.new(adjust, 0, 0)
	local tween = game:GetService("TweenService"):Create(lock, TweenInfo.new(0.2, Enum.EasingStyle.Sine), goal)
	tween:Play()
	
end)
