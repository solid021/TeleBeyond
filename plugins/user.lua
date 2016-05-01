local function run(msg, matches ) 
  if matches[1]:lower() == "myuser" or matches[1]:lower() == "یوزر من" then
    return "یوزر شما:\n     @"..msg.from.username
  end
end

return {
  patterns ={
    "^[/!#](myuser)$",
    "([Mm]yuser)$",
    "^(یوزر من)$"
 }, 
  run = run 
}
