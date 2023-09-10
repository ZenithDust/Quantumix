local HttpRequest = game:GetService('HttpService')
local WebsiteUrl = "https://quantumix.fun/api/quantumix/executed"

local reponse = {Url=WebsiteUrl, Body="", Method="POST", Headers="application/json"}
local request = http_request or request or HttpPost or syn.request

local r = request(reponse)
print('Welcome To Quantumix HUB!')
