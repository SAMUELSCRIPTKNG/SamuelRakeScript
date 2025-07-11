-- Abre a porta da Safe House
for _,v in pairs(workspace:GetDescendants()) do
    if v.Name == "SafeHouseDoor" and v:IsA("BasePart") then
        v:Destroy()
    end
end
