# Headtag-Menu Documentation

## Overview

The Headtag-Menu is a FiveM resource that displays customizable headtags above players in-game. This system allows server administrators to configure different tags for different player roles, toggle visibility of tags, and customize the appearance and behavior of the headtag system.

## Dependencies

This resource requires the following dependencies:
- `ox_lib` - [GitHub Repository](https://github.com/overextended/ox_lib)
- `RageUI` - A FiveM menu library

Ensure these resources are installed and started before the Headtag-Menu.

## Configuration

All configuration options are located in the `config.lua` file. Below are the available configuration options:

### Basic Configuration

```lua
Config.Debug = true  -- Enable/disable debug messages
Config.ShowOwnTag = true  -- If true, the player's own headtag will be shown
```

### Custom Banner

```lua
Config.Custombanner = {
    enabled = false,  -- Enable/disable custom banner
    url = "https://files.catbox.moe/yd0389.png",  -- URL to the banner image
}
```

### Menu Configuration

```lua
Config.Menu = {
    glare = false,  -- Enable/disable menu glare effect
}

Config.menu = {
    x = 1400,  -- X position of the menu
    y = 100,   -- Y position of the menu
}

Config.EnableSearch = true  -- Enable/disable search functionality in the headtag menu
```

### Headtag Display Configuration

```lua
-- Format of the player's headtag
-- {HEADTAG} is the player's headtag
-- {SPEAKING} is the player's speaking status (color indicator)
-- {SERVER_ID} is the server's ID
Config.FormatDisplayName = "{HEADTAG} {SPEAKING}[{SERVER_ID}]"

Config.DisplayHeight = 1.3  -- Height of the headtag above the player
Config.PlayerNamesDist = 15  -- Distance at which headtags are visible
```

### HUD Configuration

```lua
Config.hud = {
    enabled = true,  -- Enable/disable the headtag HUD
    position = {
        x = 30,  -- Distance from right edge of screen
        y = 30   -- Distance from top of screen
    }
}
```

### Role Configuration

```lua
-- If true, the highest role will be set automatically
Config.AutoSetHighestRole = false

-- The Ace permission for all tags
Config.allTags = 'headtags.all'

-- Role list configuration
-- The last role in the list will be considered the highest role
-- Only one role should have default = true
Config.roleList = {
    { ace = "headtag.member", label = "~g~Member", default = true },
    { ace = "headtag.developer", label = "~b~Developer"},
    { ace = "headtag.staff", label = "~r~Staff"},
    { ace = "headtag.owner", label = "~p~Owner"},
}
```

### NoClip Configuration

```lua
-- Permission for hiding headtag during noclip
Config.noclip = {
    ace = "headtags.noclip",
}
```

## Text Formatting

Headtag text can be formatted using the following FiveM color codes:
- `~r~` - Red
- `~g~` - Green
- `~b~` - Blue
- `~y~` - Yellow
- `~p~` - Purple
- `~o~` - Orange
- `~c~` - Grey
- `~m~` - Dark Grey
- `~u~` - Black
- `~n~` - Pink
- `~s~` - White (default)
- `~w~` - White
- `~h~` - Bold text modifier

You can combine these codes to create formatted text. For example: `~r~Red ~b~Blue ~g~Green`

## ACE Permissions

The Headtag-Menu uses ACE permissions to determine which players have access to which tags. Here's how to set up permissions:

1. Add the following to your server.cfg or a separate permissions file:

```
# Grant access to all headtags
add_ace group.admin headtags.all allow

# Role-specific permissions
add_ace group.admin headtag.owner allow
add_ace group.moderator headtag.staff allow
add_ace group.developer headtag.developer allow
add_ace group.member headtag.member allow

# NoClip permission
add_ace group.admin headtags.noclip allow
```

2. Assign players to the appropriate groups:

```
add_principal identifier.license:xxxxxxxxxxxxxxx group.admin
add_principal identifier.license:xxxxxxxxxxxxxxx group.moderator
```

## In-Game Commands

Players can use the following command to interact with the headtag system:

- `/headtags` - Open the headtag menu

## Developer Information

### Server Events

To hide a player's headtag during noclip:
```lua
TriggerServerEvent("jd-headtags:server:noclip")
```

### Client Events

- `jd-headtags:client:hideTag` - Hide a specific player's tag
- `jd-headtags:client:toggleAllTags` - Toggle visibility of all tags
- `jd-headtags:client:updateHeadtag` - Update a player's headtag

## Troubleshooting

1. **Headtags not showing:**
   - Ensure the resource is started correctly
   - Check ACE permissions in your server.cfg
   - Verify that the distance between players is less than `Config.PlayerNamesDist`

2. **Custom roles not working:**
   - Verify ACE permissions are set correctly
   - Check for typos in role names and permissions
   - Ensure only one role has `default = true`

3. **Debug mode:**
   - Set `Config.Debug = true` to enable debug messages
   - Check server console for any error messages

## Discord Integration

### Enhancing Headtag-Menu with Badger's Discord API / Ace Perms

Integrating Badger's Discord API / Ace Perms with the Headtag-Menu can significantly improve your server's functionality by automating headtag assignments based on Discord roles. This section explains how to set up this integration.

how ever this is soon to be deprecated due to me working on my own `discord-api` solution

#### Required Resources

- [Badger_Discord_API](https://github.com/JaredScar/Badger_Discord_API) - Provides methods to access Discord data within FiveM
- [DiscordAcePerms](https://github.com/JaredScar/DiscordAcePerms) - Assigns Group "permissions" based on Discord roles

#### Benefits of Integration

1. **Automated Role Assignment** - Players automatically receive headtags based on their Discord roles
2. **Reduced Administrative Overhead** - No need to manually assign headtags to players
3. **Dynamic Updates** - Changes to Discord roles are reflected in-game without server restarts
4. **Consistent Role Management** - Centralized role management through Discord

#### Implementation Steps

1. **Install and Configure Badger_Discord_API**:
   - Follow the installation instructions in the GitHub repository
   - Set up your Discord Bot Token and Guild ID in the configuration

2. **Install DiscordAcePerms**:
   - Download and install from the GitHub repository
   - This plugin assigns FiveM server groups to players based on their Discord roles and configure it


3. **Set up ACE permissions in server.cfg**:

```
# "bind" groups to headtag permissions
add_ace group.owner headtag.owner allow
add_ace group.staff headtag.staff allow
add_ace group.developer headtag.developer allow
add_ace group.member headtag.member allow
```

4. **Verify Integration**:
   - Restart your server after configuration
   - Join the server with different Discord roles to test if headtags are applied correctly

This integration creates a seamless experience where players' Discord roles automatically determine their in-game headtags, streamlining server management and enhancing the roleplay experience.

## Support

For additional support or to report issues, please contact the resource author: JoeV2@Joe Development.
