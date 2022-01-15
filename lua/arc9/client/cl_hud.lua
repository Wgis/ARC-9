local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
}

hook.Add("HUDShouldDraw", "ARC9_HideHUD", function(name)
    if !IsValid(LocalPlayer()) then return end

    local wpn = LocalPlayer():GetActiveWeapon()

    if !wpn.ARC9 then return end

    if wpn:GetCustomize() then
        if hide[name] then return false end
    end
end)

ARC9.Colors = {
    bg = Color(51, 26, 0),
    fg = Color(255, 153, 51),
    hi = Color(255, 230, 204),
    pos = Color(255, 102, 0),
    neg = Color(0, 153, 255)
}

function ARC9.GetHUDColor(part, alpha)
    alpha = alpha or 255
    local col = ARC9.Colors[part]

    col.a = alpha

    return col
end