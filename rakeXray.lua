-- Ativar Xray
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("BasePart") then
        obj.Transparency = 0.6
    end
end
