script.Parent.Activated:Connect(function()
	
	script.Parent.BackgroundTransparency = 0
	local player = game.Players.LocalPlayer
	local Money = player.leaderstats.Money
	local event = game.ReplicatedStorage.Events.BuyingLevel
	local Adornee = script.Parent.Parent.Adornee
	
	--Only thing to Customize below
	local Basecoord = Vector3.new(43, 119.65, 159)
	local House = "Tutorial"
	local number = "1"
	local angle = 0
	
	event:FireServer(Money, House, number, Basecoord, Adornee, angle)
	
	wait(0.2)
	script.Parent.BackgroundTransparency = 1
end)
