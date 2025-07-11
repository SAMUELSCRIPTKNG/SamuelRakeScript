-- Samuel Creator Hub - The Rake Remastered
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local uis = game:GetService("UserInputService")

-- Criar botão de abrir/fechar
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 100, 0, 30)
Toggle.Position = UDim2.new(0, 10, 0, 10)
Toggle.Text = "Abrir Hub"
Toggle.BackgroundColor3 = Color3.new(0, 0.5, 1)
Toggle.TextColor3 = Color3.new(1, 1, 1)

-- Frame principal
MainFrame.Size = UDim2.new(0, 200, 0, 400)
MainFrame.Position = UDim2.new(0, 10, 0, 50)
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

UIListLayout.Parent = MainFrame
UIListLayout.Padding = UDim.new(0, 5)

-- Lista com nomes e links dos scripts
local scripts = {
    {name = "Modo Deus", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/O%20Rakegodmod.lua"},
    {name = "ESP Rake", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeRakeEsp.lua"},
    {name = "ESP Jogadores", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakePlayersEsp.lua"},
    {name = "ESP Sucata", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeScrapEsp.lua"},
    {name = "ESP Localizações", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeAllLocations.lua"},
    {name = "Desligar Torre", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeTowerLightOff.lua"},
    {name = "Abrir SafeHouse", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeOpenSafeHouse.lua"},
    {name = "Stun Aura", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeStunAura.lua"},
    {name = "Noclip", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeNoclip.lua"},
    {name = "Stamina Infinita", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeStamina.lua"},
    {name = "X-Ray", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeXray.lua"},
    {name = "Tempo do Jogo", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeGameTime.lua"},
    {name = "Energia do Gerador", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakePower.lua"},
}

-- Criar os botões do Hub
for _, item in ipairs(scripts) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = item.name
    btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Parent = MainFrame

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(item.url))()
    end)
end

-- Abrir/fechar o painel
Toggle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    Toggle.Text = MainFrame.Visible and "Fechar Hub" or "Abrir Hub"
end)

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
