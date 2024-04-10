Config = {
	Prefix = '^9[^1DEV-headtags^9] ^3',
	TagsForStaffOnly = false, -- "DiscordTagIDs.Use.Tag-Toggle"
	ShowOwnTag = true, -- Should the tag also be shown for own user?
	UseDiscordName = false,
	ShowDiscordDescrim = false, -- Should it show Badger#0002 ?
	RequiresLineOfSight = true, -- Requires the player be in their line of sight for tags to be shown
	FormatDisplayName = "[{SERVER_ID}]",
    FortmatHiddenName = "",
	UseKeyBind = false, -- It will only show on keybind press
	KeyBind = 289, -- F2 -- USE https://docs.fivem.net/docs/game-references/controls/ for keycodes
	roleList = { 
		{'0', '~w~Civillian '},
		{'1147775268577087549', "~o~Co Owner "}, -- -- done
		{'1147775268577087549', "~p~Owner "}, -- -- done
	},

	-- Headtag Menu Stuff
	useHeadTagMenuImage = true,
	HeadTagMenuImage = 'https://cdn.discordapp.com/attachments/1161069645827166304/1227568064170819676/tumblr_68144a71c3035f7dc7aa8aafa9d21e78_fd150a88_2048.gif?ex=6628e0d9&is=66166bd9&hm=3b2da5214ba65c7db3aec1850a231661773ec12d35b5397ee29cbed3598e770d&', -- [Custom banner IMGUR or GIPHY URLs go here (Includes Discord Image URLS) ]
	playerNameTitle = false,
	headTagMenuTitle = "", -- only work if [ playerNameTitle ] is set to false
	MenuPos = {
		x = 1450,
		y = 200
	},
	commandInfo = {
		command = 'headtags',
	},

	-- type 0 = Defult chat notifications
	-- type 1 = okokNotification
	-- type 2 = codem Notify
	-- type 3 = mythic Notify
	-- type 4 = atlas Notify
	notify_settings = {
		duration = 5000,
		type = 4
	},

	headtag_hud = {
		enabled = true,
		x = 1.400,
		y = 0.505,
		fontSize = 0.35,
		defaultText = "~t~Headtag: ~b~{HEADTAG}",
		
	}
} 
