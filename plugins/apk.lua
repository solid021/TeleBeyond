local function run(msg, matches)
   local link = 'apktops\nhttp://www.apktops.ir/?blogs='..URL.escape=(matches[1])
   return link
end 
 return {
     patterns = {
           "^[!#/]apk (.*)"
    },
run=run
}