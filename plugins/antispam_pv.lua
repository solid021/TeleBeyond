
--An empty table for solving multiple kicking problem(thanks to @topkecleon )
kicktable = {}
do

local TIME_CHECK = 1 -- seconds
local data = load_data(_config.moderation.data)
local function pre_process(msg)
  if msg.service then
    return msg
  end
  if msg.from.id == our_id then
    return msg
  end
  if msg.from.type == 'user' then
    local hash = 'user:'..msg.from.id
    if msg.from.print_name then
      redis:hset(hash, 'print_name', msg.from.print_name)
    end
    if msg.from.first_name then
      redis:hset(hash, 'first_name', msg.from.first_name)
    end
    if msg.from.last_name then
      redis:hset(hash, 'last_name', msg.from.last_name)
    end
    if msg.from.username then
      redis:hset(hash, 'username', msg.from.username)
    end
  end
  if msg.to.type == 'chat' then
    -- User is on chat
    local hash = 'chat:'..msg.to.id..':users'
    redis:sadd(hash, msg.from.id)
  end
  local hash = 'msgs:'..msg.from.id..':'..msg.to.id
  redis:incr(hash)
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
    if data[tostring(msg.to.id)]['settings']['flood'] == 'no' then
      return nil
    end
  end
  if msg.from.type == 'user' then
    local hash = 'user:'..msg.from.id..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
    local data = load_data(_config.moderation.data)
    local NUM_MSG_MAX = 3
    if data[tostring(msg.to.id)] then
      if data[tostring(msg.to.id)]['settings']['flood_msg_max'] then
        NUM_MSG_MAX = tonumber(data[tostring(msg.to.id)]['settings']['flood_msg_max'])--Obtain group flood sensitivity
      end
    end
    local max_msg = NUM_MSG_MAX * 1
    if msgs > max_msg then
	if is_momod(msg) then 
        return msg
      end
      local user = msg.from.id
      local chat = msg.to.id
      local user = msg.from.id
      if kicktable[user] == true then
        return
      end
      kick_user(user, chat)
      if msg.to.type == "user" then
	    send_large_msg("chat#id"..msg.to.id, "User [ "..msg.from.id.." ] globally banned (spamming)")
        block_user("user#id"..msg.from.id,ok_cb,false)
		banall_user("user#id"..msg.from.id,ok_cb,false)
      end
      local name = user_print_name(msg.from)
      savelog(msg.to.id, name.." ["..msg.from.id.."] spammed and kicked ! ")
      local gbanspam = 'gban:spam'..msg.from.id
      redis:incr(gbanspam)
      local gbanspam = 'gban:spam'..msg.from.id
      local gbanspamonredis = redis:get(gbanspam) 
      if gbanspamonredis then
        if tonumber(gbanspamonredis) == 2 and not is_owner(msg) then
          banall_user(msg.from.id)
          local gbanspam = 'gban:spam'..msg.from.id
          redis:set(gbanspam, 0)
          local username = " "
          local username = msg.from.id
          end
          local name = user_print_name(msg.from)
          send_large_msg("chat#id"..msg.to.id, "User [ "..msg.from.id.." ] globally banned (spamming)")
          local log_group = 1
         send_large_msg("chat#id"..log_group, "User [ "..msg.from.id.." ] globally banned from ( "..msg.to.print_name.." ) (spamming)")
        end
      end
      kicktable[user] = true
      msg = nil
    end
    redis:setex(hash, TIME_CHECK, msgs)
  end
  return msg
end

local function cron()
  --clear that table on the top of the plugins
  kicktable = {}
end

return {
  patterns = {},
  cron = cron,
  pre_process = pre_process
}

end
