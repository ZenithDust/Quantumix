Tabs.MainTab:AddParagraph({
    Title = "Quantumix",
    Content = "The fresh script-sharing community for Roblox, founded by ZenithDust. Enhance your Roblox game experience with innovative scripts and join us in building a vibrant gaming community."
  })
  Tabs.MainTab:AddParagraph({
    Title = "Information:",
    Content = "Executor: "..identifyexecutor().." | Game: "..services.GameName
  })
  Tabs.MainTab:AddButton({
    Title = "Anti AFK",
    Description = "Prevents you from getting kicked after 20mins of idle.",
    Callback = function()
      game:GetService("Players").LocalPlayer.Idled:connect(function()
		    services.vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		    wait(1)
		    services.vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		  end)
    end
  })
  Tabs.MainTab:AddButton({
    Title = "TP Lowest Server",
    Description = "Teleport you to a server with less players.",
    Callback = function()
      local request = syn and syn.request or http and http.request or http_request or request or httprequest
      local response = services.HttpService:JSONDecode(request({
        Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=25",
        Method = "GET"
      }).Body)
      local firstServer = response.data[1]
      if firstServer then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,firstServer.id,game.Players.LocalPlayer)
      end
    end
  })
  Tabs.MainTab:AddButton({
    Title = "TP Highest Server",
    Description = "Teleports you to high player server.",
    Callback = function()
      local request = syn and syn.request or http and http.request or http_request or request or httprequest
      local response = services.HttpService:JSONDecode(request({
        Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=25&excludeFullGames=true",
        Method = "GET"
      }).Body)
      local firstServer = response.data[1]
      if firstServer then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,firstServer.id,game.Players.LocalPlayer)
      end
    end
  })
  Tabs.MainTab:AddButton({
    Title = "Rejoin",
    Description = "Teleports you back to this server",
    Callback = function()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
  })
