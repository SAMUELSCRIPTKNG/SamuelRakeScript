-- ESP de todas as localizações do mapa
local locais = {"Safe House", "Power Station", "Observation Tower", "Flare Gun Spawn", "Shop", "Base Camp", "Supply Drop", "Radio Tower"}

for _, nome in ipairs(locais) do
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == nome then
            local bill = Instance.new("BillboardGui", obj)
            bill.Size = UDim2.new(0, 100, 0, 40)
            bill.AlwaysOnTop = true

            local label = Instance.new("TextLabel", bill)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(0, 1, 1)
            label.TextScaled = true
            label.Text = nome
        end
    end
end
