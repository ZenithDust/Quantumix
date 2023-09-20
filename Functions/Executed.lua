local Players = game:GetService('Players')
local HttpRequest = game:GetService('HttpService')
local WebsiteUrl = "https://hub.quantumix.fun/api/quantumix/executed"
local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..Players.LocalPlayer.UserId.."&size=420x420&format=Png&isCircular=true"
local request = http_request or request or HttpPost or syn.request

local reponse2 = {Url=url, Method="GET", Headers="application/json"}
local GetBody = request(reponse2)
local decodedRequest = HttpRequest:JSONDecode(GetBody.Body)
local ImageUrl = decodedRequest.data[1].imageUrl

local bodyData = {
  ["username"] = tostring(Players.LocalPlayer.Name),
  ["userid"] = tostring(Players.LocalPlayer.UserId),
  ['avatar'] = tostring(ImageUrl)
}
local headers = {["content-type"] = "application/json"}

local encodedBody = HttpRequest:JSONEncode(bodyData)

local reponse = {Url=WebsiteUrl, Body=encodedBody, Method="POST", Headers=headers}

local r = request(reponse)
print(r.StatusCode)
print('Welcome To Quantumix HUB!')