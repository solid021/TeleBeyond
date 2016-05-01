do

local function run(msg, matches)
  if matches[1]:lower() == "send" or matches[1]:lower() == "بفرس" then
    local file = matches[2]
    if is_sudo(msg) then
      local receiver = get_receiver(msg)
      send_document(receiver, "./plugins/"..file..".lua", ok_cb, false)
    end
  end
end

return {
  patterns = {
  "^[!/]([Ss]end) (.*)$",
  "^([Ss]end) (.*)$",
  "^(بفرس) (.*)$"
  },
  run = run
}
end
