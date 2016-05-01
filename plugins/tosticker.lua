local lock = 1
local txt = "\n\nساخته شده توسط:@BeyondTeam" --— shared by @BeatBot_Team
local function callback(extra, success, result) --— Calback Bara Load Kardn ax
  if success then
    local file = 'stickers/sticker.webp'
    print('File downloaded to:', result)
     os.rename(result, file)
     print('File moved to:', file)
     
  else
    print('Error downloading: '..extra)
  end
end
--—khob berim function run ro benvisim 
local function run(msg, matches)
local file = 'stickers/sticker.webp'

if msg.to.type == 'chat' then

if matches[1]:lower() == "off sticker" or matches[1]:lower() == "استیکر ساز خاموش" then
    if is_owner(msg) then
lock = 1
return "استیکر ساز قفل شد ! \nاکنون فقط (سودو،ادمین،صاحب گروه) میتوانند از آن استفاده کنند."
else
return "فقط مخصوص ودو !"
end
end

if matches[1]:lower() == "on sticker" or matches[1]:lower() == "استیکر ساز روشن" then
    if is_sudo(msg) then
lock = 0
return "قفل استیکر از غیر فعال شد ! \nاکنون همه میتوانند از آن استفاده کنند."
else

return "قفط مخصوص سودو !"
end
end
--—------------------------------
if matches[1]:lower() == "sticker"or matches[1]:lower() == "استیکر کن"or matches[1]:lower() == "تبدیل به استیکر" then
    if lock == 0 then
    send_document(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
else
    if is_momod(msg) then 
        send_document(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
   end
   if not is_momod(msg) then
    return "استیکر ساز برای اعضا قفل میباشد!"
    end
end
end
if matches[1]:lower() == "sticker" or matches[1]:lower() == "استیکر" then
    if lock == 0 then
    send_document(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
else
    if is_momod(msg) then 
        send_document(get_receiver(msg), "./"..file, ok_cb, false)
    return 'منتظر باشید!'..txt
   end
   if not is_momod(msg) then
    return "استیکر ساز برای اعضا قفل میباشد!"
    end
end
end

if matches[1]:lower() == "show sticker" or matches[1]:lower() == "نمایش استیکر" then
if lock == 1 then
    return 'استیکر ساز : خاموش'
else
return 'استیکر ساز : روشن'    
end

end
if msg.media then
    if msg.media.type == 'photo' then
        
      load_photo(msg.id, callback, msg.id)
      if lock == 0 then
             return 'عکس ذخیره شد ! \nبرای در دریافت آن از دستور (sticker،استیکر) استفاده کنید.'..txt
    else
        return ''
    end
    
end

   
end
else
return 'استیکر ساز قفل در گروه عمل میکند !'..text
end

   end

return {
  patterns = {
  "^[!/](sticker)$",  
  "^استیکر کن$", 
  "^تبدیل به استیکر$",
  "^sticker$",
  "^استیکر$",
  "^[Ss]how sticker$",
  "^نمایش استیکر$",
  "^on sticker$",
  "^off sticker$",
  "^استیکر ساز روشن$",
  "^استیکر ساز خاموش$",
  '%[(photo)%]'
  },
  run = run
}
--—tnx to @xx_mersad_xx
