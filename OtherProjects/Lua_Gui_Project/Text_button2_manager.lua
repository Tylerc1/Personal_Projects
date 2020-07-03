-- Text_button2 Manager
-- Tyler Cascalho Cox 


-- // This script manages player interactions with text_button2 // --


-- Makes Button expand and play sound clip when player hovers over it with cursor 
function hover_1()
	script.Parent:TweenSizeAndPosition(UDim2.new(1.05,0,0.425,0),UDim2.new(-0.025,0,1.489,0),out, quad, 0.025)

	script.Bubble:Play()

end

script.Parent.MouseEnter:Connect(hover_1)

-- Button shrinks when player's mouse stops hovering
function hover_2()
script.Parent:TweenSizeAndPosition(UDim2.new(1,0,0.375,0),UDim2.new(0,0,1.514,0),out, quad, 0.025)

end
script.Parent.MouseLeave:Connect(hover_2)

-- Sound is played when player clicks button
function clickerz()
	script.Click:Play()
end
script.Parent.MouseButton1Click:Connect(clickerz)w