local lock = 1
local txt = "\n\nساخته شده توسط:@BeyondTeam" -- shared by @BeatBot_Team
local function callback(extra, success, result) --— Calback Bara Load Kardn ax
  if success then
    local file = './data/photos/'..msg.from.id..'.jpg'
    print('File downloaded to:', result)
     os.rename(result, file)
     print('File moved to:', file)
     
  else
    print('Error downloading: '..extra)
  end
end
--—khob berim function run ro benvisim 
local function run(msg, matches)
local file = './data/photos/'..msg.from.id..'.jpg'

if msg.to.type == 'chat' then

if matches[1]:lower() == "off photo" or  matches[1]:lower() == "عکس ساز خاموش" then
    if is_owner(msg) then
lock = 1
return "عکس ساز قفل شد ! \nاکنون فقط (سودو،ادمین،صاحب گروه) میتوانند از آن استفاده کنند."
else
return "قفط مخصوص سودو !"
end
end

if matches[1]:lower() == "on photo" or matches[1]:lower() == "عکس ساز روشن" then
    if is_sudo(msg) then
lock = 0
return "قفل عکس ساز غیر فعال شد ! \nاکنون همه میتوانند از آن استفاده کنند."
else

return "قفط مخصوص سودو !"
end
end
--—------------------------------
if matches[1]:lower() == "photo" or matches[1]:lower() == "عکس کن" or matches[1]:lower() == "تبدیل به عکس" then
    if lock == 0 then
    send_photo(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
else
    if is_momod(msg) then 
        send_photo(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
   end
   if not is_momod(msg) then
    return "عکس ساز برای اعضا قفل میباشد!"
    end
end
end
if matches[1]:lower() == "photo" or matches[1]:lower() == "عکس" then
    if lock == 0 then
    send_photo(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
else
    if is_momod(msg) then 
        send_photo(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
   end
   if not is_momod(msg) then
    return "عکس ساز برای اعضا قفل میباشد!"
    end
end
end

if matches[1]:lower() == "show photo" or matches[1]:lower() == "نمایش عکس" then
if lock == 1 then
    return 'عکس ساز : خاموش'
else
return 'عکس ساز : روشن'    
end

end
if msg.media then
    if msg.media.type == 'document' then
        
      load_document(msg.id, callback, msg.id)
      if lock == 0 then
             return 'استیکر ذخیره شد ! \nبرای دریافت آن از دستور (photo,عکس) استفاده کنید.'..txt
    else
        return ''
    end
    
end

   
end
else
return 'عکس ساز فقط در گروه عمل میکند !'..text
end

   end

return {
  patterns = {
  "^[!/]([Pp]hoto)$",  
  "^عکس کن$", 
  "^photo$",
  "^عکس$",
  "^[Ss]how photo$",
  "^نمایش عکس$",
  "^on photo$",
  "^off photo$",
  "^عکس ساز خاموش$",
  "^عکس ساز روشن$",
  "^تبدیل به عکس$",
  '%[(document)%]'
  },
  run = run
}
--—tnx to @xx_mersad_xx
