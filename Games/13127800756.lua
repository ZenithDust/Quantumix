if _G.finishKey == true and game.PlaceId == 13127800756 then
  -- [ Locals ] --
  local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
  local Replicated = game:GetService("ReplicatedStorage")
  local UserInputService = game:GetService("UserInputService")
  local Game = game:GetService("Workspace")
  local vu = game:GetService('VirtualUser')
  local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
  local Egg = Replicated.Eggs:GetChildren()
  local PetList = Replicated.HiddenPets:GetChildren()
  local PetStorage = Replicated.Pets.Normal
  local Player = game.Players.LocalPlayer
  local LPGameUI = Player.PlayerGui.GameUI
  local Gifts = LPGameUI.Menus.Gifts.Container
  local craftButton = LPGameUI.Menus.PetInventory.Toolbar.CraftAll
  local PromptPlayerGUI =  LPGameUI:FindFirstChild('RoutePromptOverlay')
  local PopupPlayerGUI = LPGameUI:FindFirstChild('Popups')
  local ZonesNumber = game.Workspace.Zones
  local tween_s = game:GetService('TweenService')
  local tweeninfo = TweenInfo.new(1, Enum.EasingStyle.Linear)
  local targetColor = Color3.new(0.482353, 0.592157, 0.65098)
  local tolerance = 0.01
  
  -- [ getgenv ] --
  getgenv().autoFight = false
  getgenv().autoArmWrestle = false
  getgenv().autoClick = false
  getgenv().autoDaily = false
  getgenv().autoSpin = false
  getgenv().armClick = false
  getgenv().autoEgg = false
  getgenv().openEventEgg = false
  getgenv().autoRebirth = false
  getgenv().autoCraft = false
  getgenv().autoBest = false
  getgenv().autoKnuckle = false
  getgenv().autoClaim = false
  getgenv().autoEquip = false
  getgenv().autoKnuckle = false
  
  -- [ Main:Window ] --
  OrionLib:MakeNotification({
	Name = "Quantumix Software",
	Content = "Welcome to Quantumix, "..Player.DisplayName,
	Image = "rbxassetid://14108334210",
	Time = 5
  })
  local Window = OrionLib:MakeWindow({
    Name = "Quantumix", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "Quantumix",
    IntroEnabled = true,
    IntroText = "Quantumix HUB",
    IntroIcon = "rbxassetid://14108334210",
    Icon = "rbxassetid://14108334210"
  })
  
  -- [ Tables ] --
  local Eggs = {}
  local Pets = {}
  local zone1NPC = {}
  local zone2NPC = {}
  local zone3NPC = {}
  local zone4NPC = {}
  local zone5NPC = {}
  local zoneENPC = {}
  local giftTable = {}
  local petsTable = {}
  local petNameString = {}
  local zonesTable = {
    ['Main'] = {},
    [1] = {['Name'] = {}, ['Instance'] = {}},
    [2] = {['Name'] = {}, ['Instance'] = {}},
    [3] = {['Name'] = {}, ['Instance'] = {}},
    [4] = {['Name'] = {}, ['Instance'] = {}},
    [5] = {['Name'] = {}, ['Instance'] = {}},
    ['Event'] = {['Name'] = {}, ['Instance'] = {}}
  }
  
  -- [ GetChildren ]
  local NPC1 = Game.Zones:FindFirstChild("1").Interactables.ArmWrestling.NPC:GetChildren()
  local NPC2 = Game.Zones:FindFirstChild("2").Interactables.ArmWrestling.NPC:GetChildren()
  local NPC3 = Game.Zones:FindFirstChild("3").Interactables.ArmWrestling.NPC:GetChildren()
  local NPC4 = Game.Zones:FindFirstChild("4").Interactables.ArmWrestling.NPC:GetChildren()
  local NPC5 = Game.Zones:FindFirstChild("5").Interactables.ArmWrestling.NPC:GetChildren()
  local NPCE = Game.Zones:FindFirstChild("GreekEvent").Interactables.ArmWrestling.NPC:GetChildren()
  local giftList = Gifts:GetChildren()
  
  -- [ Functions ] --
  local function isColorEqual(color1, color2, tolerance)
    local rDiff = math.abs(color1.r - color2.r)
    local gDiff = math.abs(color1.g - color2.g)
    local bDiff = math.abs(color1.b - color2.b)
    return rDiff <= tolerance and gDiff <= tolerance and bDiff <= tolerance
  end
  function teleport(zone, zoneName)
    spawn(function()
      local args = {
        [1] = workspace.Zones:FindFirstChild(tostring(zone)).Interactables.Teleports.Locations:WaitForChild(zoneName)
      }
        
      game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(unpack(args))
    end)
  end
  function autoEggs(EggName)
    spawn(function()
      while getgenv().autoEgg == true do
        local args = {
          [1] = EggName,
          [2] = {},
          [4] = false
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(args))
        wait()
      end
    end)
  end
  function autoRebirth()
    spawn(function()
      while getgenv().autoRebirth == true do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
        wait()
      end
    end)
  end
  function openEventEgg(amount)
    spawn(function()
      while getgenv().openEventEgg do
        local args = {
          [1] = amount
        }
        
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EventService.RF.ClaimEgg:InvokeServer(unpack(args))
        wait()
      end
    end)
  end
  function autoAttack()
    spawn(function()
      while getgenv().armClick == true do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
        wait()
      end
    end)
  end
  function fightCoco()
    spawn(function()
      while getgenv().autoFight == true do
        local args = {
          [1] = "CocoNut",
          [2] = workspace.Zones:FindFirstChild("3").Interactables.ArmWrestling.NPC.CocoNut,
          [3] = "3"
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(unpack(args))
        wait()
      end
    end)
  end
  function autoClaim()
    spawn(function()
      while getgenv().autoClaim == true do
        for i, v in pairs(giftTable) do
          local currentColor = v.ImageColor3
          if not isColorEqual(currentColor, targetColor, tolerance) then
            local args = {
              [1] = tostring(v.Parent.Name)
            }
            game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer(unpack(args))
          else
            break
          end
        end
        wait()
      end
    end)
  end
  function autoDaily()
    spawn(function()
      while getgenv().autoDaily == true do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer(unpack(args))
        wait()
      end
    end)
  end
  function fightDoc()
    spawn(function()
      while getgenv().autoFight == true do
        local args = {
          [1] = "RipperDoc", 
          [2] = workspace.Zones:FindFirstChild("2").Interactables.ArmWrestling.NPC.RipperDoc,
          [3] = "2"
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(unpack(args))
        wait()
      end
    end)
  end
  function autoArmWrestle(zone, npcName)
    spawn(function()
      while getgenv().autoArmWrestle == true do
        local args = {
          [1] = npcName,
          [2] = workspace.Zones:FindFirstChild(tostring(zone)).Interactables.ArmWrestling.NPC:WaitForChild(npcName),
          [3] = tostring(zone)
        }
        
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(unpack(args))
        wait()
      end
    end)
  end
  function autoSpin()
    spawn(function()
      while getgenv().autoSpin == true do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.SpinService.RE.onSpinRequest:FireServer()
        wait()
      end
    end)
  end
  function click()
    spawn(function()
      while getgenv().autoClick == true do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
        wait()
      end
    end)
  end
  function autoCraft()
    spawn(function()
      while getgenv().autoCraft == true do
        for _,button in pairs(getconnections(craftButton.MouseButton1Click)) do
          button:Fire()
        end
        wait()
      end
    end)
  end
  function autoBest()
    spawn(function()
      while getgenv().autoBest == true do
        local args = {
          [1] = game:GetService("Players").LocalPlayer
        }
       
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.equipBest:InvokeServer(unpack(args))
        wait()
        end
    end)
  end
  function renamePet(petString, newName)
    spawn(function()
      local args = {
        [1] = petString,
        [2] = newName
      }
      game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.updateName:InvokeServer(unpack(args))
    end)
  end
  function bypass_tp(v)
   if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
    local cf = CFrame.new(v)
    local a = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweeninfo, {CFrame=cf})
    a:Play()
    a.Completed:Wait()
   end
end
  function autoKnuckle(zone, tier)
    spawn(function()
      while getgenv().autoKnuckle == true do
        local args = {
          [1] = zone,
          [2] = tier
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(args))
        wait()
      end
    end)
  end
  
  -- [ For Loops ] --
  for i, v in pairs(Egg) do
    table.insert(Eggs, v.Name)
  end
  for i, v in pairs(PetStorage:GetChildren()) do
    table.insert(Pets, v.Name)
  end
  for i, v in pairs(NPC1) do
    table.insert(zone1NPC, v.Name)
  end
  for i, v in pairs(NPC2) do
    table.insert(zone2NPC, v.Name)
  end
  for i, v in pairs(NPC3) do
    table.insert(zone3NPC, v.Name)
  end
  for i, v in pairs(NPC4) do
    table.insert(zone4NPC, v.Name)
  end
  for i, v in pairs(NPC5) do
    table.insert(zone5NPC, v.Name)
  end
  for i, v in pairs(NPCE) do
    table.insert(zoneENPC, v.Name)
  end
  for i, v in pairs(giftList) do
    if v:isA('Frame') then
      local gifts = v:GetChildren()
      for _, g in pairs(gifts) do
        if g.Name == "Claim" then
          table.insert(giftTable, g)
        end
      end 
    end
  end
  for i, v in pairs(PetList) do
    if v:IsA('Model') then
      table.insert(petNameString, v.Name)
      local petName = v:GetChildren()
      for _, z in pairs(petName) do
        table.insert(petsTable, z.Name)
      end
    end
  end
  -- for i,v in pairs(ZonesNumber:GetChildren()) do
--     if v:IsA("Folder") then
--       local interactables = v:FindFirstChild('Interactables')
--       if interactables then
--        local training = interactables.Training
--        if training then
--          local punchbag = training:FindFirstChild('PunchBags')
--          local pullupbar = training:FindFirstChild('PullupBars')
--          
--          
--          if punchbags then
--            print('hellooo')
--             table.insert(zonesTable['Main'], v.Name)
--             for i2,v2 in pairs(punchbags:GetChildren()) do
--               if v.Name == '1' then
--                 table.insert(zonesTable[1]['Name'], v2.Name)
--                 table.insert(zonesTable[1]['Instance'], v2)
--               elseif v.Name == "2" then
--                 table.insert(zonesTable[2]['Name'], v2.Name)
--                 table.insert(zonesTable[2]['Instance'], v2)
--               elseif v.Name == "3" then
--                 table.insert(zonesTable[3]['Name'], v2.Name)
--                 table.insert(zonesTable[3]['Instance'], v2)
--               elseif v.Name == "4" then
--                 table.insert(zonesTable[4]['Name'], v2.Name)
--                 table.insert(zonesTable[4]['Instance'], v2)
--               elseif v.Name == "AquaEvent" then
--                 table.insert(zonesTable['AquaEvent']['Name'], v2.Name)
--                 table.insert(zonesTable['AquaEvent']['Instance'], v2)
--               end
--             end
--           end
--           
--          if pullupbars then
--             
--          end
--        end
--      end
--   end
-- end
  
  -- [ Table Management ] --
  table.insert(Eggs, 'None')
  table.insert(Pets, 'None')
  table.insert(zone1NPC, 'None')
  table.insert(zone2NPC, 'None')
  table.insert(zone3NPC, 'None')
  table.insert(zone4NPC, 'None')
  table.insert(zone5NPC, 'None')
  table.insert(zoneENPC, 'None')

  -- [ Tabs ] --
  local Home = Window:MakeTab({
  	Name = "Quantumix",
  	Icon = "rbxassetid://14112128639",
  	PremiumOnly = false
  })
  local AWSMain = Window:MakeTab({
	Name = "Utilities",
	Icon = "rbxassetid://14130095403",
	PremiumOnly = false
  })
  local AWSEvent = Window:MakeTab({
  	Name = "Event",
  	Icon = "rbxassetid://14130101871",
  	PremiumOnly = false
  })
  local AWSFarm = Window:MakeTab({
  	Name = "AutoFarm",
  	Icon = "rbxassetid://14130215392",
  	PremiumOnly = false
  })
  local AWSEgg = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://14130108476",
	PremiumOnly = false
  })
  local AWSPets = Window:MakeTab({
    Name = "Pets",
    Icon = "rbxassetid://14205271717",
    PremiumOnly = false
  })
  local AWSTeleport = Window:MakeTab({
  	Name = "Teleport",
  	Icon = "rbxassetid://14130110838",
  	PremiumOnly = false
  })
  
  -- [ Dropdown ] --
  local selectedZone
  local selectedEgg
  local selectedNPC
  local selectedNPC2
  local selectedNPC3
  local selectedNPC4
  local selectedNPC5
  local seletedENPC
  local selectedPets
  local petToName
  local newName
  local selectedPosition
  local selectedZone
  local selectedTier
  local importedPets = {}
  
  -- [ Components ] --
  Home:AddParagraph("Quantumix", "The fresh script-sharing community for Roblox, founded by ZenithDust. Enhance your Roblox game experience with innovative scripts and join us in building a vibrant gaming community.")
  Home:AddParagraph("Info: ", "Executor: "..identifyexecutor().." | Game: "..GameName)
  Home:AddToggle({
  	Name = "Anti-AFK",
  	Default = false,
  	Save = true,
  	Callback = function(Value)
  		if Value == true then
  		  game:GetService("Players").LocalPlayer.Idled:connect(function()
  		  vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  		  wait(1)
  		  vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  		  end)
  		else
  		  print('disabled')
  		end
  	end,
  	Flag = "anti-afk"
  })
  Home:AddButton({
    Name = "Join Discord",
    Callback = function()
      setclipboard("https://discord.gg/3m5sG9Dgks")
    end
  })
  Home:AddButton({
    Name = "YouTube Channel",
    Callback = function()
      setclipboard("https://www.youtube.com/channel/UC-V-9vyJjGSnsg5ORW4YxSQ")
    end
  })
  Home:AddButton({
  	Name = "Destroy UI",
  	Callback = function()
      OrionLib:Destroy()
    end
  })

  AWSMain:AddParagraph('Main', "Note: Basic functions for the game's insecurities")
  AWSMain:AddToggle({
  Name = "Auto Workout",
  Default = false,
  Callback = function(bool)
    getgenv().autoClick = bool
    if bool then
      click()
    end
  end
})
  AWSMain:AddToggle({
    Name = "Auto Spin Wheel",
    Default = false,
    Callback = function(bool)
      getgenv().autoSpin = bool
      if bool then
        autoSpin()
      end
    end
  })
  AWSMain:AddToggle({
    Name = "Auto Claim Gifts",
    Default = false,
    Callback = function(bool)
      getgenv().autoClaim = bool
      if bool then
        autoClaim()
      end
    end
  })
  AWSMain:AddToggle({
    Name = "Auto Claim Daily",
    Default = false,
    Callback = function(bool)
      getgenv().autoDaily = bool
      if bool then
        autoDaily()
      end
    end
  })
  AWSEvent:AddParagraph('Event', 'Note: You can only choose one togggle to turn on.')
  AWSEvent:AddToggle({
    Name = "Zone 2: RipperDoc",
    Default = false,
    Callback = function(bool)
      getgenv().autoFight = bool
      getgenv().armClick = bool
      if bool then
        fightDoc()
        autoAttack()
      end
    end
  })
  AWSEvent:AddToggle({
    Name = "Zone 3: Beach Boss",
    Default = false,
    Callback = function(bool)
      getgenv().autoFight = bool
      getgenv().armClick = bool
      if bool then
        fightCoco()
        autoAttack()
      end
    end
  })
  AWSEvent:AddParagraph('Event Eggs', 'You can choose what to do with eggs here!')
  AWSEvent:AddToggle({
    Name = "Open Event Egg x1",
    Default = false,
    Callback = function(bool)
      getgenv().openEventEgg = bool
      if bool then
        openEventEgg(1)
      end
    end
  })
  AWSEvent:AddToggle({
    Name = "Open Event Egg x3 (Free)",
    Default = false,
    Callback = function(bool)
      getgenv().openEventEgg = bool
      if bool then
        openEventEgg(3)
      end
    end
  })
  AWSEvent:AddToggle({
    Name = "Open Event Egg x8 (Free)",
    Default = false,
    Callback = function(bool)
      getgenv().openEventEgg = bool
      if bool then
        openEventEgg(8)
      end
    end
  })
  AWSEvent:AddButton({
    Name = "Remove Egg Animation",
    Callback = function()
      game.Players.LocalPlayer.PlayerGui.OpenerUI:Destroy()
      game.StarterGui.OpenerUI:Destroy()
    end
  })

  AWSFarm:AddParagraph('Farming', 'Note: If you want to fight another NPC just turn off and turn on the toggle to move to that NPC. More Features Coming Soon')
  AWSFarm:AddDropdown({
    Name = "Select NPC: (Zone 1)",
    Default = "None",
    Options = zone1NPC,
    Callback = function(value)
      selectedNPC = value
    end
  })
  AWSFarm:AddDropdown({
    Name = "Select NPC: (Zone 2)",
    Default = "None",
    Options = zone2NPC,
    Callback = function(value)
      selectedNPC2 = value
    end
  })
  AWSFarm:AddDropdown({
    Name = "Select NPC: (Zone 3)",
    Default = "None",
    Options = zone3NPC,
    Callback = function(value)
      selectedNPC3 = value
    end
  })
  AWSFarm:AddDropdown({
    Name = "Select NPC: (Zone 5)",
    Default = "None",
    Options = zone5NPC,
    Callback = function(value)
      selectedNPC5 = value
    end
  })
  AWSFarm:AddDropdown({
    Name = "Select NPC: (Greek Event)",
    Default = "None",
    Options = zoneENPC,
    Callback = function(value)
      selectedENPC = value
    end
  })
  AWSFarm:AddToggle({
    Name = "Auto Fight",
    Default = false,
    Callback = function(bool)
      getgenv().autoArmWrestle = bool
      getgenv().armClick = bool
      if bool then
        if selectedNPC then
          autoArmWrestle(1, selectedNPC)
          autoAttack()
        end
        if selectedNPC2 then
          autoArmWrestle(2, selectedNPC2)
          autoAttack()
        end
        if selectedNPC3 then
          autoArmWrestle(3, selectedNPC3)
          autoAttack()
        end
        if selectedNPC4 then
          autoArmWrestle(4, selectedNPC4)
          autoAttack()
        end
      end
    end
  })
  AWSFarm:AddParagraph('Rebirth', 'Automatically rebirths for you!')
  AWSFarm:AddToggle({
    Name = 'Auto Rebirth',
    Default = false,
    Callback = function(bool)
      getgenv().autoRebirth = bool
      if bool then
        autoRebirth()
      end
    end
  })

  -- AWSTrain:AddDropdown({
--     Name = 'Auto Knuckles (Zone1)',
--     Default = nil,
--     Options = zonesTable[1]['Name'],
--     Callback = function(value)
--       local mak = zonesTable[1]['Instance']
--       selectedZone = value
--       selectedTier = "1"
--       for i,v in pairs(mak) do
--         if value == v.Name then
--           selectedPosition = v.Primary.Position
--         end
--       end
--     end
--   })
--   AWSTrain:AddDropdown({
--     Name = 'Auto Knuckles (Zone2)',
--     Default = nil,
--     Options = zonesTable[2]['Name'],
--     Callback = function(value)
--       local mak = zonesTable[2]['Instance']
--       selectedZone = value
--       selectedTier = "2"
--       for i,v in pairs(mak) do
--         if value == v.Name then
--           selectedPosition = v.Primary.Position
--         end
--       end
--     end
--   })
--   AWSTrain:AddDropdown({
--     Name = 'Auto Knuckles (Zone3)',
--     Default = nil,
--     Options = zonesTable[3]['Name'],
--     Callback = function(value)
--       local mak = zonesTable[3]['Instance']
--       selectedZone = value
--       selectedTier = "3"
--       for i,v in pairs(mak) do
--         if value == v.Name then
--           selectedPosition = v.Primary.Position
--         end
--       end
--     end
--   })
--   AWSTrain:AddDropdown({
--     Name = 'Auto Knuckles (Zone4)',
--     Default = nil,
--     Options = zonesTable[4]['Name'],
--     Callback = function(value)
--       local mak = zonesTable[4]['Instance']
--       selectedZone = value
--       selectedTier = "4"
--       for i,v in pairs(mak) do
--         if value == v.Name then
--           selectedPosition = v.Primary.Position
--         end
--       end
--     end
--   })
--   AWSTrain:AddDropdown({
--     Name = 'Auto Knuckles (AquaEvent)',
--     Default = nil,
--     Options = zonesTable['AquaEvent']['Name'],
--     Callback = function(value)
--       local mak = zonesTable['AquaEvent']['Instance']
--       selectedZone = value
--       selectedTier = "AquaEvent"
--       for i,v in pairs(mak) do
--         if value == v.Name then
--           selectedPosition = v.Primary.Position
--         end
--       end
--     end
--   })
--   AWSTrain:AddDropdown({
--     Name = 'Auto Knuckles (Zone5)',
--     Default = nil,
--     Options = zonesTable[5]['Name'],
--     Callback = function(value)
--       local mak = zonesTable[5]['Instance']
--       selectedZone = value
--       selectedTier = "5"
--       for i,v in pairs(mak) do
--         if value == v.Name then
--           selectedPosition = v.Primary.Position
--         end
--       end
--     end
--   })
--   AWSTrain:AddToggle({
--     Name = "Auto Train (Knuckle)",
--     Default = false,
--     Callback = function(bool)
--       getgenv().autoKnuckle = bool
--       if bool then
--         if selectedPosition and selectedZone and selectedTier then
--           bypass_tp(selectedPosition)
--           autoKnuckle(selectedTier, selectedZone)
--         end
--       end
--     end
--   })

  AWSEgg:AddParagraph('Eggs', 'Note: Buys eggs automatically for you.')
  AWSEgg:AddDropdown({
    Name = "Select Egg",
    Default = "None",
    Options = Eggs,
    Callback = function(value)
      selectedEgg = value
    end
  })
  AWSEgg:AddToggle({
    Name = "Auto Egg",
    Default = false,
    Callback = function(bool)
      getgenv().autoEgg = bool
      if selectedEgg and bool then
        autoEggs(selectedEgg)
      end
    end
  })
  AWSEgg:AddButton({
    Name = "Remove Egg Animation",
    Callback = function()
      game.Players.LocalPlayer.PlayerGui.OpenerUI:Destroy()
      game.StarterGui.OpenerUI:Destroy()
    end
  })
  AWSPets:AddParagraph('Pets', 'Pets Section.')
  AWSPets:AddToggle({
    Name = "Auto Equip Best",
    Default = false,
    Callback = function(bool)
      getgenv().autoBest = bool
      if bool then
        autoBest()
      end
    end
  })
  AWSPets:AddToggle({
    Name = "Auto Craft",
    Default = false,
    Callback = function(bool)
      getgenv().autoCraft = bool
      if bool then
        autoCraft()
      end
    end
  })

  AWSTeleport:AddParagraph('Teleport', 'Note: You must own the Zone to teleport.')
  AWSTeleport:AddDropdown({
    Name = "Select Zone",
    Default = "None",
    Options = {"BackToSchool", "Futuristic", "Beach", "NuclearBunker", "DinoWorld" ,"Greek"},
    Callback = function(value)
      selectedZone = value
    end
  })
  AWSTeleport:AddButton({
    Name = "Teleport",
    Callback = function()
      if selectedZone then
        if selectedZone == "BackToSchool" then
          teleport(1, selectedZone)
        elseif selectedZone == "Futuristic" then
          teleport(2, selectedZone)
        elseif selectedZone == "Beach" then
          teleport(3, selectedZone)
        elseif selectedZone == "NuclearBunker" then
          teleport(4, selectedZone)
        elseif selectedZone == "DinoWorld" then
          teleport(5, selectedZone)
        elseif selectedZone == "Greek" then
          teleport('GreekEvent', selectedZone)
        end
      end
    end
  })
  
  -- [ Init Library ] --
  OrionLib:Init()
  
  -- [ Destroy Shits ]--
  if Prompt or PromptPlayerGUI then
    while true do
      Prompt:Destroy()
      PromptPlayerGUI:Destroy()
      wait()
    end
  end
  
  if Popup or PopupPlayerGUI then
    while true do
      Popup:Destroy()
      PopupPlayerGUI:Destroy()
      wait()
    end
  end

else
  print('witty')
end