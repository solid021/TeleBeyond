
local function run(msg, matches)
if msg.to.type == 'chat' then
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_eng'] then
                lock_eng = data[tostring(msg.to.id)]['settings']['lock_eng']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_eng == "yes" then
        send_large_msg(chat, 'انگلیسی ممنوعه😐✋')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 end
return {
    usage ={
        "lock adds: If User Send A Link Then Removed From Bot.",
        "unlock adds: Adds Is Enabled.",
        },
  patterns = {
    "(a)",
    "(b)",
    "(c)",
    "(d)",
    "(e)",
    "(f)",
    "(g)",
    "(h)",
    "(i)",
    "(j)",
    "(k)",
    "(l)",
    "(m)",
    "(n)",
    "(o)",
    "(p)",
    "(q)",
    "(r)",
    "(s)",
    "(t)",
    "(u)",
    "(v)",
    "(w)",
    "(x)",
    "(y)",
    "(z)",
    "(A)",
    "(B)",
    "(C)",
    "(D)",
    "(E)",
    "(F)",
    "(G)",
    "(H)",
    "(I)",
    "(J)",
    "(K)",
    "(L)",
    "(M)",
    "(N)",
    "(O)",
    "(P)",
    "(Q)",
    "(R)",
    "(S)",
    "(T)",
    "(U)",
    "(V)",
    "(W)",
    "(X)",
    "(Y)",
    "(Z)",
  },
  run = run
}
