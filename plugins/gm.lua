-- data saved to moderation.json
-- check moderation plugin
do

local function create_group(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
        return "This service is private for SUDO (@shayansoft)"
    end
    local group_creator = msg.from.print_name
    create_group_chat (group_creator, group_name, ok_cb, false)
	return 'Group '..string.gsub(group_name, '_', ' ')..' created, check messages list...'
end

local function set_description(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local data_cat = 'description'
	data[tostring(msg.to.id)][data_cat] = deskripsi
	save_data(_config.moderation.data, data)
	return 'Set this message for about=>\n\n'..deskripsi
end

local function get_description(msg, data)
    local data_cat = 'description'
    if not data[tostring(msg.to.id)][data_cat] then
		return 'Group have not about'
	end
    local about = data[tostring(msg.to.id)][data_cat]
    return about
end

local function set_rules(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local data_cat = 'rules'
	data[tostring(msg.to.id)][data_cat] = rules
	save_data(_config.moderation.data, data)
	return 'Set this message for rules=>\n\n'..rules
end

local function get_rules(msg, data)
    local data_cat = 'rules'
    if not data[tostring(msg.to.id)][data_cat] then
		return 'Group have not rules'
	end
    local rules = data[tostring(msg.to.id)][data_cat]
    return rules
end

-- lock/unlock group name. bot automatically change group name when locked
local function lock_group_name(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
    local group_name_lock = data[tostring(msg.to.id)]['settings']['lock_name']
	if group_name_lock == 'yes' then
	    return 'Name is already locked'
	else
	    data[tostring(msg.to.id)]['settings']['lock_name'] = 'yes'
	    save_data(_config.moderation.data, data)
	    data[tostring(msg.to.id)]['settings']['set_name'] = string.gsub(msg.to.print_name, '_', ' ')
	    save_data(_config.moderation.data, data)
	return 'Group name locked'
	end
end

local function unlock_group_name(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
    local group_name_lock = data[tostring(msg.to.id)]['settings']['lock_name']
	if group_name_lock == 'no' then
	    return 'Name is already unlocked'
	else
	    data[tostring(msg.to.id)]['settings']['lock_name'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Group name unlocked'
	end
end

--lock/unlock group member. bot automatically kick new added user when locked
local function lock_group_member(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local group_member_lock = data[tostring(msg.to.id)]['settings']['lock_member']
	if group_member_lock == 'yes' then
	    return 'Members are already locked'
	else
	    data[tostring(msg.to.id)]['settings']['lock_member'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Group members locked'
end

local function unlock_group_member(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local group_member_lock = data[tostring(msg.to.id)]['settings']['lock_member']
	if group_member_lock == 'no' then
	    return 'Members are already unlocked'
	else
	    data[tostring(msg.to.id)]['settings']['lock_member'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Group members unlocked'
	end
end

--lock/unlock group photo. bot automatically keep group photo when locked
local function lock_group_photo(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local group_photo_lock = data[tostring(msg.to.id)]['settings']['lock_photo']
	if group_photo_lock == 'yes' then
	    return 'Photo is already locked'
	else
	    data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
	    save_data(_config.moderation.data, data)
	end
	return 'Send group photo now'
end

local function unlock_group_photo(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local group_photo_lock = data[tostring(msg.to.id)]['settings']['lock_photo']
	if group_photo_lock == 'no' then
	    return 'Photo is already unlocked'
	else
	    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Group photo unlocked'
	end
end

local function set_group_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/chat_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    chat_set_photo (receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'yes'
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'Group photo save and set', ok_cb, false)
  else
    print('Error: '..msg.id)
    send_large_msg(receiver, 'Failed, try again', ok_cb, false)
  end
end
-- show group settings
local function show_group_settings(msg, data)
    if not is_momod(msg) then
        return "You are NOT moderator"
    end
    local settings = data[tostring(msg.to.id)]['settings']
    local text = "Group Settings:\n_________________________\n> Lock Group Name : "..settings.lock_name.."\n> Lock Group Photo : "..settings.lock_photo.."\n> Lock Group Member : "..settings.lock_member.."\n> Anti Spam System : on\n> Anti Spam Mod : kick\n> Anti Spam Action : 10\n> Group Status : active\n> Group Model : free\n> Group Mod : 2\n> Supportion : yes\n> Bot Version : 1.6"
    return text
end

function run(msg, matches)
    --vardump(msg)
    if matches[1] == 'makegroup' and matches[2] then
        group_name = matches[2]
        return create_group(msg)
    end
    if not is_chat_msg(msg) then
	    return "This is not group"
	end
    local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    if msg.media and is_chat_msg(msg) and is_momod(msg) then
    	if msg.media.type == 'photo' and data[tostring(msg.to.id)] then
    		if data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' then
    			load_photo(msg.id, set_group_photo, msg)
    		end
    	end
    end
    if data[tostring(msg.to.id)] then
		local settings = data[tostring(msg.to.id)]['settings']
		if matches[1] == 'setabout' and matches[2] then
		    deskripsi = matches[2]
		    return set_description(msg, data)
		end
		if matches[1] == 'about' then
		    return get_description(msg, data)
		end
		if matches[1] == 'setrules' then
		    rules = matches[2]
		    return set_rules(msg, data)
		end
		if matches[1] == 'rules' then
		    return get_rules(msg, data)
		end
		if matches[1] == 'group' and matches[2] == '+' then --group lock *
		    if matches[3] == 'name' then
		        return lock_group_name(msg, data)
		    end
		    if matches[3] == 'member' then
		        return lock_group_member(msg, data)
		    end
		    if matches[3] == 'photo' then
		        return lock_group_photo(msg, data)
		    end
		end
		if matches[1] == 'group' and matches[2] == '-' then --group unlock *
		    if matches[3] == 'name' then
		        return unlock_group_name(msg, data)
		    end
		    if matches[3] == 'member' then
		        return unlock_group_member(msg, data)
		    end
		    if matches[3] == 'photo' then
		    	return unlock_group_photo(msg, data)
		    end
		end
		if matches[1] == 'group' and matches[2] == '?' then
		    return show_group_settings(msg, data)
		end
		if matches[1] == 'chat_rename' then
		    if not msg.service then
		        return "Are you trying to troll me?"
		    end
		    local group_name_set = settings.set_name
		    local group_name_lock = settings.lock_name
		    local to_rename = 'chat#id'..msg.to.id
		    if group_name_lock == 'yes' then
		        if group_name_set ~= tostring(msg.to.print_name) then
		            rename_chat(to_rename, group_name_set, ok_cb, false)
		        end
		    elseif group_name_lock == 'no' then
                return nil
            end
		end
		if matches[1] == 'setname' and is_momod(msg) then
		    local new_name = string.gsub(matches[2], '_', ' ')
		    data[tostring(msg.to.id)]['settings']['set_name'] = new_name
		    save_data(_config.moderation.data, data) 
		    local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
		    local to_rename = 'chat#id'..msg.to.id
		    rename_chat(to_rename, group_name_set, ok_cb, false)
		end
		if matches[1] == 'تنظیم عکس' and is_momod(msg) then
		    data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
	        save_data(_config.moderation.data, data)
	        return 'Send new photo now'
		end
		if matches[1] == 'chat_add_user' then
		    if not msg.service then
		        return "Are you trying to troll me?"
		    end
		    local group_member_lock = settings.lock_member
		    local user = 'user#id'..msg.action.user.id
		    local chat = 'chat#id'..msg.to.id
		    if group_member_lock == 'yes' then
		        chat_del_user(chat, user, ok_cb, true)
		    elseif group_member_lock == 'no' then
                return nil
            end
		end
		if matches[1] == 'chat_delete_photo' then
		    if not msg.service then
		        return "Are you trying to troll me?"
		    end
		    local group_photo_lock = settings.lock_photo
		    if group_photo_lock == 'yes' then
		        chat_set_photo (receiver, settings.set_photo, ok_cb, false)
		    elseif group_photo_lock == 'no' then
                return nil
            end
		end
		if matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then
		    if not msg.service then
		        return "Are you trying to troll me?"
		    end
		    local group_photo_lock = settings.lock_photo
		    if group_photo_lock == 'yes' then
		        chat_set_photo (receiver, settings.set_photo, ok_cb, false)
		    elseif group_photo_lock == 'no' then
		    	return nil
		    end
		 end
    end
end


return {
  description = "Group Manager System", 
  usage = {
  	"/makegroup (name) : create new group",
    "/about : view group about",
    "/rules : view group rules",
	"/setname (name) : set group name",
	"/setphoto : set group photo",
	"/setabout (message) : set group about",
    "/setrules (message) : set group rules",
    "/group + name : lock group name",
    "/group + photo : lock group photo",
    "/group + member : lock group member",		
    "/group - name : unlock group name",
    "/group - photo : unlock group photo",
    "/group - member : unlock group member",		
    "/group ? : view group settings"
    },
  patterns = {
    --"^[!/](makegroup) (.*)$",
    --"^[!/](setabout) (.*)$",
    --"^[!/](about)$",
    --"^[!/](setrules) (.*)$",
    --"^[!/](rules)$",
    "^[!/](setname) (.*)$",
    "^([Ss]etname) (.*)$",
    --"^(تنظیم عکس)$",
    --"^[!/](group) (+) (.*)$",
    --"^[!/](group) (-) (.*)$",
    --"^[!/](group) (?)$",
    "^!!tgservice (.+)$",
    "%[(photo)%]",
  }, 
  run = run,
}

end
