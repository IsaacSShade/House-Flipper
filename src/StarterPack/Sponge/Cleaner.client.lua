script.Parent.Equipped:Connect(function(Mouse)
	Mouse.Button1Down:Connect(function()
		local mousepos = game:GetService("UserInputService"):GetMouseLocation()
		local posray = game.Workspace.CurrentCamera:ViewportPointToRay(mousepos.X, mousepos.Y, 0)
		local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.Position, (posray.Direction * 1000))
		local updown = false
		local player = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
		local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player})
		
		if part.Position.Y > player.HumanoidRootPart.Position.Y then
			updown = true
		end
		
		if part.Name == "Mess" then
			game.ReplicatedStorage.Events:FindFirstChild("Cleaning"):FireServer(part, updown)
		end

	end)


end)
