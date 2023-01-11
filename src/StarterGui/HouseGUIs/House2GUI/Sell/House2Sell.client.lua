script.Parent.Activated:Connect(function()
	
	local player = game.Players.LocalPlayer
	local Money = player.leaderstats.Money
	local event = game.ReplicatedStorage.Events.SellingHouse
	local Adornee = script.Parent.Parent.Adornee
	
	--Only thing to customize below
	local House = "House2"
	
	event:FireServer(Money, House, Adornee)
end)
