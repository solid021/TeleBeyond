local function run(msg, matches)
  local token = '237645229:AAE8See6WKtCBwTOdPBF3dP74uT583qwAAw'
   local url = 'https://api.telegram.org/bot'..token..'/sendMessage?chat_id='..matches[2]..'&text='..URL.escape(matches[3])..'&parse_mode=markdown&disable_web_page_preview=true'
  https.request(url)
  print (url)
  return 'i will sent:\n'..matches[3]..'\n with markdown to :\n '..matches[2]

end
return {
  patterns = {
    "^[#!/](msg) (.*) (.*)$",
  },
  run = run
}
