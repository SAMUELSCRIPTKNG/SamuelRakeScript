--[[

Rayfield Interface Suite
by Sirius

shlex | Designing + Programming
iRay  | Programming

]]



local Release = "Beta 7R"
local NotificationDuration = 6.5
local RayfieldFolder = "Rayfield"
local ConfigurationFolder = RayfieldFolder.."/Configurations"
local ConfigurationExtension = ".rfld"



local RayfieldLibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextFont = "Default", -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(240, 240, 240),
			
			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),
			
			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
			
			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
			
			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs
			
			SliderBackground = Color3.fromRGB(43, 105, 159),
			SliderProgress = Color3.fromRGB(43, 105, 159),
			SliderStroke = Color3.fromRGB(48, 119, 177),
			
			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
			
			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Light = {
			TextFont = "Gotham", -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(50, 50, 50), -- i need to make all text 240, 240, 240 and base gray on transparency not color to do this
			
			Background = Color3.fromRGB(255, 255, 255),
			Topbar = Color3.fromRGB(217, 217, 217),
			Shadow = Color3.fromRGB(223, 223, 223),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(220, 220, 220),
			TabStroke = Color3.fromRGB(112, 112, 112),
			TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
		
			ElementBackground = Color3.fromRGB(198, 198, 198),
			ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
			SecondaryElementBackground = Color3.fromRGB(136, 136, 136), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(180, 199, 97),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs

			SliderBackground = Color3.fromRGB(31, 159, 71),
			SliderProgress = Color3.fromRGB(31, 159, 71),
			SliderStroke = Color3.fromRGB(42, 216, 94),

			ToggleBackground = Color3.fromRGB(170, 203, 60),
			ToggleEnabled = Color3.fromRGB(32, 214, 29),
			ToggleDisabled = Color3.fromRGB(100, 22, 23),
			ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
			ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),

			InputBackground = Color3.fromRGB(31, 159, 71),
			InputStroke = Color3.fromRGB(19, 65, 31),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		}
	}
}



-- Services

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Interface Management
local Rayfield = game:GetObjects("rbxassetid://10804731440")[1]



if gethui then
	Rayfield.Parent = gethui()
elseif syn and syn.protect_gui then 
	syn.protect_gui(Rayfield)
	Rayfield.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
	Rayfield.Parent = CoreGui:FindFirstChild("RobloxGui")
else
	Rayfield.Parent = CoreGui
end

if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
			Interface.Enabled = false
			Interface.Name = "Rayfield-Old"
		end
	end
else
	for _, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
			Interface.Enabled = false
			Interface.Name = "Rayfield-Old"
		end
	end
end

-- Object Variables

local Camera = workspace.CurrentCamera
local Main = Rayfield.Main
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local TabList = Main.TabList

Rayfield.DisplayOrder = 100
LoadingFrame.Version.Text = Release


-- Variables

local request = (syn and syn.request) or (http and http.request) or http_request
local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false
local Notifications = Rayfield.Notifications

local SelectedTheme = RayfieldLibrary.Theme.Default

function ChangeTheme(ThemeName)
	SelectedTheme = RayfieldLibrary.Theme[ThemeName]
	for _, obj in ipairs(Rayfield:GetDescendants()) do
		if obj.ClassName == "TextLabel" or obj.ClassName == "TextBox" or obj.ClassName == "TextButton" then
			if SelectedTheme.TextFont ~= "Default" then 
				obj.TextColor3 = SelectedTheme.TextColor
				obj.Font = SelectedTheme.TextFont
			end
		end
	end
	
	Rayfield.Main.BackgroundColor3 = SelectedTheme.Background
	Rayfield.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
	Rayfield.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
	Rayfield.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow
	
	Rayfield.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
	Rayfield.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
	Rayfield.Main.Topbar.Theme.ImageColor3 = SelectedTheme.TextColor
	
	for _, TabPage in ipairs(Elements:GetChildren()) do
		for _, Element in ipairs(TabPage:GetChildren()) do
			if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "SectionTitle"  then
				Element.BackgroundColor3 = SelectedTheme.ElementBackground
				Element.UIStroke.Color = SelectedTheme.ElementStroke
			end
		end
	end
	
