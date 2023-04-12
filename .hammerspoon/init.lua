hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- local sock = hs.socket.new()

-- hs.hotkey.bind({ "alt" }, "d", function()
-- 	local msg = "space\0--layout\0bsp\0"
-- 	-- hs.alert.show("bsp")
-- 	sock:setCallback(function(data)
-- 		hs.alert.show("DATA: " .. data)
-- 	end)
-- 	sock:connect("/tmp/yabai_nathan.socket", function()
-- 		hs.alert.show("socket connected")
-- 		sock:write(msg, function()
-- 			hs.alert.show("bsp")
-- 			-- sock:read("\0")
-- 			sock:disconnect()
-- 		end)
-- 	end)
-- end)
-- local yabaiCmd = "/opt/homebrew/bin/yabai"

-- local function yabai(mods, key, cmd)
-- 	hs.hotkey.bind(mods, key, function()
-- 		hs.alert(cmd)
-- 		local _, status, _, _ = hs.execute(yabaiCmd .. " " .. cmd)
-- 		hs.alert(status)
-- 	end)
-- end

-- yabai({ "alt" }, "s", "-m space --layout float")
-- yabai({ "alt" }, "d", "-m space --layout bsp")
