local function run(msg)
if msg.text == "hi" then
	return "Hello\n"..msg.from.first_name
end
if msg.text == "Hi" then
	return "Hello\n"..msg.from.first_name
end
if msg.text == "Hello" then
	return "Hi\n"..msg.from.first_name
end
if msg.text == "hello" then
	return "Hi\n"..msg.from.first_name
end
if msg.text == "slm" then
	return "سلام\n"..msg.from.first_name
end
if msg.text == "Slm" then
	return "سلام\n"..msg.from.first_name
end
if msg.text == "salam" then
	return "سلام\n"..msg.from.first_name
end
if msg.text == "Salam" then
	return "سلام\n"..msg.from.first_name
end
if msg.text == "خوبی" then
	return "فدات تو خوبی؟"
end
if msg.text == "چه خبر" then
	return "سلامتی خبری نیس"
end
if msg.text == "چخبر" then
	return "سلامتی خبری نیس"
end
if msg.text == "mrhalix" then
	return "با بابا امینم چکار داری؟"
end
if msg.text == "Mrhalix" then
	return "با بابا امینم چکار داری؟"
end
if msg.text == "سلید" then
	return "مای فادِر بیا کارت دارن"
end
if msg.text == "سعید" then
	return "مای فادِر بیا کارت دارن"
end
if msg.text == "ممشوتک" then
	return "نگاییدم"
end
if msg.text == "mamshotak" then
	return "ممه هاش تکه😂"
end
if msg.text == "Mamshotak" then
	return "ممه هاش تکه😂"
end
if msg.text == "نوا" then
	return "چس اسپمر نگاییدم"
end
if msg.text == "نووا" then
	return "چس اسپمر نگاییدم"
end
if msg.text == "nova" then
	return "چس اسپمر نگاییدم"
end
if msg.text == "Nova" then
	return "چس اسپمر نگاییدم"
end
if msg.text == "امبرلا" then
	return "اسم اصلیش چسبرلاست"
end
if msg.text == "telebd" or msg.text == "Telebd" then
	return "بلی?"
end
if msg.text == "bot" then
	return "هوم؟"
end
if msg.text == "xy" then
	return "😐چخه"
end
if msg.text == "Xy" then
	return "😐چخه"
end
if msg.text == "؟" then
	return ":|"
end
if msg.text == "bye" then
	return "Bye\n"..msg.from.first_name
end
if msg.text == "Bye" then
	return "Bye\n"..msg.from.first_name
end
if msg.text == "بای" then
	return "خدافظ\n"..msg.from.first_name
end
if msg.text == "سلام" and is_sudo(msg) then
  return "😐✋سلام مای فادِر"
   else
	return "😐✋سلام\n"..msg.from.first_name
end
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Hh]i$",
		"^[Hh]ello$",
		"^[Xx]y$",
		"^ممشوتک$",
   "^نوا$",
   "^نووا$",
   "^بای$",
   "^سلام$",
   "^خوبی$",
   "^سعید$",
   "^سلید$",
   "^چه خبر$",
   "^چخبر$",
   "^[Tt]elebd$",
   "^[Mm]rhalix$",
   "^[Mm]amshotak$",
   "^[Nn]ova$",
		"^[Bb]ot$",
		"^امبرلا$",
		"^[Bb]ye$",
		"^؟$",
		"^[Ss]alam$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
