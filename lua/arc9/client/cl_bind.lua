hook.Add("PlayerBindPress", "ARC9_Binds", function(ply, bind, pressed, code)
    local wpn = ply:GetActiveWeapon()

    if !wpn or !IsValid(wpn) or !wpn.ARC9 then return end

    if !pressed then return end

    -- print(bind)

    if bind == "+menu_context" then
        if !LocalPlayer():KeyDown(IN_USE) then
            if wpn:GetCustomize() then
                net.Start("ARC9_togglecustomize")
                net.WriteBool(false)
                net.SendToServer()
            else
                net.Start("ARC9_togglecustomize")
                net.WriteBool(true)
                net.SendToServer()
            end

            return true
        end
    end

    if wpn:GetInSights() then
        if bind == "invnext" then
            wpn:Scroll(1)

            return true
        elseif bind == "invprev" then
            wpn:Scroll(-1)

            return true
        end
    end
end)