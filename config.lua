Config = {}

Config.Debug = true

-- If true, the player's own headtag will be shown.
Config.ShowOwnTag = true

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

-- DEVELOPERS
-- NO THIS IS NOT A NO CLIP
-- this is the perm they need to trigger the server event to hide their full headtag and server id so when they are in no clip nothing is giving them away
-- that they are there
Config.noclip = {
	ace = "headtags.noclip",
}

-- If true, the highest role will be set automatically.

Config.AutoSetHighestRole = false

-- The Last in the index will be the highest role.
-- aka the highest role will be the last one in the table or the bottem one.

Config.roleList = {
	{ ace = "headtags.member", label = "~g~Member"},
	{ ace = "headtags.developer", label = "~b~Developer"},
	{ ace = "headtags.staff", label = "~r~Staff"},
	{ ace = "headtags.owner", label = "~p~Owner"},
}

