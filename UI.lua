-- ⚙️ Required ⚙️ --
pcall(function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup.lua"))()
end)
local KeySystem = _G.KSS.classes.keysystem.new("Quantumix")
local loadScript = string.format('https://github.com/ZenithDust/Quantumix/raw/main/Games/%d.lua', game.PlaceId)

pcall(function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/ZenithDust/Quantumix/main/Functions/Executed.lua'))()
end)

-- 📘 Locals 📘 --
local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')
local TweenService = game:GetService('TweenService')
local HWID = game:GetService('RbxAnalyticsService'):GetClientId()
local UserInputService = game:GetService("UserInputService")
local HttpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or http_request
local CoreGUI = game:GetService('CoreGui')
local PlayerID = Players.LocalPlayer.UserId
local Thumbnail = Players:GetUserThumbnailAsync(PlayerID, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
local Executor = identifyexecutor()
local HIDEUI = get_hidden_gui or gethui

-- 💉 Functions 💉 --
if syn and typeof(syn) == "table" and RenderWindow then 
  syn.protect_gui = gethui
end
local function Hide_UI(gui)
  if HIDEUI then
    gui["Parent"] = HIDEUI()
  elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
    syn.protect_gui(gui)
    gui["Parent"] = CoreGUI
  elseif CoreGUI:FindFirstChild('RobloxGui') then
    gui["Parent"] = CoreGUI.RobloxGui
  else
    gui["Parent"] = CoreGUI
  end
end
local function MakeDraggable(gui)
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
	    local delta = input.Position - dragStart
	    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	gui.InputBegan:Connect(function(input)
	    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	        dragging = true
	        dragStart = input.Position
	        startPos = gui.Position
	        
	        input.Changed:Connect(function()
	            if input.UserInputState == Enum.UserInputState.End then
	                dragging = false
	            end
	        end)
	    end
	end)
	gui.InputChanged:Connect(function(input)
	    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	        dragInput = input
	    end
	end)
	 
	UserInputService.InputChanged:Connect(function(input)
	    if input == dragInput and dragging then
	        update(input)
	    end
    end)
end
local function getExecutes()
  local WebsiteUrl = "https://quantumixwebsite.zenithdust.repl.co/api/executed"
  local requests = http_request or request or HttpPost or syn.request or fluxus.request
  
  local response = requests({
    Url = WebsiteUrl,
    Method = "GET",
    Headers = {
      ["Content-Type"] = "application/json"
    }
  })
  
  if response.Success then
    local decodedData = HttpService:JSONDecode(response.Body)
    for i,v in pairs(decodedData) do
      return "Overall Executions: "..v
    end
  else 
    return "Failed"
  end
end

-- 📔 Instances 📔 --
local ScreenGui = Instance.new('ScreenGui')
local Frame = Instance.new('Frame')
local Header = Instance.new('Frame')
local KeyFrame = Instance.new('Frame')
local ResponseText = Instance.new('TextLabel')
local UserImage = Instance.new('ImageLabel')
local TextBox = Instance.new('TextBox')
local Close = Instance.new('ImageButton')
local KeyButton = Instance.new('TextButton')
local Discord = Instance.new('TextButton')
local GetKey = Instance.new('TextButton')
local FrameGradient = Instance.new('UIGradient')

-- 📝 Codes 📝 --
ScreenGui.Name = 'QuantumixKey'
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = false
ScreenGui.ResetOnSpawn = true
ScreenGui.Parent = CoreGUI

local FrameCorner = Instance.new('UICorner')
Frame.Name = tostring(math.random(100, 9999))
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BorderColor3 = Color3.new(0, 0, 0)
-- Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Visible = true
Frame.Parent = ScreenGui
MakeDraggable(Frame)

FrameCorner.Parent = Frame
FrameCorner.CornerRadius = UDim.new(0, 10)

FrameGradient.Rotation = 240
FrameGradient.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
})
FrameGradient.Parent = Frame