end

local function AddDraggingFunctionality(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
			end
		end)
	end)
end   

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadConfiguration(Configuration)
	local Data = HttpService:JSONDecode(Configuration)
	table.foreach(Data, function(FlagName, FlagValue)
		if RayfieldLibrary.Flags[FlagName] then
			spawn(function() 
				if RayfieldLibrary.Flags[FlagName].Type == "ColorPicker" then
					RayfieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
				else
					if RayfieldLibrary.Flags[FlagName].CurrentValue or RayfieldLibrary.Flags[FlagName].CurrentKeybind or RayfieldLibrary.Flags[FlagName].CurrentOption or RayfieldLibrary.Flags[FlagName].Color ~= FlagValue then RayfieldLibrary.Flags[FlagName]:Set(FlagValue) end
				end    
			end)
		else
			RayfieldLibrary:Notify({Title = "Flag Error", Content = "Rayfield was unable to find '"..FlagName.. "'' in the current script"})
		end
	end)
end

local function SaveConfiguration()
	if not CEnabled then return end
	local Data = {}
	for i,v in pairs(RayfieldLibrary.Flags) do
		if v.Type == "ColorPicker" then
			Data[i] = PackColor(v.Color)
		else
			Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
		end
	end	
	writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
end

local neon = (function() -- Open sourced neon module
	local module = {}

	do
		local function IsNotNaN(x)
			return x == x
		end
		local continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		while not continued do
			RunService.RenderStepped:wait()
			continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		end
	end
	local RootParent = Camera
	if getgenv().SecureMode == nil then
		RootParent = Camera
	else
		if not getgenv().SecureMode then
			RootParent = Camera
		else 
			RootParent = nil
		end
	end


	local binds = {}
	local root = Instance.new('Folder', RootParent)
	root.Name = 'neon'


	local GenUid; do
		local id = 0
		function GenUid()
			id = id + 1
			return 'neon::'..tostring(id)
		end
	end

	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2

		function DrawTriangle(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).LookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).LookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.Material = 'Glass'
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	function module:BindFrame(frame, properties)
		if RootParent == nil then return end
		if binds[frame] then
			return binds[frame].parts
		end

		local uid = GenUid()
		local parts = {}
		local f = Instance.new('Folder', root)
		f.Name = frame.Name

		local parents = {}
		do
			local function add(child)
				if child:IsA'GuiObject' then
					parents[#parents + 1] = child
					add(child.Parent)
				end
			end
			add(frame)
		end

		local function UpdateOrientation(fetchProps)
			local zIndex = 1 - 0.05*frame.ZIndex
			local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
			local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
			do
				local rot = 0;
				for _, v in ipairs(parents) do
					rot = rot + v.Rotation
				end
				if rot ~= 0 and rot%180 ~= 0 then
					local mid = tl:lerp(br, 0.5)
					local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
					local vec = tl
					tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
					tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
					bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
					br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
				end
			end
			DrawQuad(
				Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
				Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
				Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
				Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
				parts
			)
			if fetchProps then
				for _, pt in pairs(parts) do
					pt.Parent = f
				end
				for propName, propValue in pairs(properties) do
					for _, pt in pairs(parts) do
						pt[propName] = propValue
					end
				end
			end
		end

		UpdateOrientation(true)
		RunService:BindToRenderStep(uid, 2000, UpdateOrientation)

		binds[frame] = {
			uid = uid;
			parts = parts;
		}
		return binds[frame].parts
	end

	function module:Modify(frame, properties)
		local parts = module:GetBoundParts(frame)
		if parts then
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end

	function module:UnbindFrame(frame)
		if RootParent == nil then return end
		local cb = binds[frame]
		if cb then
			RunService:UnbindFromRenderStep(cb.uid)
			for _, v in pairs(cb.parts) do
				v:Destroy()
			end
			binds[frame] = nil
		end
	end

	function module:HasBinding(frame)
		return binds[frame] ~= nil
	end

	function module:GetBoundParts(frame)
		return binds[frame] and binds[frame].parts
	end


	return module

end)()

