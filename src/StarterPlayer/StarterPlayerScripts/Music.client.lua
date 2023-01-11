local Jazz = 1109561654
local Symphony = 334158189
local Smooth = 2160811776
local Wii = 878410091
local Pokemon = 150491031


local Music = game.Workspace["Background Music"]

while true do
	local number = math.random(1, 5)
	if number == 1 then
		Music.SoundId = "rbxassetid://"..Jazz
		Music.Volume = 0.5
	elseif number == 2 then
		Music.SoundId = "rbxassetid://"..Symphony
		Music.Volume = 0.5
	elseif number == 3 then
		Music.SoundId = "rbxassetid://"..Smooth
		Music.Volume = 0.5
	elseif number == 4 then
		Music.SoundId = "rbxassetid://"..Wii
		Music.Volume = 0.5
	elseif number == 5 then
		Music.SoundId = "rbxassetid://"..Pokemon
		Music.Volume = 0.5
	end
	Music:Play()
	Music.Ended:wait()
end
