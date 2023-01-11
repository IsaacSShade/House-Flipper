
game.ReplicatedStorage.Events.DarkFlicker.OnClientEvent:Connect(function(tutorial, shadows)
	
	local remove = tutorial:FindFirstChild("Remove")
	
	
	shadows.Parent = tutorial
	remove.Parent = game.ReplicatedStorage
	

	wait(3)
	
	shadows:Destroy()
	remove.Parent = tutorial
	
	
end)

