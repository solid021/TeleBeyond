do
local function run(msg, matches)
local bot_id = 177563453 
  
    if matches[1] == 'bye' and is_sudo(msg) then
       chat_del_user("chat#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
    elseif msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_sudo(msg) then
       send_large_msg("chat#id"..msg.to.id, '(((((((((((((((((((((((((((((((((((((((((BLOCK))))))))))))))))))))))))))))))))))))', ok_cb, false)
       chat_del_user("chat#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
    end
end
 
return {
  patterns = {
    "^[!/]bye)$",
    "^!!tgservice (.+)$",
  },
  run = run
}
end

