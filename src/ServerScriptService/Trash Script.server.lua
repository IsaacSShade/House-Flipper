local function Trash(player, part)
	local debounce = player:FindFirstChild("Debounce")
	local plr = game.Workspace:FindFirstChild(player.Name)
	
	if debounce.Value == false then
		if part.Name == "Trash" then
			local leave = false
			
			--Making sure already picked up trash isn't causing problems for others
			local success, response = pcall(function()
				if part:FindFirstChild("Base").Position == nil then
					leave = true
				end
			end)
			if not success then
				return
			end
			print(response)
			
			local success2, response = pcall(function()
				if part:FindFirstChild("Base"):FindFirstChild("BodyPosition").Position ~= nil then
					leave = true
				end
			end)
			if success2 or leave == true then
				return
			end
			
			
			debounce.Value = true
			--Creating the rocket part to fly towards player
			for i,v in pairs(part:GetChildren()) do
				v.CanCollide = false
			end
			
			local rocket = Instance.new("BodyPosition")
			rocket.P = 5000
			rocket.MaxForce = Vector3.new (10, 10000, 10)
			rocket.Parent = part:FindFirstChild("Base")
			rocket.Position = plr:FindFirstChild("LowerTorso").Position
			rocket.Parent.Anchored = false

			local targetreached = false
			
			repeat
				rocket.Position = plr.LowerTorso.Position
				local pos = rocket.Parent.Position - plr.LowerTorso.Position
				if math.abs(pos.X) <= 0.2 and math.abs(pos.Z) <= 0.2 then
					targetreached = true
				end
				wait()
			until targetreached == true
			
			for i,v in pairs(part:GetChildren()) do
				if v:FindFirstChild("Decal") then
					local tween = game:GetService("TweenService"):Create(v:FindFirstChild("Decal"), TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Transparency = 0.95})
					tween:Play()
				end
				local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Transparency = 0.95})
				tween:Play()

			end
			
			
		--	local start = part:FindFirstChild("Base")
			--local info = TweenInfo.new(3, Enum.EasingStyle.Sine)
			--local goal = {}
			--goal.CFrame = plr:FindFirstChild("LowerTorso").CFrame 
			--goal.Transparency = 1
			--local tween = game:GetService("TweenService"):Create(start, info, goal)
			--tween:Play()
		--	wait(3)
			debounce.Value = false
			wait(0.5)
			part:Destroy()
		end
	else
		
	end
	
	
end

game.ReplicatedStorage.Events:FindFirstChild("Trash Time").OnServerEvent:Connect(Trash)
