do
local function run(msg, matches)
local data = load_data(_config.moderation.data)
if not is_chat_msg(msg) then
	return
else
if data[tostring(msg.to.id)] then
	local settings = data[tostring(msg.to.id)]['settings']
	if #matches == 2 then
		
		if matches[1] == 'ewlink' and is_owner(msg) then
			local function link_callback (extra , success, result)
				local receiver = extra.receiver
				if success == 0 then
					return "Error!"
				end
				data[tostring(msg.to.id)]['settings']['set_link'] = result
				save_data(_config.moderation.data, data)
				local group_link = data[tostring(msg.to.id)]['settings']['set_link']
				send_large_msg(receiver, "New group link sent!")
				send_large_msg('user#'..msg.from.id, "New Group Link:\n______________________________\n"..group_link)
			end
			local receiver = 'chat#'..msg.to.id
			return export_chat_link(receiver, link_callback, {receiver = receiver})

		elseif matches[1] == 'ink' and is_owner(msg) then
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				return "First Make Newlink!"
			end
			send_large_msg('chat#'..msg.to.id, "Link sent!")
			send_large_msg('user#'..msg.from.id, "Group link:\n______________________________\n"..group_link)
		end
		
	else
		
		if matches[1] == 'ewlink' and is_momod(msg) then
			local function link_callback (extra , success, result)
				local receiver = extra.receiver
				if success == 0 then
					return "Error!"
				end
				data[tostring(msg.to.id)]['settings']['set_link'] = result
				save_data(_config.moderation.data, data)
				local group_link = data[tostring(msg.to.id)]['settings']['set_link']
				send_large_msg(receiver, "New Group Link:\n______________________________\n"..group_link)
			end
			local receiver = 'chat#'..msg.to.id
			return export_chat_link(receiver, link_callback, {receiver = receiver})
		
		elseif matches[1] == 'link' and is_momod(msg) then
			local function link_callback (extra , success, result)
				local receiver = extra.receiver
				if success == 0 then
					return "Error in closing link!"
				end
				data[tostring(msg.to.id)]['settings']['set_link'] = result
				save_data(_config.moderation.data, data)
				send_large_msg(receiver, "Link closed")
			end
			local receiver = 'chat#'..msg.to.id
			return export_chat_link(receiver, link_callback, {receiver = receiver})

		elseif matches[1] == 'ink' and is_momod(msg) then
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				return "First Make  Newlink"
			end
			return "Group link:\n______________________________\n"..group_link
		end
	end
end
end
end
 
return {
  description = "Link Manager System",
  usagehtm = '<tr><td align="center">link</td><td align="right">مشاهده ي لينک گروه</td></tr>'
  ..'<tr><td align="center">link pv</td><td align="right">دريافت لينک گروه در پي وي</td></tr>'
  ..'<tr><td align="center">newlink</td><td align="right">ساخت لينک جديد براي گروه</td></tr>'
  ..'<tr><td align="center">newlink pv</td><td align="right">ساخت لينک جديد براي گروه و دريافت آن در پي وي</td></tr>'
  ..'<tr><td align="center">clink</td><td align="right">بستن و منقضي کردن لينک گروه</td></tr>',
  usage = {
  moderator = {
	"link : مشاهده لينک",
	"link pv : ارسال لينک در خصوصي",
	"newlink : ساخت لينک جديد",
	"newlink pv : لينک جديد در خصوصي",
	"clink : بستن لينک",
    },
	},
  patterns = {
    --"^[!/][Nn](ewlink)$",
    --"^[!/][Ll](ink)$",
	--"^[!/][Nn](ewlink) ([Pp]v)$",
    "^[!/][Ll](ink) ([Pp]v)$",
	"^[!/][Cc](link)$",
	--"^[Nn](ewlink)$",
--*"^[Ll](ink)$",
	"^[Nn](ewlink) ([Pp]v)$",
    "^[Ll](ink) ([Pp]v)$",
	"^[Cc](link)$",
  },
  run = run,
  moderated = true
}
end