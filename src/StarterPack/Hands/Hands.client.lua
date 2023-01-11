script.Parent.Equipped:Connect(function(Mouse)
	
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("SelectFurniture").Enabled = true
	
	Mouse.Button1Down:Connect(function()
		local mousepos = game:GetService("UserInputService"):GetMouseLocation()
		local posray = game.Workspace.CurrentCamera:ViewportPointToRay(mousepos.X, mousepos.Y, 0)
		local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.Position, (posray.Direction * 1000))
		local player = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
		local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player})
		
		if part.Parent:IsA("Model") then
			part = part.Parent
		end
		
		game.ReplicatedStorage.Events:FindFirstChild("Trash Time"):FireServer(part)
	end)

end)
 
script.Parent.Unequipped:Connect(function()
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("SelectFurniture").Enabled = false
end)