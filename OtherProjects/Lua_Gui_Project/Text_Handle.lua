
-- Main Text Manager Script for UI 
--Tyler Cascalho Cox




-- // This script manages the text on the UI // --


-- // 					Notes					  // --
-- //                                             // --
-- // Wait statements take seconds as an argument // --
-- //                                             // --




-- Setting up initials

local str = "Hello Human"
local current = ""
local t = {}



--Looping though string printing it out letter by letter
for i = 1, #str do
	    t[i] = str:sub(i, i)
	current = current .. t[i]
	script.Parent.TextBox1.Text = current
	script.Parent.Click:Play()
	wait(0.05)
end

wait (1)

local str2 = "What brings you here ..."
current = ""
t = {}


for i = 1, #str2 do
	    t[i] = str2:sub(i, i)
	current = current .. t[i]
	script.Parent.TextBox2.Text = current
	script.Parent.Click:Play()
	wait(0.05)
end

wait(1)

--Moving Frame up to make room for responses 
local Frame = script.Parent
Frame:TweenPosition(UDim2.new(0.319,0,0.67,0))
Frame.selection1:TweenPosition(UDim2.new(0,0,1.072,0))
Frame.selection2:TweenPosition(UDim2.new(0,0,1.514,0))
wait(2)

-- Printing possible responses on Ui buttons
local str3 = "What?!"
current = ""
t = {}

for i = 1, #str3 do
	    t[i] = str3:sub(i, i)
	current = current .. t[i]
	script.Parent.selection1.Text = current
	script.Parent.Click:Play()
	wait(0.05)
end
 wait(1)

local str4 = "Who... or what are you?"
local current = ""
local t = {}

for i = 1, #str4 do
	    t[i] = str4:sub(i, i)
	current = current .. t[i]
	script.Parent.selection2.Text = current
	script.Parent.Click:Play()
	wait(0.05)
end

--Enabling other scripts and UI elements 
script.Parent.selection1.LocalScript.Disabled = false
script.Parent.selection1.Active = true
script.Parent.selection1.AutoButtonColor = true

script.Parent.selection2.LocalScript.Disabled = false
script.Parent.selection2.Active = true
script.Parent.selection2.AutoButtonColor = true

script.Parent.selection2.Modal = true

