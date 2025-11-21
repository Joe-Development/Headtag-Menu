local activeTagTracker = {}
local prefixes = {}
local hidePrefix = {}
local hideAll = {}
local hideTags = {}

function HideUserTag(src)
	local playerName = GetPlayerName(src)
	if playerName and GetIndex(hideTags, playerName) == nil then
		table.insert(hideTags, playerName)
		TriggerClientEvent('jd-headtags:HideTag', -1, hideTags, false)
	end
end

function ShowUserTag(src)
	local playerName = GetPlayerName(src)
	if playerName and GetIndex(hideTags, playerName) ~= nil then
		table.remove(hideTags, GetIndex(hideTags, playerName))
		TriggerClientEvent('jd-headtags:HideTag', -1, hideTags, false)
	end
end

function GetTagNameByIndex(source, index)
    local tags = GetUserTags(source)
    if tags and tags[index] then
        return tags[index]
    end
    return nil
end

function ToggleTag(source)
    local name = GetPlayerName(source)
    if HasValue(hidePrefix, name) then
        table.remove(hidePrefix, GetIndex(hidePrefix, name))
        TriggerClientEvent("jd-headtags:client:toggleTag", -1, hidePrefix, false)
		lib.notify(source, {
			title = 'Headtag',
			description = 'Your Headtag has been toggled on',
			type = 'success',
			position = 'center-right',
			duration = 5000,
		})
    else
        table.insert(hidePrefix, name)
        TriggerClientEvent("jd-headtags:client:toggleTag", -1, hidePrefix, true)
		lib.notify(source, {
			title = 'Headtag',
			description = 'Your Headtag has been toggled off',
			type = 'error',
			position = 'center-right',
			duration = 5000,
		})
    end
end

function ToggleTagsAll(source)
    local name = GetPlayerName(source)
    if HasValue(hideAll, name) then
        table.remove(hideAll, GetIndex(hideAll, name))
        TriggerClientEvent("jd-headtags:client:toggleAllTags", source, false, false)
		lib.notify(source, {
			title = 'Headtag',
			description = 'All Headtags have been toggled on',
			type = 'success',
			position = 'center-right',
			duration = 5000,
		})
    else
        table.insert(hideAll, name)
        TriggerClientEvent("jd-headtags:client:toggleAllTags", source, true, false)
		lib.notify(source, {
			title = 'Headtag',
			description = 'All Headtags have been toggled off',
			type = 'error',
			position = 'center-right',
			duration = 5000,
		})
    end
end

function GetActiveUserTag(src)
	return activeTagTracker[src]
end


function GetUserTags(src)
	return prefixes[src]
end

function SetUserTag(source, ind)
	if prefixes[source] ~= nil and prefixes[source][ind] ~= nil then
		activeTagTracker[source] = prefixes[source][ind]
		TriggerClientEvent("jd-headtags:client:updateTags", -1, prefixes, activeTagTracker, false)
		return true
	end
	return false
end


AddEventHandler('playerDropped', function (reason)
	activeTagTracker[source] = nil
	prefixes[source] = nil
end)


RegisterNetEvent('jd-headtags:server:getTags')
AddEventHandler('jd-headtags:server:getTags', function()
    local roleAccess = {}
    local defaultRole = ""
    local highestRole = ""
    local hasAnyPermission = false

    for i = 1, #Config.roleList do
        local role = Config.roleList[i]
        if role.default and IsPlayerAceAllowed(source, role.ace) then
            defaultRole = role.label
            break
        end
    end

    highestRole = defaultRole

    for i = 1, #Config.roleList do
        local role = Config.roleList[i]
		---@diagnostic disable-next-line: param-type-mismatch
        if IsPlayerAceAllowed(source, role.ace) or IsPlayerAceAllowed(source, Config.allTags) then
            Debug(GetPlayerName(source) .. " has tag for: " .. role.label)
            table.insert(roleAccess, role.label)
            highestRole = role.label
            hasAnyPermission = true
        end
    end

    prefixes[source] = hasAnyPermission and roleAccess or {}

    if not hasAnyPermission then
        activeTagTracker[source] = ""
    else
        activeTagTracker[source] = Config.AutoSetHighestRole and highestRole or defaultRole
    end

    TriggerClientEvent("jd-headtags:client:updateTags", -1, prefixes, activeTagTracker, false)
	Config.Hud.SetHeadtagForHud(source, activeTagTracker[source] == "" and "N/A" or activeTagTracker[source])
end)

AddEventHandler('playerDropped', function()
    if prefixes[source] then
        prefixes[source] = nil
    end
    if activeTagTracker[source] then
        activeTagTracker[source] = nil
    end
end)

RegisterNetEvent('jd-headtags:server:setTag')
AddEventHandler('jd-headtags:server:setTag', function(index)
	local source = source
	local success = SetUserTag(source, index)

	if success then
		local tagName = GetTagNameByIndex(source, index)
		Config.Hud.SetHeadtagForHud(source, tagName)
		lib.notify(source, {
			title = 'HeadTag',
			description = 'Set your HeadTag to ' .. RemovePrefixes(tagName),
			type = 'success',
			position = 'center-right',
			duration = 5000,
		})
	else
		lib.notify(source, {
			title = 'HeadTag',
			description = 'Failed to set HeadTag',
			type = 'error',
			position = 'center-right',
			duration = 5000,
		})
	end
end)

RegisterNetEvent('jd-headtags:server:toggleTag')
AddEventHandler('jd-headtags:server:toggleTag', function()
    ToggleTag(source)
end)

RegisterNetEvent('jd-headtags:server:toggleAllTags')
AddEventHandler('jd-headtags:server:toggleAllTags', function()
    ToggleTagsAll(source)
end)

RegisterNetEvent('jd-headtags:server:noclip')
AddEventHandler('jd-headtags:server:noclip', function()
    local source = source
	if not IsPlayerAceAllowed(source, Config.NoClipAce) then return end
    TriggerClientEvent("jd-headtags:client:noclip", -1, source)
end)

CreateThread(function()
    local count = 0
    local roles = {}

	for i = 1, #Config.roleList do
        local role = Config.roleList[i]
        if role.default then
            count = count + 1
            table.insert(roles, role.label)
        end
    end

    if count > 1 then
        print("^1[WARNING]^3 Multiple default roles detected in Config.roleList!")
        print("^1[WARNING]^3 Found " .. count .. " default roles: " .. table.concat(roles, ", "))
        print("^1[WARNING]^3 Only the first default role will be used: " .. roles[1])
        print("^1[WARNING]^3 Please ensure only one role has default = true in your config^7")
    end
end)