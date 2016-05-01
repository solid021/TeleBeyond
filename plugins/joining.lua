local function run(msg, matches)
    if matches[1] == "support" then
 local user = "user#id"..msg.from.id
 local fachat = "chat#id"..123229873
 chat_add_user(fachat, user, ok_cb, false)
    end
    if matches[1] == "ساپورت" then
 local user = "user#id"..msg.from.id
 local devchat = "chat#id"..123229873
 chat_add_user(devchat, user, ok_cb, false)
    end
end

return {
  patterns = {
    "^[!/]([Ss]upport)$",
    "^(ساپورت)$"
  },
  run = run
}
