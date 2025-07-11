-- Modo Deus - Samuel Creator
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end)
