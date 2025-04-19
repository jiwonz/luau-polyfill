local chalk = require("@pkg/chalk_luau")

local robloxCompat = {}

if _G.LUA_ENV == "luau" or _G.LUA_ENV == "lune" then
	function robloxCompat.warn(...)
		print(chalk.yellow(`[WARN]: {table.concat({...}, " ")}`))
	end

	if _G.LUA_ENV == "luau" then
		-- Original code credits to: https://gist.github.com/liukun/f9ce7d6d14fa45fe9b924a3eed5c3d99
		function robloxCompat.HttpServiceUrlEncode(input: string): string
			local function charToHex(c: string): string
				return string.format("%%%02X", string.byte(c))
			end
			input = input.gsub(input, "\n", "\r\n")
			input = input.gsub(input, "([^%w _%%%-%.~])", charToHex)
			input = input.gsub(input, " ", "%%20")
			return input
		end
	elseif _G.LUA_ENV == "lune" then
		local net = require("@lune/net")

		robloxCompat.HttpServiceUrlEncode = net.urlDecode
	end
elseif _G.LUA_ENV == "roblox" then
	-- selene: allow(undefined_variable)
	local HttpService = game:GetService("HttpService")

	-- selene: allow(undefined_variable)
	robloxCompat.warn = warn

	function robloxCompat.HttpServiceUrlEncode(input: string): string
		return HttpService:UrlEncode(input)
	end
end

return robloxCompat
