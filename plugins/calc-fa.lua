-- Function reference: http://mathjs.org/docs/reference/functions/categorical.html

local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
    text = 'جواب معادله : '..b
  
  elseif c == 400 then
    text = b
  else
    text = 'پیدا نشد!'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end

return {
  description = " حساب کن عدد رو",
  usage = "/حساب کن (formulas) : ex.formulas (3+7)*(2^3)/5",
  patterns = {
    "^حساب کن (.*)$"
  },
  run = run
}
