local function run(msg)
if msg.text == "خوبی" then
	return reply_msg(msg.id, "فدات تو خوبی", ok_cb, false)
end
if msg.text == "چه خبر" then
	return reply_msg(msg.id,  "سلامتی", ok_cb, false)
end
if msg.text == "تله بی دی" then
	return reply_msg(msg.id, "بلی؟", ok_cb, false)
end
if msg.text == "سعید" then
	return reply_msg(msg.id, "پدر بیا کارت دارن😐", ok_cb, false)
end
if msg.text == "mrhalix" then
	return reply_msg(msg.id, "با بابا امینم چکار داری؟", ok_cb, false)
end
if msg.text == "beyondteam" then
	return reply_msg(msg.id, "Best Team Of Telegram😎", ok_cb, false)
end
if msg.text == "ربات" then
	return reply_msg(msg.id, "وات؟😐", ok_cb, false)
end
if msg.text == "کانال" then
	return reply_msg(msg.id, "کانال تیم @BeyondTeam", ok_cb, false)
end
if msg.text == "امبرلا" then
	return reply_msg(msg.id, "اسم اصلیش چسبرلاست😂", ok_cb, false)
end
if msg.text == "xy" then
	return reply_msg(msg.id, "چخه😐", ok_cb, false)
end
if msg.text == "/start" then
	return reply_msg(msg.id, "میخاری؟", ok_cb, false)
end
if msg.text == "نوا" then
	return reply_msg(msg.id, "چس اسپمر نگاییدم", ok_cb, false)
end
if msg.text == "سلید" then
	return reply_msg(msg.id, "مای فادِر بیا کارت دارن😐", ok_cb, false)
end

if msg.text == "TeleBd" then
	return reply_msg(msg.id, "What?", ok_cb, false)
end
if msg.text == "Telebd" then
	return reply_msg(msg.id, "بلی؟", ok_cb, false)
end
if msg.text == "bot" then
	return reply_msg(msg.id, "😐؟", ok_cb, false)
end
if msg.text == "Bot" then
	return reply_msg(msg.id, "کاری داری؟", ok_cb, false)
end
if msg.text == "؟" then
	return reply_msg(msg.id, "هوم؟", ok_cb, false)
end
if msg.text == "بای" then
	return reply_msg(msg.id, "خدافظ😐✋", ok_cb, false)
end
if msg.text == "Bye" then
	return reply_msg(msg.id, "Bye😐✋", ok_cb, false)
end
if msg.text == "ممشوتک" then
	return reply_msg(msg.id, "نگاییدم", ok_cb, false)
end
if msg.text == "سلام" and is_sudo(msg) then
	return reply_msg(msg.id, "😐✋سلام مای فادِر", ok_cb, false)
    else
	return reply_msg(msg.id, "😐✋سلام", ok_cb, false)
end
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^سلام$",
		"^خوبی$",
		"^چه خبر$",
		"^تله بی دی$",
		"^نوا$",
		"^نووا$",
		"^ممشوتک$",
		"^کانال$",
		"^ربات$",
   "^امبرلا$",
		"^[Tt]eleBd$",
   "^/start$",
   "^[Bb]eyondteam$",
   "^[Bb]eyond team$",
   "^[Xx]y$",
                                "^[Tt]elebd$",
		"^[Bb]ye$",
                                "^[Bb]ot$",
		"^؟$",
		"^بای$",
		"^سعید$",
		"^سلید$",
		"^[Mm]rhalix$"
		}, 
	run = run,
	pre_process = pre_process
}
