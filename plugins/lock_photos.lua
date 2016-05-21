kicktable = {}

local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_photos'] then
                lock_photos = data[tostring(msg.to.id)]['settings']['lock_photos']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_photos == "yes" then
        send_large_msg(chat, 'ارسال عکس ممنوعه😐✋')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {
  patterns = {
    "%[(photo)%]"
},
  run = run
}
