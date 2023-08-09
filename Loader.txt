if not game:IsLoaded() then
  game.Loaded:Wait()
end
local scriptUrl = string.format("https://github.com/ZenithDust/Quantumix/raw/main/Games/%d.lua", game.PlaceId)
pcall(function()
loadstring(game:HttpGet(scriptUrl))()end)
