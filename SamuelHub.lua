-- Samuel Creator Hub - GUI test
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SamuelHubGUI"

-- Botão de abrir/fechar
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 120, 0, 30)
toggle.Position = UDim2.new(0, 10, 0, 10)
toggle.Text = "Abrir Hub"
toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
toggle.TextColor3 = Color3.new(1, 1, 1)

-- Janela principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 220, 0, 400)
main.Position = UDim2.new(0, 10, 0, 50)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Visible = false
main.Active = true
main.Draggable = true

-- Layout com scroll
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

-- Lista de scripts (nome + link)
local scripts = {
    {"Modo Deus", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/O%20Rakegodmod.lua"},
    {"ESP Rake", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeRakeEsp.lua"},
    {"ESP Jogadores", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakePlayersEsp.lua"},
    {"ESP Sucata", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeScrapEsp.lua"},
    {"ESP Localizações", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeAllLocations.lua"},
    {"Desligar Torre", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeTowerLightOff.lua"},
    {"Abrir SafeHouse", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeOpenSafeHouse.lua"},
    {"Stun Aura", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeStunAura.lua"},
    {"Noclip", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeNoclip.lua"},
    {"Stamina Infinita", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeStamina.lua"},
    {"X-Ray", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeXray.lua"},
    {"Tempo do Jogo", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeGameTime.lua"},
    {"Energia do Gerador", "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakePower.lua"},
}

-- Criar botões do Hub
for _, data in ipairs(scripts) do
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = data[1]
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.new(1, 1, 1)

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(data[2]))()
    end)
end

-- Mostrar/esconder menu
toggle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    toggle.Text = main.Visible and "Fechar Hub" or "Abrir Hub"
end)
