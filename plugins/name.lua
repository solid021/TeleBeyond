local function run(msg, matches ) 
  if matches[1]:lower() == "myname" or matches[1]:lower() == "اسم من" then
    return "نام شما:\n"..msg.from.print_name
  end
end

return {
  patterns ={
    "^[/!#](myname)$",
    "^(اسم من)$"
 }, 
  run = run 
}
