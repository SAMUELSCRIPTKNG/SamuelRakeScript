-- Aumenta distância do Stun Stick (experimental)
local char = game.Players.LocalPlayer.Character
local tool = char:FindFirstChildOfClass("Tool")

if tool then
    tool.Handle.Size = Vector3.new(1, 1, 50)
end
