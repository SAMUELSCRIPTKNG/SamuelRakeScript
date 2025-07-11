-- Stamina infinita
while true do
    wait(0.2)
    local stats = game.Players.LocalPlayer:FindFirstChild("Stats")
    if stats and stats:FindFirstChild("Stamina") then
        stats.Stamina.Value = 100
    end
end
