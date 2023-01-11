script.Parent.Activated:Connect(function()
	
	script.Parent.BackgroundTransparency = 0
	local player = game.Players.LocalPlayer
	local Money = player.leaderstats.Money
	local event = game.ReplicatedStorage.Events.BuyingHouse
	local Adornee = script.Parent.Parent.Adornee
	
	--Only thing to Customize below
	local Basecoord = Vector3.new(-66.8, 120.5, 30)
	local House = "House3"
	local angle = 90
	
	event:FireServer(Money, House, Basecoord, Adornee, angle)
	
	wait(0.2)
	script.Parent.BackgroundTransparency = 1
end)
