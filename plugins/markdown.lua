
local function run(msg, matches)
  local text = matches[1]
      return '`"..text.."`'
end

return {
  description = "Reply Your Sent Message",
  usage = "/echo (message) : reply message",
  patterns = {
    "^[!/]testt +(.+)$"
  }, 
	run = run,
	moderated = true
}
