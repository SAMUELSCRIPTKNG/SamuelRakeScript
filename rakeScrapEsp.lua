-- ESP Sucatas
for _, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Scrap" then
        local bill = Instance.new("BillboardGui", v)
        bill.Size = UDim2.new(0,100,0,40)
        bill.AlwaysOnTop = true

        local label = Instance.new("TextLabel", bill)
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1,1,0)
        label.TextScaled = true
        label.Text = "SCRAP"
    end
end
