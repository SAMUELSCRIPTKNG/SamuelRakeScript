-- Energia do gerador
local gen = workspace:FindFirstChild("Generator")
if gen and gen:FindFirstChild("Fuel") then
    print("Energia restante no gerador:", gen.Fuel.Value)
end
