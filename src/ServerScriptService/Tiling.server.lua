
local function FloorTiling(player, part, updown)
	local debounce = player:FindFirstChild("Debounce")
	local selectedtile = player:FindFirstChild("TileSelected").Value
	
	
	if part:FindFirstChild("Floor") and debounce.Value == false and selectedtile ~= "Nothing" then
		
		local success, response = pcall(function()
			if part:FindFirstChild("Floor").Position== nil then
				return
			end
		end)
		if not success then
			return
		end
		
		debounce.Value = true
		local falsestart = false
		
		--animating the tiling
		local direction = nil
		if updown == true then
			direction = "TilingUp"
		elseif updown == false then
			direction = "TilingDown"
		end
		
		--Seeing if player has enough money
		local money = player:FindFirstChild("leaderstats").Money
		if money.Value < 20 then
			debounce.Value = false
			return
		else
			if part.Parent:FindFirstChild("BonusHouseValue") == nil then
				print("House not bought")
				debounce.Value = false
				return
			end
			--if it's not already good floor, increase the value
			money.Value = money.Value - 20
			if part.Name ~= "Straight Wood" or part.Name ~= "Tiled Floor" or part.Name ~= "Carpet" then
				part.Parent.BonusHouseValue.Value = part.Parent.BonusHouseValue.Value + 20
			end
		end

		--Animating the tiling
		if part.Name ~= player:FindFirstChild("TileSelected").Value and part:FindFirstChild("Floor") ~= nil then
			local animator = game.Workspace:FindFirstChild(player.Name):FindFirstChild("Humanoid"):FindFirstChild("Animator")
			animator:LoadAnimation(animator.Parent.Parent:FindFirstChild("Tiler"):FindFirstChild(direction)):Play()
			
		end
		

		--removing previous tile
		if part.Name == "Basic Floor" then
			local tween = game:GetService("TweenService"):Create(part:FindFirstChild("Floor"), TweenInfo.new(1), {Color = Color3.fromRGB(36, 36, 36)})
			tween:Play()
			wait(1)
		elseif (part.Name == "Straight Wood" and player:FindFirstChild("TileSelected").Value ~= "Straight Wood") or part.Name == "CompletedStraightWood" then
			for i,v in pairs(part:GetChildren()) do
				if v.Name ~= "Floor" then
					local goal = {}
					local num = v.Position.Z - 1.95
					goal.Position = Vector3.new(v.Position.X, v.Position.Y, num)
					goal.Size = Vector3.new(v.Size.X, v.Size.Y, 0.1)
					local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(1), goal)
					tween:Play()
				end
			end
			wait(1)
			--Resize
			part.Floor.Size = Vector3.new(4,1,4)
			if updown == true then
				part:SetPrimaryPartCFrame(part.Floor.CFrame - Vector3.new(0, 0.038, 0))
			elseif updown == false then
				part:SetPrimaryPartCFrame(part.Floor.CFrame + Vector3.new(0, 0.038, 0))
			end
		elseif (part.Name == "Tiled Floor" and player:FindFirstChild("TileSelected").Value ~= "Tiled Floor") or part.Name == "CompletedTiledFloor" then
			for i,v in pairs(part:GetChildren()) do
				if v.Name ~= "Floor" then
					local goal = {}
					goal.Transparency = 1
					local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(0.5), goal)
					tween:Play()
					wait(0.0312)
				end
			end
			wait(0.5)
			--Resize
			part.Floor.Size = Vector3.new(4,1,4)
			if updown == true then
				part:SetPrimaryPartCFrame(part.Floor.CFrame - Vector3.new(0, 0.05, 0))
			elseif updown == false then
				part:SetPrimaryPartCFrame(part.Floor.CFrame + Vector3.new(0, 0.05, 0))
			end
		elseif (part.Name == "Carpet" and player:FindFirstChild("TileSelected").Value ~= "Carpet") or part.Name == "CompletedCarpet" then
			local carpet = part:FindFirstChild("Carpet")
			local num = carpet.Position.Z - 1.95
			local goal = {}
			goal.Position = Vector3.new(carpet.Position.X, carpet.Position.Y, num)
			goal.Size = Vector3.new(carpet.Size.X, carpet.Size.Y, 0.1)
			local tween = game:GetService("TweenService"):Create(carpet, TweenInfo.new(1), goal)
			tween:Play()
			wait(1)
			part.Floor.Size = Vector3.new(4,1,4)
			if updown == true then
				part:SetPrimaryPartCFrame(part.Floor.CFrame - Vector3.new(0, 0.05, 0))
			elseif updown == false then
				part:SetPrimaryPartCFrame(part.Floor.CFrame + Vector3.new(0, 0.05, 0))
			end
		else
			falsestart = true
		end
		

		if falsestart == false then
			
			--putting in new tile
			local pos1 = part:FindFirstChild("Floor").Position
			local frame1 = part:FindFirstChild("Floor").CFrame
			local newtile = nil

			local function tileupordown(name, vector)
				newtile = game.ReplicatedStorage.FloorTiles:FindFirstChild(name):Clone()
				newtile.Parent = part.Parent
				if (frame1.UpVector + pos1).Y < pos1.Y then
					newtile:SetPrimaryPartCFrame(frame1 + vector)
				else
					newtile:SetPrimaryPartCFrame(frame1 - vector)
				end
				part:Destroy()
			end
			
			if selectedtile == "Straight Wood" then
				tileupordown("Straight Wood", Vector3.new(0, 0.038, 0))
				for i,v in pairs(newtile:GetChildren()) do
					if v.Name ~= "Floor" then
						local goal = {}
						local num = v.Position.Z + 1.95
						goal.Position = Vector3.new(v.Position.X, v.Position.Y, num)
						goal.Size = Vector3.new(v.Size.X, v.Size.Y, 4)
						local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(2.5), goal)
						tween:Play()
					end
				end
				wait(2.5)

			elseif selectedtile == "Tiled Floor" then
				tileupordown("Tiled Floor",  Vector3.new(0, 0.05, 0))
				for i,v in pairs(newtile:GetChildren()) do
					if v.Name ~= "Floor" then
						local goal = {}
						goal.Transparency = 0
						local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(0.5), goal)
						tween:Play()
						wait(0.125)
					end
				end
				wait(0.5)
			elseif selectedtile == "Carpet" then
				tileupordown("Carpet", Vector3.new(0, 0.05, 0))
				local carpet = newtile:FindFirstChild("Carpet")
				local num = carpet.Position.Z + 1.95
				local goal = {}
				goal.Size = Vector3.new(carpet.Size.X, carpet.Size.Y, 4)
				goal.Position = Vector3.new(carpet.Position.X, carpet.Position.Y, num)
				local tween = game:GetService("TweenService"):Create(carpet, TweenInfo.new(2.5), goal)
				tween:Play()
				wait(2.5)
			end
			
		else

		end
		debounce.Value = false
	end
end
	
local function TileChange(player, tile)
	player:FindFirstChild("TileSelected").Value = tile
	player.PlayerGui:FindFirstChild("TileSelected").Frame.Tile.Text = tile
end


game.ReplicatedStorage.Events:FindFirstChild("TileChange").OnServerEvent:Connect(TileChange)
game.ReplicatedStorage.Events:FindFirstChild("Change Floor").OnServerEvent:Connect(FloorTiling)