-- ESP dos jogadores com vida e distância
local player = game.Players.LocalPlayer

for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local gui = Instance.new("BillboardGui", plr.Character.HumanoidRootPart)
        gui.Size = UDim2.new(0, 120, 0, 40)
        gui.AlwaysOnTop = true

        local txt = Instance.new("TextLabel", gui)
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.BackgroundTransparency = 1
        txt.TextColor3 = Color3.fromRGB(0, 255, 0)
        txt.TextScaled = true

        game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                txt.Text = plr.Name .. "\nHP: " .. math.floor(plr.Character.Humanoid.Health) .. "\nDist: " .. math.floor(dist) .. "m"
            end
        end)
    end
end
