local HttpRequest = game:GetService('HttpService')
local WebsiteUrl = "https://quantumixwebsite.zenithdust.repl.co/increment_players"
local WebsiteUrl2 = "https://quantumixwebsite.zenithdust.repl.co/api/executed"

local reponse = {Url=WebsiteUrl, Body="", Method="POST", Headers="application/json"}
local response2 = {Url=WebsiteUrl2, Method = "GET", Headers = {["Content-Type"] = "application/json"}}
local request = http_request or request or HttpPost or syn.request

function executed()
  if reponse2.Success then
    local decodedData = HttpService:JSONDecode(response2.Body)
    for i,v in pairs(decodedData) do
      return v
    end
  end
end

local executes = executed()
local r = request(reponse)
for i,v in pairs(r) do
  if r.StatusCode == 200 then
    print('Quantumix HUB')
    print("Executes: "..executes)
  end
end
