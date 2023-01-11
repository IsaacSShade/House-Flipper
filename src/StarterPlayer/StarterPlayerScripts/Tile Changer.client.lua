game:GetService("UserInputService").InputBegan:Connect(function(input, gameprocessedevent)
	local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("TileSelected")
	if gui.Frame.Visible == true then
		local direction = nil
		if input.KeyCode == Enum.KeyCode.E and not gameprocessedevent then
			direction = true
		elseif input.KeyCode == Enum.KeyCode.Q and not gameprocessedevent then
			direction = false
		end
		
		if direction == true or direction == false then
			local tile = nil
			if gui.Frame.Tile.Text == "Nothing" then
				if direction == true then
					tile = "Straight Wood"
				elseif direction == false then
					tile = "Tiled Floor"
				end
			elseif gui.Frame.Tile.Text == "Straight Wood" then
				if direction == true then
					tile = "Carpet"
				elseif direction == false then
					tile = "Tiled Floor"
				end
			elseif gui.Frame.Tile.Text == "Tiled Floor" then
				if direction == true then
					tile = "Straight Wood"
				elseif direction == false then
					tile = "Carpet"
				end
			elseif gui.Frame.Tile.Text == "Carpet" then
				if direction == true then
					tile = "Tiled Floor"
				elseif direction == false then
					tile = "Straight Wood"
				end
			end
			
			game.ReplicatedStorage.Events:FindFirstChild("TileChange"):FireServer(tile)
		end
	end

end)

