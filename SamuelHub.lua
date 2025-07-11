-- Carregar Rayfield do seu repositório
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/Rayfield.lua"))()

-- Criar janela principal
local Window = Rayfield:CreateWindow({
   Name = "Samuel Rake Hub",
   LoadingTitle = "Samuel Creator",
   LoadingSubtitle = "by SamuelJSK",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- ABA: ESP
local EspTab = Window:CreateTab("ESP", 4483362458)

EspTab:CreateButton({
   Name = "ESP Rake (Vida e Distância)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeRakeEsp.lua"))()
   end
})

EspTab:CreateButton({
   Name = "ESP Localizações (Safe House, Torre etc)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeAllLocations.lua"))()
   end
})

EspTab:CreateButton({
   Name = "ESP Sucata (Scrap)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeScrapEsp.lua"))()
   end
})

EspTab:CreateButton({
   Name = "ESP Jogadores (Vida e Distância)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakePlayersEsp.lua"))()
   end
})

-- ABA: VANTAGENS
local VantagensTab = Window:CreateTab("Vantagens", 4483362458)

VantagensTab:CreateButton({
   Name = "Modo Deus",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/The%20Rakegodmod.lua"))()
   end
})

VantagensTab:CreateButton({
   Name = "Stun Stick Aura (20m)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeStunAura.lua"))()
   end
})

VantagensTab:CreateButton({
   Name = "Abrir Safe House",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeOpenSafeHouse.lua"))()
   end
})

VantagensTab:CreateButton({
   Name = "Desligar Luz da Torre",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeTowerLightOff.lua"))()
   end
})

VantagensTab:CreateButton({
   Name = "Ativar Noclip",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeNoclip.lua"))()
   end
})

VantagensTab:CreateButton({
   Name = "Stamina Infinita",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeStamina.lua"))()
   end
})

VantagensTab:CreateButton({
   Name = "Ativar X-Ray",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeXray.lua"))()
   end
})

-- ABA: INFORMAÇÕES
local InfoTab = Window:CreateTab("Informações", 4483362458)

InfoTab:CreateButton({
   Name = "Mostrar Tempo do Jogo (Game Time)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakeGameTime.lua"))()
   end
})

InfoTab:CreateButton({
   Name = "Mostrar Energia do Gerador (Power)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUELSCRIPTKNG/SamuelRakeScript/principal/rakePower.lua"))()
   end
})
