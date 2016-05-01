local database = 'http://alirezabot.uk.to/'
local function run(msg)
local res = http.request(database.."joke.db")
local joke = res:split(",")
return joke[math.random(#joke)]
end

return {
description = "500 Persian Joke",
usage = "!joke : send random joke",
patterns = {
 "^[/!]joke$",
 "^(جوک)$"
 },
run = run
}