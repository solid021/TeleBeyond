do

function run(msg, matches)
  if msg.to.type== 'chat' then
     send_document(get_receiver(msg), "./axs/brucelee.webp", ok_cb, false)
      send_large_msg("chat#id".. msg.to.id , "شما با فن اخر بروسلی کشته میشوید!😐✋")
      chat_del_user("chat#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
end
end
return {
  description = "Fun Plugin", 
  usage = "!killme : Fun Plugin",
  patterns = {
    "^[#!/]killme$"
    }, 
  run = run 
}

end