local HttpRequest = game:GetService('HttpService')
local WebsiteUrl = "https://quantumixwebsite.zenithdust.repl.co/increment_players"

loadstring(game:HttpGet('https://raw.githubusercontent.com/ZenithDust/Quantumix/main/Games/QXAWS.lua'))()

local reponse = {Url=WebsiteUrl, Body="", Method="POST", Headers="application/json"}
local request = http_request or request or HttpPost or syn.request

local r = request(reponse)
for i,v in pairs(r) do
  print(v)
end
