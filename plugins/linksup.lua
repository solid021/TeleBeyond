do

function run(msg, matches)
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(123229873)]['settings']['set_link']
       if not group_link then
      return ''
       end
         local text = "لینک ساپورت:\n" ..group_link
 return "👈"..text
end

return {
  patterns = {
    "^لینک ساپورت$",
    "^[/#!]([Ll]inksup)$",
 "^([Ll]inksup)$"
  },
  run = run
}

end