function RayfieldLibrary:Notify(NotificationSettings)
	spawn(function()
		local ActionCompleted = true
		local Notification = Notifications.Template:Clone()
		Notification.Parent = Notifications
		Notification.Name = NotificationSettings.Title or "Unknown Title"
		Notification.Visible = true

		local blurlight = nil
		if not getgenv().SecureMode then
			blurlight = Instance.new("DepthOfFieldEffect",game:GetService("Lighting"))
			blurlight.Enabled = true
			blurlight.FarIntensity = 0
			blurlight.FocusDistance = 51.6
			blurlight.InFocusRadius = 50
			blurlight.NearIntensity = 1
			game:GetService("Debris"):AddItem(script,0)
		end
		
		Notification.Actions.Template.Visible = false
		
		if NotificationSettings.Actions then
			for _, Action in pairs(NotificationSettings.Actions) do
				ActionCompleted = false
				local NewAction = Notification.Actions.Template:Clone()
				NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
				if SelectedTheme ~= RayfieldLibrary.Theme.Default then
					NewAction.TextColor3 = SelectedTheme.TextColor
				end
				NewAction.Name = Action.Name
				NewAction.Visible = true
				NewAction.Parent = Notification.Actions
				NewAction.Text = Action.Name
				NewAction.BackgroundTransparency = 1
				NewAction.TextTransparency = 1
				NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)
				
				NewAction.MouseButton1Click:Connect(function()
					local Success, Response = pcall(Action.Callback)
					if not Success then
						print("Rayfield | Action: "..Action.Name.." Callback Error " ..tostring(Response))
					end
					ActionCompleted = true
				end)
			end
		end
		Notification.BackgroundColor3 = SelectedTheme.Background
		Notification.Title.Text = NotificationSettings.Title or "Unknown"
		Notification.Title.TextTransparency = 1
		Notification.Title.TextColor3 = SelectedTheme.TextColor
		Notification.Description.Text = NotificationSettings.Content or "Unknown"
		Notification.Description.TextTransparency = 1
		Notification.Description.TextColor3 = SelectedTheme.TextColor
		Notification.Icon.ImageColor3 = SelectedTheme.TextColor
		if NotificationSettings.Image then
			Notification.Icon.Image = "rbxassetid://"..tostring(NotificationSettings.Image) 
		else
			Notification.Icon.Image = "rbxassetid://3944680095"
		end

		Notification.Icon.ImageTransparency = 1

		Notification.Parent = Notifications
		Notification.Size = UDim2.new(0, 260, 0, 80)
		Notification.BackgroundTransparency = 1
		
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
		Notification:TweenPosition(UDim2.new(0.5,0,0.915,0),'Out','Quint',0.8,true)

		wait(0.3)
		TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
		wait(0.2)



		-- Requires Graphics Level 8-10
		if getgenv().SecureMode == nil then
			TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
		else
			if not getgenv().SecureMode then
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
			else 
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			end
		end

		if Rayfield.Name == "Rayfield" then
			neon:BindFrame(Notification.BlurModule, {
				Transparency = 0.98;
				BrickColor = BrickColor.new("Institutional white");
			})
		end
		
		if not NotificationSettings.Actions then
			wait(NotificationSettings.Duration or NotificationDuration - 0.5)
		else
			wait(0.8)
			TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 132)}):Play()
			wait(0.3)
			for _, Action in ipairs(Notification.Actions:GetChildren()) do
				if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
					TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
					TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					wait(0.05)
				end
			end
		end
		
		repeat wait(0.001) until ActionCompleted

		for _, Action in ipairs(Notification.Actions:GetChildren()) do
			if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
				TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			end
		end

		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0,0.234, 0)}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2