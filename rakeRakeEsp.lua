-- ESP do Rake com vida e distância
local player = game.Players.LocalPlayer

for _,v in pairs(workspace:GetDescendants()) do
    if v.Name == "Rake" and v:FindFirstChild("HumanoidRootPart") then
        local gui = Instance.new("BillboardGui", v.HumanoidRootPart)
        gui.Size = UDim2.new(0, 120, 0, 40)
        gui.AlwaysOnTop = true

        local txt = Instance.new("TextLabel", gui)
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.BackgroundTransparency = 1
        txt.TextColor3 = Color3.new(1, 0, 0)
        txt.TextScaled = true

        game:GetService("RunService").RenderStepped:Connect(function()
            if v:FindFirstChild("Humanoid") then
                local distance = (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                txt.Text = "RAKE\nHP: " .. math.floor(v.Humanoid.Health) .. "\nDist: " .. math.floor(distance) .. "m"
            end
        end)
    end
end
