Config = {}

Config.Debug = true

-- If true, the player's own headtag will be shown.
Config.ShowOwnTag = true

Config.Custombanner = {
	enabled = false,
	url = "https://files.catbox.moe/yd0389.png",
}

Config.Menu = {
	glare = false,
}

-- Format Display Name is the format of the player's headtag.
-- {HEADTAG} is the player's headtag.
-- {SPEAKING} is the player's speaking status aka colour.
-- {SERVER_ID} is the server's ID.
Config.FormatDisplayName = "{HEADTAG} {SPEAKING}[{SERVER_ID}]"

-- Display Height is the height of the headtag above the player.
-- a higher value will be higher above the player and a lower value will be lower.
Config.DisplayHeight = 1.3

-- The distance you have to be within to see the headtag.
Config.PlayerNamesDist = 15

-- If true, the search button for the headtag menu will be enabled.
Config.EnableSearch = true

Config.menu = {
	x = 1400,
	y = 100,
}

-- ## DEVELOPERS
-- NO THIS IS NOT A NO CLIP
-- this is the perm they need to trigger the server event to hide their full headtag and server id so when they are in no clip nothing is giving them away
-- that they are there
--[[
	Lua Server Event that triggers the client to hide their headtag and server id
	TriggerServerEvent("jd-headtags:server:noclip")
]]
Config.NoClipAce = "headtags.noclip"

-- If true, the highest role will be set automatically.
Config.AutoSetHighestRole = false

 -- The Ace permission for all tags.
Config.allTags = 'headtags.all'


Config.Hud = {
    -- Enable or disable the HUD system
    enabled = false,

    -- Select the active HUD resource
    -- Make sure this matches a key in ResourceExports
    type = 'nex-hud',

    ResourceExports = {
        ['nex-hud'] = {
            UpdatePlayerHeadtag = function(player, headtag)
                exports['nex-hud']:updateHeadtags(player, headtag)
            end,
        },

        -- Example for adding a new HUD:
        -- ['my-custom-hud'] = {
        --     UpdatePlayerHeadtag = function(player, headtag)
        --         exports['my-custom-hud']:setHeadtag(player, headtag)
        --     end,
        -- },
    },

	--[[
		this is a HELPER function DO NOT EDIT!!!
	]]
    SetHeadtagForHud = function(player, headtag)
		local enabled = Config.Hud.enabled
		if not enabled then return end

		local hud = Config.Hud.type
		local exports = Config.Hud.ResourceExports[hud]

		if not exports then
			print(('^2[HUD]^7 Hud "%s" is not defined in ResourceExports!'):format(hud))
			return
		end

		if not exports.UpdatePlayerHeadtag then
			print(('^2[HUD]^7  Hud "%s" does not have UpdatePlayerHeadtag function!'):format(hud))
			return
		end

		exports.UpdatePlayerHeadtag(player, headtag)
	end
}

-- The Last in the index will be the highest role.
-- aka the highest role will be the last one in the table or the bottem one.
-- hey stinkers default can only be applied to one or it just will not work.... thats the point of a default role
Config.roleList = {
	{ ace = "headtag.member", label = "~g~Member", default = true },
	{ ace = "headtag.developer", label = "~b~Developer"},
	{ ace = "headtag.staff", label = "~r~Staff"},
	{ ace = "headtag.owner", label = "~p~Owner"},
}

