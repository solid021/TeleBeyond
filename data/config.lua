do local _ = {
  about_text = "Tele Beyond V4.5\nAn Administrator The PowerFull Bot Based On TeleSeed And Bilingual Written On Lua\n\nSudo Users :\nDeveloper&Founder : @SoLiD021\nManager&Helper : @MrHalix\n\nTeam Channel :\n@BeyondTeam\n\nSpecial Thx To :\n@idivanmanheb\nBeyond Team\nAnd All My Friends\n",
  disabled_channels = {},
  disabled_plugin_on_chat = {
    ["chat#id108270013"] = {
      welcome = true
    },
    ["chat#id111570456"] = {
      Id = false,
      broadcast = true,
      chat = true,
      echo = true,
      set = true,
      welcome = true
    },
    ["chat#id122516752"] = {
      chat = true,
      set = true
    },
    ["chat#id122657171"] = {
      Id = true,
      ingroup2 = false,
      welcome = true
    },
    ["chat#id123229873"] = {
      Id = false,
      welcome = true
    },
    ["chat#id126591901"] = {
      welcome = true
    },
    ["chat#id129301187"] = {
      welcome = false
    },
    ["chat#id129830401"] = {
      broadcast = true,
      chat = true,
      set = true,
      welcome = true
    },
    ["chat#id132387034"] = {
      welcome = true
    },
    ["chat#id133282232"] = {
      Id = true,
      welcome = true
    },
    ["chat#id135348966"] = {
      welcome = false
    },
    ["chat#id137295031"] = {
      welcome = true
    },
    ["chat#id139833120"] = {
      welcome = true
    }
  },
  enabled_plugins = {
    "onservice",
    "inrealm",
    "inpm",
    "Help",
    "plugins",
    "joining",
    "addplug",
    "stats",
    "owners",
    "set",
    "get",
    "broadcast",
    "download_media",
    "invite",
    "all",
    "leave_ban",
    "admin",
    "expire",
    "plugmanager",
    "quran",
    "antitag",
    "echofile",
    "tagall",
    "lock_join",
    "lock_ads",
    "invsudo",
    "info",
    "info_en",
    "feedback",
    "auto_leave",
    "antixy",
    "Wai",
    "Time",
    "TEXST",
    "shekayat",
    "QR",
    "media_handler",
    "MAP",
    "Id",
    "rankSLM",
    "BLOCK",
    "ECHO",
    "echo",
    "Calculator",
    "GET",
    "link",
    "invite2",
    "banhammer",
    "addsudo",
    "user",
    "name",
    "calc-fa",
    "calc-en",
    "arabic_lock",
    "tts",
    "tophoto",
    "tosticker",
    "getplug",
    "antifosh",
    "lock_eng",
    "antisticker",
    "tosupp",
    "txt2stick",
    "ingroup2",
    "setstick",
    "welcome",
    "chat",
    "linksup",
    "gm",
    "lock_fwd",
    "translate",
    "shortlink",
    "google",
    "share_contact",
    "help_pv",
    "filterword",
    "apk",
    "time2",
    "weather",
    "instagram",
    "helpfun_fa",
    "help_en",
    "help_fa",
    "helpfun_en",
    "fantasty_writter",
    "lock_media",
    "lock_chat",
    "lock_emoji",
    "antispam_gp",
    "antispam_pv"
  },
  help_text = "Commands list :\n!kick [username|id]\nYou can also do it by reply\n!ban [ username|id]\nYou can also do it by reply\n!unban [id]\nYou can also do it by reply\n!who\nMembers list\n!modlist\nModerators list\n!promote [username]\nPromote someone\n!demote [username]\nDemote someone\n!kickme\nWill kick user\n!about\nGroup description\n!setphoto\nSet and locks group photo\n!setname [name]\nSet group name\n!rules\nGroup rules\n!id\nreturn group id or user id\n!help\n!lock [member|name|bots|leave]\9\nLocks [member|name|bots|leaveing] \n!unlock [member|name|bots|leave]\nUnlocks [member|name|bots|leaving]\n!set rules <text>\nSet <text> as rules\n!set about <text>\nSet <text> as about\n!settings\nReturns group settings\n!newlink\ncreate/revoke your group link\n!link\nreturns group link\n!owner\nreturns group owner id\n!setowner [id]\nWill set id as owner\n!setflood [value]\nSet [value] as flood sensitivity\n!stats\nSimple message statistics\n!save [value] <text>\nSave <text> as [value]\n!get [value]\nReturns text of [value]\n!clean [modlist|rules|about]\nWill clear [modlist|rules|about] and set it to nil\n!res [username]\nreturns user id\n\"!res @username\"\n!log\nwill return group logs\n!banlist\nwill return group ban list\n**U can use both \"/\" and \"!\" \n*Only owner and mods can add bots in group\n*Only moderators and owner can use kick,ban,unban,newlink,link,setphoto,setname,lock,unlock,set rules,set about and settings commands\n*Only owner can use res,setowner,promote,demote and log commands\n",
  help_text_realm = "Realm Commands:\n!creategroup [Name]\nCreate a group\n!createrealm [Name]\nCreate a realm\n!setname [Name]\nSet realm name\n!setabout [GroupID] [Text]\nSet a group's about text\n!setrules [GroupID] [Text]\nSet a group's rules\n!lock [GroupID] [setting]\nLock a group's setting\n!unlock [GroupID] [setting]\nUnock a group's setting\n!wholist\nGet a list of members in group/realm\n!who\nGet a file of members in group/realm\n!type\nGet group type\n!kill chat [GroupID]\nKick all memebers and delete group\n!kill realm [RealmID]\nKick all members and delete realm\n!addadmin [id|username]\nPromote an admin by id OR username *Sudo only\n!removeadmin [id|username]\nDemote an admin by id OR username *Sudo only\n!list groups\nGet a list of all groups\n!list realms\nGet a list of all realms\n!log\nGrt a logfile of current group or realm\n!broadcast [text]\n!broadcast Hello !\nSend text to all groups\nOnly sudo users can run this command\n!bc [group_id] [text]\n!bc 123456789 Hello !\nThis command will send text to [group_id]\n**U can use both \"/\" and \"!\" \n*Only admins and sudo can add bots in group\n*Only admins and sudo can use kick,ban,unban,newlink,setphoto,setname,lock,unlock,set rules,set about and settings commands\n*Only admins and sudo can use res, setowner, commands\n",
  moderation = {
    data = "data/moderation.json"
  },
  sudo_users = {
    157059515,
    140529465,
    103214508
  }
}
return _
end