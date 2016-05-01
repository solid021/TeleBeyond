local function run(msg, matches)
if not is_sudo(msg) then
		return
	end
	local output = loadstring(matches[2])()
	if output == nil then
		output = 'Done!'
	elseif type(output) == 'table' then
		output = 'Done! Table returned.'
	else
		output = tostring(output)
	end
	return output
end
  
return {
  patterns = {
    "^[!/#](lua) (.*)$"
  },
  run = run
}
