-- UI Close script
-- Tyler Cascalho Cox


-- // This script closes the UI when clicked // --

function click()
	local button = script.Parent
	script.Parent.Parent.Parent:Destroy()
end

script.Parent.MouseButton1Click:Connect(click)