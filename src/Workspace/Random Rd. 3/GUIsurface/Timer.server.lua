
while wait(1) do
	while wait(1) and script.Parent.Seconds.Value ~= 0 do
		script.Parent.Seconds.Value = script.Parent.Seconds.Value - 1
	end
end