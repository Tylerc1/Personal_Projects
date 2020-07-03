-- UI giver
-- Tyler Cascalho Cox


-- //  This script clones a copy of the defult UI template into the players inventory when clicked // --

function GoForth(player)
	local h = player
	print(h)
	local name = h.Name
	script.Parent.TextUI:Clone().Parent = game.Players:FindFirstChild(name).PlayerGui
end

script.Parent.ClickDetector.MouseClick:Connect(GoForth)
