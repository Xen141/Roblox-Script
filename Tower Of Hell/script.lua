-- Tower of Hell cheat script with GUI

-- GUI code
local GUIEnabled = true -- Enable GUI by default

local GUI = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
GUI.Name = "TowerOfHellCheats"

local Frame = Instance.new("Frame", GUI)
Frame.Position = UDim2.new(1, -100, 1, -100)
Frame.Size = UDim2.new(0, 100, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Frame.Visible = GUIEnabled

local Fly = Instance.new("TextButton", Frame)
Fly.Position = UDim2.new(0, 10, 0, 10)
Fly.Size = UDim2.new(0, 80, 0, 20)
Fly.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Fly.Text = "Fly"
Fly.FontSize = Enum.FontSize.Size14

local TP = Instance.new("TextButton", Frame)
TP.Position = UDim2.new(0, 10, 0, 40)
TP.Size = UDim2.new(0, 80, 0, 20)
TP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TP.Text = "Teleport to Top"
TP.FontSize = Enum.FontSize.Size14

local Invincibility = Instance.new("TextButton", Frame)
Invincibility.Position = UDim2.new(0, 10, 0, 70)
Invincibility.Size = UDim2.new(0, 80, 0, 20)
Invincibility.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Invincibility.Text = "Invincibility"
Invincibility.FontSize = Enum.FontSize.Size14

-- Cheat code functions
local doFly = function()
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
end

local doTP = function()
    game:GetService("TeleportService"):Teleport(1962086868, game.Players.LocalPlayer)
end

local doInvincibility = function()
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(-math.huge)
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end

-- Activate/deactivate GUI visibility
local toggleGUI = function()
    if GUIEnabled then
        Frame.Visible = false
        GUIEnabled = false
    else
        Frame.Visible = true
        GUIEnabled = true
    end
end

-- Make player undetectable
game:GetService("Players").LocalPlayer.Character.Head.Name = "1"

-- Connect GUI buttons to cheat code functions
Fly.Activated:Connect(doFly)
TP.Activated:Connect(doTP)
Invincibility.Activated:Connect(doInvincibility)

-- Connect GUI visibility to toggle function
game:GetService("ContextActionService"):BindAction("ToggleGUI", toggleGUI, false, Enum.KeyCode.RightShift)

-- Make player constantly move to avoid appearing AFK
while wait() do
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.W, false, game:GetService("VirtualUser"))
    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.W, false, game:GetService("VirtualUser"))
end
