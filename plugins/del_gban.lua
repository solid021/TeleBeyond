local function run(msg, matches)
if matches[1]:lower() == 'del' then 
      if not is_sudo(msg) then
        return "فقط مخصوص سودو!"
      end
if matches[2] == 'gbanlist' then 
local hash = 'gbanned'
        local data_cat = 'gbanlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
send_large_msg(get_receiver(msg), "لیست سوپر بن پاک شد.")
redis:del(hash)
     end
   end
 end

return {
  patterns = {
  "[!/#]([Dd]el) (.*)$",
  },
  run = run
}

