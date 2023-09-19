local Players = game:GetService('Players')
local Thumbnail = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
local HttpRequest = game:GetService('HttpService')
local WebsiteUrl = "https://hub.quantumix.fun/api/quantumix/executed?username="..Players.LocalPlayer.Name.."&userid="..Players.LocalPlayer.UserId.."&avatar="..Thumbnail

local reponse = {Url=WebsiteUrl, Body="", Method="POST", Headers="application/json"}
local request = http_request or request or HttpPost or syn.request

local r = request(reponse)
print('Welcome To Quantumix HUB!')