local function Clean(player, part, updown)
	local debounce = player:FindFirstChild("Debounce")
	local direction = nil
	
	if updown == true then
		direction = "SpongeUp"
	elseif updown == false then
		direction = "SpongeDown"
	end
	
	if part.Name == "Mess" and debounce.Value == false then
		print("Here")
		
		local success, response = pcall(function()
			if part.Position == nil then
				return
			end
		end)
		
		if not success then
			return
		end
		
		debounce.Value = true
		local animator = game.Workspace:FindFirstChild(player.Name):FindFirstChild("Humanoid"):FindFirstChild("Animator")
		animator:LoadAnimation(animator.Parent.Parent:FindFirstChild("Sponge"):FindFirstChild(direction)):Play()
		local tween = game:GetService("TweenService"):Create(part.Decal, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 1})
		tween:Play()
		wait(3)
		debounce.Value = false
		wait(2)
		part:Destroy()

	end
end
	
game.ReplicatedStorage.Events:FindFirstChild("Cleaning").OnServerEvent:Connect(Clean)