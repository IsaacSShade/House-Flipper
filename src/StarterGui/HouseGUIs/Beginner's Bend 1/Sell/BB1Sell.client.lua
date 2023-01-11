script.Parent.Activated:Connect(function()
	
	local player = game.Players.LocalPlayer
	local Money = player.leaderstats.Money
	local event = game.ReplicatedStorage.Events.SellingHouse
	local Adornee = script.Parent.Parent.Adornee
	
	--Only thing to customize below
	local House = "Tutorial"
	local num = "1"
	local Basecoord = Vector3.new(43, 119.65, 159)
	local angle = 0
	
	event:FireServer(Money, House, Adornee, num, Basecoord, angle)
end)
