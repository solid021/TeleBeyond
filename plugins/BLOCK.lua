do
local function block_user_callback(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local user = 'user#id'..result.id
  if success == 0 then
    return send_large_msg(receiver, "Block Process Failedًں”´آ´")
  end
  block_user(user, cb_ok, false)
end
end

local function run(msg, matches)
 if msg.to.type == 'chat' then
    local user = 'chat#id'..msg.to.id
 local user = matches[2]
  if matches[1] == "user" then
      user = 'user#id'..user
      block_user(user, callback, false)
    end
	        if not is_sudo(msg) or is_realm(msg) then
    return 'BLOCK ONLY BY SUDO'
  end
    return "I Have Blocked Userâœ…"
  end
end

return {
  patterns = {
    "^[!/]block (user) (%d+)$",
  },
  run = run,
}
--I'm Not Sure WoRks Or NOT!
--IT HAS A BUG THAT EVERYONE CAN BLOCK USERS [EVERYONE]
    --https://github.com/ThisIsArman
    --Telegram.me/ThisIsArman
