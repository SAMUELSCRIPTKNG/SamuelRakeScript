-- Samuel Hub Principal
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Name = "SamuelHub"
ScreenGui.Parent = game.CoreGui

Frame.Name = "Main"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Active = true
Frame.Draggable = true

UICorner.Parent = Frame

UIListLayout.Parent = Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

-- Botões com require para os scripts
local scripts = {
    {nome = "Modo Deus", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/The%20Rakegodmod.lua"},
    {nome = "ESP Localizações", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeAllLocations.lua"},
    {nome = "ESP Rake", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeRakeEsp.lua"},
    {nome = "ESP Jogadores", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakePlayersEsp.lua"},
    {nome = "ESP Scrap", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeScrapEsp.lua"},
    {nome = "Abrir Safehouse", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeOpenSafeHouse.lua"},
    {nome = "Desligar Torre", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeTowerLightOff.lua"},
    {nome = "Noclip", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeNoclip.lua"},
    {nome = "Stamina Infinita", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeStamina.lua"},
    {nome = "Stun Aura", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeStunAura.lua"},
    {nome = "XRay", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeXray.lua"},
    {nome = "Tempo do Jogo", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakeGameTime.lua"},
    {nome = "Energia do Gerador", url = "https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/main/rakePower.lua"},
}

for _, data in pairs(scripts) do
    local btn = Instance.new("TextButton")
    btn.Parent = Frame
    btn.Text = data.nome
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(data.url))()
    end)
end

-- Botão para esconder e mostrar
ToggleButton.Parent = ScreenGui
ToggleButton.Text = "Abrir SamuelHub"
ToggleButton.Size = UDim2.new(0, 150, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Active = true
ToggleButton.Draggable = true

local visible = true
ToggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    Frame.Visible = visible
    ToggleButton.Text = visible and "Fechar SamuelHub" or "Abrir SamuelHub"
end)
