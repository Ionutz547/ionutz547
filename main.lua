-- [[ AXION SCRIPT - THE FORGE MODULE ]] --
print("The Forge Script a fost incarcat cu succes!")

-- Notificare de confirmare in joc
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Axion Script",
    Text = "Module: The Forge activat!",
    Duration = 5
})

-- [[ FUNCTII DE BAZA ]] --

-- 1. WalkSpeed & JumpPower (Viteza si Saritura)
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.WalkSpeed = 50 -- Schimba viteza de miscare (default e 16)
humanoid.JumpPower = 100 -- Schimba puterea sariturii (default e 50)
humanoid.UseJumpPower = true

-- 2. Infinite Jump (Saritura infinita)
UserInputService.JumpRequest:Connect(function()
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)

-- 3. ESP Simplu (Vezi jucatorii prin pereti)
local function createESP(p)
    if p ~= player then
        local highlight = Instance.new("Highlight")
        highlight.Name = "AxionESP"
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        
        local function applyESP(char)
            highlight.Parent = char
        end
        
        if p.Character then applyESP(p.Character) end
        p.CharacterAdded:Connect(applyESP)
    end
end

-- Aplica ESP pentru jucatorii actuali si cei noi
for _, v in pairs(game.Players:GetPlayers()) do createESP(v) end
game.Players.PlayerAdded:Connect(createESP)

print("Toate functiile au fost activate!")