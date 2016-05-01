do
 function run(msg, matches)
 
 local fuse = 'بازخورد جدید\n\nآیدی : ' .. msg.from.id .. '\n\nاسم: ' .. msg.from.print_name ..'\n\nیوزر: @' .. msg.from.username .. '\n\nمتن پیام:\n' .. matches[1] 
 local fuses = '!printf user#id' .. msg.from.id
 
 
   local text = matches[1]
   local chat = "chat#id"..130074678
   --like : local chat = "chat#id"..12345678
   
  local sends = send_msg(chat, fuse, ok_cb, false)
  return 'ارسال شد!'
 
 end
 end
 return {
  
  description = "Feedback",
 
  usage = "!feedback message",
  patterns = {
  "^[!/][Ff]eedback (.*)$",
  "^ارسال نظر (.*)$"
 
  },
  run = run
 }
   
