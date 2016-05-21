do

local function run(msg, matches)
  if matches[1]:lower() == 'telebeyond' or 'version' or 'ver' or 'git' then --change this with anything you want
    send_document(get_receiver(msg), "./axs/telebeyond.gif", ok_cb, false) --put here sticker location(if you want)
      return [[ 
  
    
Tele Beyond Final Version
An Administrator The PowerFull Bot Based On TeleSeed And Bilingual Written In Lua
    
Sudo Users :
Developer&Founder : @SoLiD021
Developer&Manager : @MrHalix
    
Team Channel :
@BeyondTeam
     
Special Thx To :
@idivanmanheb
Beyond Team
And All My Friends :D
     
TeleBeyond (Open Source) V4.5 :
Https://Github.com/solid021/TeleBeyond
 ]]
  end
end

return {
  patterns = {
    "^[!/#]([Tt]elebeyond)$",
    "^([Tt]elebeyond)$",
    "^[!/#]([Vv]ersion)$",
    "^([Vv]ersion)$",
    "^([Gg]it)$",
    "^[!/#]([Gg]it)$",
    "^([Vv]er)$",
    "^[!/#]([Vv]er)$"
    },
  run = run
}
end
