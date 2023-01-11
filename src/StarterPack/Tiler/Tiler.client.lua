script.Parent.Equipped:Connect(function(Mouse)
	local updown = nil
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("TileSelected").Frame.Visible = true
	Mouse.Button1Down:Connect(function()
		updown = false
		local mousepos = game:GetService("UserInputService"):GetMouseLocation()
		local posray = game.Workspace.CurrentCamera:ViewportPointToRay(mousepos.X, mousepos.Y, 0)
		local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.Position, (posray.Direction * 1000))
		local player = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
		local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player})

		
		if part.Position.Y > player.HumanoidRootPart.Position.Y then
			updown = true
		end
		
		if part.Parent:IsA("Model") then
			part = part.Parent
		end

		if part.Name == "Wall" then
			print("Wall")
		elseif part.Name == "Trash" then
			
		end
		
		game.ReplicatedStorage.Events:FindFirstChild("Change Floor"):FireServer(part, updown)
	end)

end)

script.Parent.Unequipped:Connect(function()
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("TileSelected").Frame.Visible = false
end)