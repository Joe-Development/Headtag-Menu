function txtHead(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(6)
    SetTextProportional(false)
	SetTextCentre(false)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow()
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


RegisterNetEvent("JD:headtag:SetToHUD")
AddEventHandler("JD:headtag:SetToHUD", function (headtag)
    headtag = tostring(headtag) or "~b~None set"
    if headtag == " " or headtag == "" then
        headtag = "~b~None"
    end
    playerHeadTag = headtag
end)

playerHeadTag = "None Set";
function setPlayerHeadTagGui(value)
 	playerHeadTag = value
 	return
end


Citizen.CreateThread(function()
	Wait(800);
	while true do 
		Wait(0);
		local enabled = Config.headtag_hud.enabled;
		if enabled then 
			local disp = Config.headtag_hud.defaultText;
			local scale = Config.headtag_hud.fontSize;
			local x = Config.headtag_hud.x;
			local y = Config.headtag_hud.y;

			if (disp:find("{HEADTAG}")) then 
				disp = disp:gsub("{HEADTAG}", playerHeadTag);
			end 
			txtHead(x, y, 1.0, 1.0, scale, disp, 255,255,255,255);
		end
	end
end)
