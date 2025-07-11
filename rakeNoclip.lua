-- Noclip ativado
game:GetService("RunService").Stepped:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end)