Header.Name = "Header"
Header.Position = UDim2.new(0, 0, 0, 0)
Header.Size = UDim2.new(1, 0, 0, 25)
Header.AnchorPoint = Vector2.new(0.5, 0.5)
Header.BorderColor3 = Color3.new(0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.BackgroundTransparency = 1
Header.BorderSizePixel = 0
Header.Visible = true
Header.Parent = Frame

Close.Name = "Close"
Close.Image = "rbxassetid://14397748477"
Close.BackgroundTransparency = 1
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, 95, 0, 13)
Close.Visible = true
Close.Parent = Header
Close.MouseButton1Click:Connect(function()
  ScreenGui:Destroy()
end)

KeyFrame.Name = tostring(math.random(100, 999999))
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.Position = UDim2.new(0, 0, 0, 20)
KeyFrame.Size = UDim2.new(1, 0, 0, 270)
KeyFrame.BackgroundTransparency = 1
KeyFrame.BorderSizePixel = 0
KeyFrame.Visible = true
KeyFrame.Parent = Frame

local TextBoxCorner = Instance.new('UICorner')
TextBox.Name = "InputKey"
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 136, 0, 220)
TextBox.Size = UDim2.new(0, 230, 0, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Visible = true
TextBox.PlaceholderText = "Key Here :"
TextBox.Text = ""
TextBox.Parent = KeyFrame

TextBoxCorner.Parent = TextBox
TextBoxCorner.CornerRadius = UDim.new(0, 10)

local ButtonCorner = Instance.new('UICorner')
KeyButton.Name = "Login"
KeyButton.Position = UDim2.new(0, 136, 0, 360)
KeyButton.Size = UDim2.new(0, 230, 0, 30)
KeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyButton.BorderSizePixel = 0
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.Text = "Login"
KeyButton.TextSize = 17
KeyButton.Font = Enum.Font.SourceSansSemibold
KeyButton.Visible = true
KeyButton.Parent = KeyFrame

ButtonCorner.Parent = KeyButton
ButtonCorner.CornerRadius = UDim.new(0, 10)

local Key = KeySystem:key(TextBox.Text)

KeyButton.MouseButton1Click:Connect(function()
  if Key.Finish and Key:verifyHWID() then
    TextBox.Text = "Correct Key, Please Wait!"
    wait(1)
    pcall(function()
      loadstring(game:HttpGet(loadScript))
    end)
  else
    TextBox.Text = "Invalid Key, Please GetKey First!"
  end
end)

local ButtonCorner2 = Instance.new('UICorner')
Discord.Name = "Discord"
Discord.Position = UDim2.new(0, 136, 0, 325)
Discord.Size = UDim2.new(0, 112, 0, 30)
Discord.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Discord.BorderSizePixel = 0
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.Text = "Discord"
Discord.TextSize = 17
Discord.Font = Enum.Font.SourceSansSemibold
Discord.Visible = true
Discord.Parent = KeyFrame

ButtonCorner2.Parent = Discord
ButtonCorner2.CornerRadius = UDim.new(0, 10)

Discord.MouseButton1Click:Connect(function()
  setclipboard('https://discord.gg/Jb4DP46PF8')
end)

local ButtonCorner3 = Instance.new('UICorner')
GetKey.Name = "GetKey"
GetKey.Position = UDim2.new(0, 255, 0, 325)
GetKey.Size = UDim2.new(0, 112, 0, 30)
GetKey.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GetKey.BorderSizePixel = 0
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.Text = "Get Key"
GetKey.TextSize = 17
GetKey.Font = Enum.Font.SourceSansSemibold
GetKey.Visible = true
GetKey.Parent = KeyFrame
GetKey.MouseButton1Click:Connect(function()
  TextBox.Text = "Key system link has been copied to clipboard."
  setclipboard("https://keyrblx.com/getkey/Quantumix?hwid="..HWID)
end)

ButtonCorner3.Parent = GetKey
ButtonCorner3.CornerRadius = UDim.new(0, 10)

local ThumbnailCorner = Instance.new('UICorner')
UserImage.Name = "Yaru"
UserImage.Image = "rbxassetid://14108334210"
UserImage.BackgroundTransparency = 1
UserImage.Size = UDim2.new(0, 70, 0, 70)
UserImage.Position = UDim2.new(1, -30, 0, 140)
UserImage.Visible = true
UserImage.Parent = KeyFrame

ThumbnailCorner.Parent = UserImage
ThumbnailCorner.CornerRadius = UDim.new(0, 50)
