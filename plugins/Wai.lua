do

local function run(msg, matches)
  if matches[1]:lower() == 'wai' or matches[1]:lower() == 'me' or matches[1]:lower() == 'من کیم' then
    if is_sudo(msg) then
     send_document(get_receiver(msg), "./axs/sudo.webp", ok_cb, false)
      return "یو آر مآی فآدِر😐❤"
    elseif is_admin(msg) then
    send_document(get_receiver(msg), "./axs/admin.webp", ok_cb, false)
      return "یو آر مآی اَدمین😐✋"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./axs/owner.webp", ok_cb, false)
      return "❤شما صاحب گروه هستید."
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./axs/mod.webp", ok_cb, false)
      return "😍شما مدیر گروه هستید."
    else
    send_document(get_receiver(msg), "./axs/mmbr.webp", ok_cb, false)
      return "😐شما یک عضو ساده گروه هستید."
    end
  end
end

return {
  patterns = {
    "^[!/]([Ww]ai)$",
    "^([Ww]ai)$",
    "^[!/]([Mm]e)$",
    "^([Mm]e)$",
    "^من کیم$"
    },
  run = run
}
end 
