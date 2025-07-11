-- Desliga a luz da torre
local light = workspace:FindFirstChild("TowerLight")
if light then
    light:Destroy()
end
