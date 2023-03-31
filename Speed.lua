-- Speed Hax
-- Press Tab To Open
local screenGui = Instance.new("ScreenGui")
local speedFrame = Instance.new("Frame")
local speedLabel = Instance.new("TextLabel")
local speedTextBox = Instance.new("TextBox")
local applyButton = Instance.new("TextButton")
 
screenGui.Name = "SpeedUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 
speedFrame.Name = "SpeedFrame"
speedFrame.Parent = screenGui
speedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
speedFrame.Size = UDim2.new(0, 300, 0, 100)
 
speedLabel.Name = "SpeedLabel"
speedLabel.Parent = speedFrame
speedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Position = UDim2.new(0, 10, 0, 10)
speedLabel.Size = UDim2.new(0, 200, 0, 30)
speedLabel.Font = Enum.Font.SourceSans
speedLabel.Text = "Lasiv's SpeedHack"
speedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
speedLabel.TextSize = 20
 
speedTextBox.Name = "SpeedTextBox"
speedTextBox.Parent = speedFrame
speedTextBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
speedTextBox.Position = UDim2.new(0, 10, 0, 50)
speedTextBox.Size = UDim2.new(0, 200, 0, 20)
speedTextBox.Font = Enum.Font.SourceSans
speedTextBox.PlaceholderText = "Enter number of speed"
speedTextBox.Text = ""
speedTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
speedTextBox.TextSize = 14
speedTextBox.ClearTextOnFocus = false
 
applyButton.Name = "ApplyButton"
applyButton.Parent = speedFrame
applyButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
applyButton.Position = UDim2.new(0, 220, 0, 50)
applyButton.Size = UDim2.new(0, 70, 0, 20)
applyButton.Font = Enum.Font.SourceSans
applyButton.Text = "Apply"
applyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
applyButton.TextSize = 14
 
 
local function changeSpeed(value)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
end
 
applyButton.MouseButton1Down:Connect(function()
    local value = tonumber(speedTextBox.Text)
if value then
changeSpeed(value)
end
end)
 
speedTextBox.Changed:Connect(function(property)
if property == "Text" then
local value = tonumber(speedTextBox.Text)
if value then
changeSpeed(value)
end
end
end)
 
local toggleKey = Enum.KeyCode.Tab
local isUIOpen = false
 
game:GetService("UserInputService").InputBegan:Connect(function(input)
if input.KeyCode == toggleKey then
isUIOpen = not isUIOpen
screenGui.Enabled = isUIOpen
end
end)
 
screenGui.Enabled = false
 
game.Players.PlayerRemoving:Connect(function(player)
if player == game.Players.LocalPlayer then
screenGui:Destroy()
end
end)
