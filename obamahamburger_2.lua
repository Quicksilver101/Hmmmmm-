for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(35,0,0)
end)
end
end
 

HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 5772000--67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 5772000
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "Ath_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "Ath_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = Position or Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AlignOri,AttachmentA,AttachmentB}
end

if _G.netted ~= true then
	_G.netted = true
	coroutine.wrap(function()
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		settings().Physics.AllowSleep = false
		game:GetService("RunService").RenderStepped:Connect(function()
			game:FindFirstChildOfClass("Players").LocalPlayer.MaximumSimulationRadius=math.pow(math.huge,math.huge)
			sethiddenproperty(game:FindFirstChildOfClass("Players").LocalPlayer,"SimulationRadius",math.huge*math.huge)
		end)
	end)()
end

game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
	if v:IsA("Accessory") then
		if hatnameclone[v.Name] then
			if hatnameclone[v.Name] == "s" then
				hatnameclone[v.Name] = {}
			end
			table.insert(hatnameclone[v.Name],v)
		else
			hatnameclone[v.Name] = "s"
		end
	end
end
for _,v in pairs(hatnameclone) do
	if type(v) == "table" then
		local num = 1
		for _,w in pairs(v) do
			w.Name = w.Name..num
			num = num + 1
		end
	end
end
hatnameclone = nil

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

local fldr = Instance.new("Folder",game:FindFirstChildOfClass("Players").LocalPlayer["Character"])
fldr.Name = "DMYF"
local CloneChar = DeadChar:Clone()
local ANIMATIONHERE
if CloneChar:FindFirstChild("Animate") then
	ANIMATIONHERE = CloneChar:FindFirstChild("Animate"):Clone()
	CloneChar:FindFirstChild("Animate"):Destroy()
end
if CloneChar:FindFirstChildOfClass("Folder") then CloneChar:FindFirstChildOfClass("Folder"):Destroy() end
if CloneChar.Torso:FindFirstChild("Neck") then
	local Clonessss = CloneChar.Torso:FindFirstChild("Neck"):Clone()
	Clonessss.Part0 = nil
	Clonessss.Part1 = DeadChar.Head
	Clonessss.Parent = DeadChar.Torso
end
CloneChar.Parent = fldr
CloneChar.HumanoidRootPart.CFrame = DeadChar.HumanoidRootPart.CFrame
CloneChar.Humanoid.BreakJointsOnDeath = false
CloneChar.Name = "non"
CloneChar.Humanoid.DisplayDistanceType = "None"

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		v.Handle.Massless = true
		v.Handle.CanCollide = false
		if v.Handle:FindFirstChildOfClass("Attachment") then
			local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
			if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or ath__.Name == "FaceFrontAttachment" or ath__.Name == "FaceCenterAttachment" then
				topacc = ath__.Name
			end
		end
        local bv = Instance.new("BodyVelocity",v.Handle)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			if topacc then
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.Torso,Vector3.new(0,1.5,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[2]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				alipos.Parent = CloneChar:FindFirstChild(v.Name).Handle
				alirot.Parent = CloneChar:FindFirstChild(v.Name).Handle
				while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = p0.CFrame:lerp((((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse()),1)
						else
							v.Handle.CFrame = v.Handle.CFrame:lerp(alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alipos.Attachment1.Rotation.X),math.rad(alipos.Attachment1.Rotation.Y),math.rad(alipos.Attachment1.Rotation.Z)),1)
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end)()
    end
end

local a = DeadChar.Torso
local b = DeadChar.HumanoidRootPart
local c = DeadChar.Humanoid
a.Parent = game:FindFirstChildOfClass("Workspace")
c.Parent = game:FindFirstChildOfClass("Workspace")
local told = a:Clone()
local told1 = c:Clone()
b["RootJoint"].Part0 = told
b["RootJoint"].Part1 = DeadChar.Head
a.Name = "torso"
a.Neck:Destroy()
c.Name = "Mizt Hub Best"
told.Parent = DeadChar
told1.Parent = DeadChar
DeadChar.PrimaryPart = told
told1.Health = 0
b:Destroy()
a.Parent = DeadChar
c.Parent = DeadChar
told:Destroy()
told1:Destroy()
a.Name = "Torso"

if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end
if DeadChar:FindFirstChild("Animate") then DeadChar:FindFirstChild("Animate"):Destroy() end

local Collider
function UnCollide()
    if HumanDied then Collider:Disconnect(); return end
    --[[for _,Parts in next, CloneChar:GetChildren() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
    for _,Parts in next, DeadChar:GetChildren() do
        if Parts:IsA("BasePart") then
        Parts.CanCollide = false
        end 
    end 
end
Collider = game:GetService("RunService").Stepped:Connect(UnCollide)

local resetBindable = Instance.new("BindableEvent")
resetBindable.Event:connect(function()
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	resetBindable:Destroy()
	HumanDied = true
    pcall(function()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
		DeadChar.Head:Destroy()
		DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
		if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
	end)
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

coroutine.wrap(function()
    while true do
        game:GetService("RunService").RenderStepped:wait()
        if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChildOfClass("Humanoid") or CloneChar:FindFirstChildOfClass("Humanoid").Health <= 0 and not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChildOfClass("Humanoid") or DeadChar:FindFirstChildOfClass("Humanoid").Health <= 0 then 
            HumanDied = true
            pcall(function()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
				DeadChar.Head:Destroy()
				DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
				if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
			end)
            if resetBindable then
                game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
                resetBindable:Destroy()
            end
            break
        end		
    end
end)()


SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"])
SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"])
SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"])
SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"])
SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"])
SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"])

for _,v in pairs(DeadChar:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "Head" then
		--[[local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = CloneChar[v.Name].CFrame
			end
		end)()]]
	elseif v:IsA("BasePart") and v.Name == "Head" then
		local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)
			end
		end)()
	end
end

for _,BodyParts in next, CloneChar:GetDescendants() do
if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
BodyParts.Transparency = 1 end end
game:GetService("RunService").RenderStepped:wait()
game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Camera").CameraSubject = CloneChar.Humanoid

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
	end
end

local data = {}

local script = game:GetObjects("rbxassetid://5446036971")[1]

script.WingPiece.qPerfectionWeld:Destroy()

do
local NEVER_BREAK_JOINTS = false

local function CallOnChildren(Instance, FunctionToCall)
	FunctionToCall(Instance)

	for _, Child in next, Instance:GetChildren() do
		CallOnChildren(Child, FunctionToCall)
	end
end

local function GetBricks(StartInstance)
	local List = {}
	CallOnChildren(StartInstance, function(Item)
		if Item:IsA("BasePart") then
			List[#List+1] = Item;
		end
	end)

	return List
end

local function Modify(Instance, Values)
	assert(type(Values) == "table", "Values is not a table");

	for Index, Value in next, Values do
		if type(Index) == "number" then
			Value.Parent = Instance
		else
			Instance[Index] = Value
		end
	end
	return Instance
end

local function Make(ClassType, Properties)
	return Modify(Instance.new(ClassType), Properties)
end

local Surfaces = {"TopSurface", "BottomSurface", "LeftSurface", "RightSurface", "FrontSurface", "BackSurface"}
local HingSurfaces = {"Hinge", "Motor", "SteppingMotor"}

local function HasWheelJoint(Part)
	for _, SurfaceName in pairs(Surfaces) do
		for _, HingSurfaceName in pairs(HingSurfaces) do
			if Part[SurfaceName].Name == HingSurfaceName then
				return true
			end
		end
	end
	
	return false
end

local function ShouldBreakJoints(Part)
	if NEVER_BREAK_JOINTS then
		return false
	end
	
	if HasWheelJoint(Part) then
		return false
	end
	
	local Connected = Part:GetConnectedParts()
	
	if #Connected == 1 then
		return false
	end
	
	for _, Item in pairs(Connected) do
		if HasWheelJoint(Item) then
			return false
		elseif not Item:IsDescendantOf(script.Parent) then
			return false
		end
	end
	
	return true
end

local function WeldTogether(Part0, Part1, JointType, WeldParent)

	JointType = JointType or "Weld"
	local RelativeValue = Part1:FindFirstChild("qRelativeCFrameWeldValue")
	
	local NewWeld = Part1:FindFirstChild("qCFrameWeldThingy") or Instance.new(JointType)
	Modify(NewWeld, {
		Name = "qCFrameWeldThingy";
		Part0  = Part0;
		Part1  = Part1;
		C0     = CFrame.new();--Part0.CFrame:inverse();
		C1     = RelativeValue and RelativeValue.Value or Part1.CFrame:toObjectSpace(Part0.CFrame); --Part1.CFrame:inverse() * Part0.CFrame;-- Part1.CFrame:inverse();
		Parent = Part1;
	})

	if not RelativeValue then
		RelativeValue = Make("CFrameValue", {
			Parent     = Part1;
			Name       = "qRelativeCFrameWeldValue";
			Archivable = true;
			Value      = NewWeld.C1;
		})
	end

	return NewWeld
end

local function WeldParts(Parts, MainPart, JointType, DoNotUnanchor)

	for _, Part in pairs(Parts) do
		if ShouldBreakJoints(Part) then
			Part:BreakJoints()
		end
	end
	
	for _, Part in pairs(Parts) do
		if Part ~= MainPart then
			WeldTogether(MainPart, Part, JointType, MainPart)
		end
	end

	if not DoNotUnanchor then
		for _, Part in pairs(Parts) do
			Part.Anchored = false
		end
		MainPart.Anchored = false
	end
end

local function PerfectionWeld()	
	local Parts = GetBricks(script.WingPiece)
	WeldParts(Parts, script.WingPiece.Main, "Weld", false)
end
PerfectionWeld()
end

--// Shortcut Variables \\--
local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local CF = {N=CFrame.new,A=CFrame.Angles,fEA=CFrame.fromEulerAnglesXYZ}
local C3 = {tRGB= function(c3) return c3.r*255,c3.g*255,c3.b*255 end,N=Color3.new,RGB=Color3.fromRGB,HSV=Color3.fromHSV,tHSV=Color3.toHSV}
local V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}
local M = {C=math.cos,R=math.rad,S=math.sin,P=math.pi,RNG=math.random,MRS=math.randomseed,H=math.huge,RRNG = function(min,max,div) return math.rad(math.random(min,max)/(div or 1)) end}
local R3 = {N=Region3.new}
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players
local UIS = S.UserInputService


local Player = game.Players.LocalPlayer
local Char = Player.Character
local Mouse = Player:GetMouse()
local Hum = Char:FindFirstChildOfClass'Humanoid'
local Torso = Char.Torso
local RArm = Char["Right Arm"]
local LArm = Char["Left Arm"]
local RLeg = Char["Right Leg"]
local LLeg = Char["Left Leg"]	
local Root = Char:FindFirstChild'HumanoidRootPart'
local Head = Char.Head
local Sine = 0;
local Change = 1
local Attack=false
local NeutralAnims=true
local timePos=30;
local walking=true;
local legAnims=true;
local movement = 8
local footsound=0;
local WalkSpeed=16;
local Combo=0;
local Mode='Neutral'
local vaporwaveMode=false;
local WingAnim='NebG1'
local music;
local hue = 0;
local WingSine=0;
local MusicMode=1;
local visSong = 319138964;
local EffectFolder = script:WaitForChild'FXFolder'
local PrimaryColor = Color3.new(1,1,1)
local ClickTimer = 0;
local ClickAttack = 1;
local camera = workspace.CurrentCamera
local LastSphere = time();
local Frame_Speed = 60
local VaporwaveSongs={
	2231500330;
	654094806;
	743334292;
	334283059;
	2082142910;
}


local WingPiece = script:WaitForChild'WingPiece'
WingPiece.Parent=nil
local WingAnims={}
local Playlist={
	Default=1702473314;
	ScrapBoy=1215691669;
	Defeated=860594509;
	Annihilate=2116461106;
	DashAndDodge=2699922745;
	ZenWavy=2231500330;
	Beachwalk=334283059;
	Pyrowalk=2082142910;
	Vapor90s=654094806;
}

--[[
Neutral - Astronaut - Lost Soul
=_-CalmNess-_=
CursedTY - J O Y F U L L
BEYOND - Th1rt3en
ENERGY SURGE - Vanta Black
+DANGEROUS+ - Frostbite
SYNAPSE-SCRIPTION
BROKEN MACHINERY - Radioactive
HORROR - SUPERNATURAL
]]

--2699922745
--2699922745
local modeInfo={
 	{Name="Neutral",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1117396305,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='HalfStarG'};
 	{Name="Memer",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1117396305,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='lol'};
	{Name="Corruption",Walkspeed=16,moveVal=9,Font=Enum.Font.Garamond,StrokeColor=C3.N(.2,.2,.2);Music=5841497754,LeftWing={0,BrickColor.new'Bright violet'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Bright violet'.Color,Enum.Material.Neon};WingAnim='HalfStarG'};
		{Name="Cursed",Walkspeed=16,moveVal=9,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,0,.2);Music=5841497754,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='mewhenido'};
				{Name="Satanic",Walkspeed=16,moveVal=9,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,0,.2);Music=6394827127,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='omgsatn'};
	{Name="Purity",Walkspeed=16,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.6,.0,.9);Music=5513265404,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};WingAnim='FullStarG'};
	{Name="Mayhem",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=4249182384,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='HalfStarG'};
	{Name="Murder",Walkspeed=200,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=4249182384,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='murder'};
	{Name="Multi-Diversal",Walkspeed=800,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=3889347137,LeftWing={0,Color3.fromRGB(255,125,255),Enum.Material.Neon};RightWing={0,BrickColor.new'Alder'.Color,Enum.Material.Neon};WingAnim='gamer900'};
	{Name="Chaos",Walkspeed=14,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.1,.1,.1);Music=165704299,LeftWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};WingAnim={'FullStarGscythe',2}};
	{Name="Destiny",Walkspeed=130,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,255);Music=1283869370,LeftWing={0,BrickColor.new'Light purple'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Light purple'.Color,Enum.Material.Glass};WingAnim='FullStarGscythe'};	
	{Name="Calamity",Walkspeed=260,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,255);Music=919050740,LeftWing={0,BrickColor.new'Light purple'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Light purple'.Color,Enum.Material.Glass};WingAnim='FullStarGscythe2'};	
	{Name="Crystallized",Walkspeed=100,moveVal=6,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,190,190);Music=5925048765,LeftWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Glass};WingAnim='crystuak'};		
	{Name="Blaze",Walkspeed=200,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,255,255);Music=745599876,LeftWing={0,BrickColor.new'Light orange brown'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Neon};WingAnim='blaze1'};
	{Name="DESTRUCTION",Walkspeed=345,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,255,255);Music=748325014,LeftWing={0,BrickColor.new'Eggplant'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='destroyinglol'};
	{Name="DESTRUCTION X",Walkspeed=400,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,255,255);Music=748325014,LeftWing={0,BrickColor.new'Eggplant'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='destroyinglolx'};
		{Name="Explosion",Walkspeed=53,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,255,255);Music=745599876,LeftWing={0,BrickColor.new'Light orange brown'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Neon};WingAnim='boombitch'};
	{Name="Azure",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.6,.0,.9);Music=260312442,LeftWing={0,BrickColor.new'Pastel violet'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pastel violet'.Color,Enum.Material.Neon};WingAnim='HalfStarG'};
	{Name="AZURE X",Walkspeed=200,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.6,.0,.9);Music=613035749,LeftWing={0,BrickColor.new'Pastel violet'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pastel violet'.Color,Enum.Material.Neon};WingAnim='FullStarGscythe2'};
	{Name="testmode",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=165760887,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='FullStarG'};
	{Name="Radioactive",Walkspeed=16,moveVal=8,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(98,37,209);Music=603291385,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.DiamondPlate};WingAnim='FullStarG'};
	{Name="Plague",Walkspeed=16,moveVal=8,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(98,37,209);Music=577543579,LeftWing={0,BrickColor.new'Dark green'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Dark green'.Color,Enum.Material.DiamondPlate};WingAnim='fuck'};
	{Name="Infestation",Walkspeed=16,moveVal=8,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,255,0);Music=1298467151,LeftWing={0,BrickColor.new'Dark green'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'New yeller'.Color,Enum.Material.DiamondPlate};WingAnim='radioguy'};
	{Name="Surreptitious",Walkspeed=32,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(98,37,209);Music=5764494448,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really Black'.Color,Enum.Material.DiamondPlate};WingAnim='whensusu'};
	{Name="GOD OF DESTRUCTION",Walkspeed=150,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,255);Music=3931186979,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.DiamondPlate};WingAnim='DESTRUCTION'};
	{Name="Love",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,152,220);Music=1030177093,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};WingAnim='Normal'};
	--MAJORS--
	{Name="The Big Black",Walkspeed=129,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=183142252,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'BIGBLACK',20}};
	{Name="INFINITE",Walkspeed=30,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=2297862957,LeftWing={0,BrickColor.new'	Tr. Flu. Red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Tr. Flu. Yellow'.Color,Enum.Material.Glass};WingAnim={'ogka',20}};
	{Name="Nonsense",Walkspeed=30,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1497785701,LeftWing={0,BrickColor.new'Electric blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Maroon'.Color,Enum.Material.Glass};WingAnim={'nonsenstual',20}};	
	{Name="Stranger",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=2297862957,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'bikgmk',20}};
	{Name="Iniquitous",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=2656505560,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'traera',20}};
	{Name="SSS+",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1591230720,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'bikgmk',20}};
	{Name="Equinox",Walkspeed=60,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=395351949,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'FullStarG',20}};
	{Name="The Mediocrely-Sized Black",Walkspeed=129,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1839442666,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'BIGBLACK',1}};
	{Name="Sanctuary",Walkspeed=45,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=305425343,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'FullStarGscythe',20}};
	{Name="IDOLS",Walkspeed=130,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255, 255,0);Music=2415462372,LeftWing={0,BrickColor.new'Hot pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'New yeller'.Color,Enum.Material.Neon};WingAnim='spinnything'};
	{Name="THEORIES",Walkspeed=150,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=305425343,LeftWing={0,BrickColor.new'Bright yellow'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pastel Blue'.Color,Enum.Material.Glass};WingAnim={'GODDANM',20}};
	{Name="FALLEN X",Walkspeed=150,moveVal=20,Font=Enum.Font.Antique,StrokeColor=C3.N(.2,.2,.2);Music=1505487022,LeftWing={0,BrickColor.new'Bright yellow'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pastel Blue'.Color,Enum.Material.Glass};WingAnim={'falenecks',20}};
	{Name="ACE OF SPADES",Walkspeed=250,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1446376775,LeftWing={0,BrickColor.new'Bright yellow'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};WingAnim={'blaze2',20}};
	{Name="Divinity",Walkspeed=26,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=595800581,LeftWing={0,BrickColor.new'Bright yellow'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'New yeller'.Color,Enum.Material.Glass};WingAnim={'thingy2',20}};
	{Name="Solitude",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=723652641,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};WingAnim={'HalfStarGsolitudever',20}};	
	{Name="Faith",Walkspeed=250,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=2471965157,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};WingAnim={'whatere',20}};
	{Name="Hypnotic",Walkspeed=250,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=5470826301,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};WingAnim={'WHATHTE',20}};
	{Name="Pastel",Walkspeed=250,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=5738163109,LeftWing={0,BrickColor.new'Tr. Flu. Red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Tr. Flu. Red'.Color,Enum.Material.Glass};WingAnim={'thi2ngy',20}};
	{Name="Anxiety",Walkspeed=36,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.2,.2,.2);Music=723652641,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Grey'.Color,Enum.Material.Glass};WingAnim={'ereeeeeeee',20}};
		{Name="Redemption",Walkspeed=36,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.2,.2,.2);Music=4863016802,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Grey'.Color,Enum.Material.Glass};WingAnim={'gaymibng',20}};
	{Name="90s",Walkspeed=36,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1169573062,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'HalfStarG',20}};
	{Name="80s",Walkspeed=36,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=4612575506,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'FullStarGscythe',20}};
	{Name="70S",Walkspeed=50,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=4612575506,LeftWing={0,BrickColor.new'Brick yellow'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Earth orange'.Color,Enum.Material.Glass};WingAnim={'FullStarGscythe',20}};
	{Name="CHRONOS",Walkspeed=90,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=711669219,LeftWing={0,BrickColor.new'Olivine'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Olivine'.Color,Enum.Material.Glass};WingAnim={'timebitch',20}};
	{Name="Overpowered",Walkspeed=129,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=6180426141,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'silent2',20}};
	{Name="Vanta Black",Walkspeed=20,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=436541069,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'canta',20}};
		{Name="Withered",Walkspeed=20,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1470848774,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'crac',20}};
	{Name="Chain Magician",Walkspeed=129,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=597442173,LeftWing={0,BrickColor.new'Light gray'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Light grey'.Color,Enum.Material.Glass};WingAnim={'magiclol',20}};
	{Name="Silence",Walkspeed=90,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=3066170649,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'silent',20}};
	{Name="CATASTROPHE",Walkspeed=300,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1504604335,LeftWing={0,BrickColor.new'Eggplant'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Hot pink'.Color,Enum.Material.Glass};WingAnim={'silent2',20}};
	{Name="NANODEATH",Walkspeed=129,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=2234873423,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'FUNNY',20}};
	{Name="KARMA",Walkspeed=129,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=6182696803,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'weniir23',20}};
	{Name="Violence",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=614032233,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='Violent'};
	{Name="HATRED",Walkspeed=190,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=4865063065,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='animussrain'};	
		{Name="Grim",Walkspeed=250,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=1838626744,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Maroon'.Color,Enum.Material.Neon};WingAnim='ere1'};	
	{Name="Determined",Walkspeed=300,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=1402748531,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Really Black'.Color,Enum.Material.Neon};WingAnim='whyareyoureding'};
	{Name="Superior",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=5702477382,LeftWing={0,Color3.fromRGB(0,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='suplol'};
	{Name="Kalamari",Walkspeed=69,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=3255006996,LeftWing={0,Color3.fromRGB(0,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Fire Yellow'.Color,Enum.Material.Neon};WingAnim='funywgis'};	
	{Name="Death",Walkspeed=200,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=3931186979,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='owie'};
	{Name="Celestial",Walkspeed=150,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=1426355953,LeftWing={0,Color3.fromRGB(0,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='Celestialbutripoff'};
	{Name="UnKnOwn",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=143367704,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'New yeller'.Color,Enum.Material.Neon};WingAnim='whatthe'};
	{Name="nil",Walkspeed=174,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=919231299,LeftWing={0,Color3.fromRGB(255,0,0),Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='gam'};
	{Name="SHD",Walkspeed=90,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=2272275958,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Glass};WingAnim={'shlol',10}};
	{Name="BETRAYAL",Walkspeed=18,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=5432848195,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'FullStarGscythe2',10}};
	{Name="c a l m",Walkspeed=60,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=3013643030,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'chillinbutgay',10}};
	{Name="Laid-Back",Walkspeed=60,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=4521011687,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Glass};WingAnim={'chillinbutgay2',10}};
	{Name="Chillin",Walkspeed=10,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=4581009288,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Glass};WingAnim={'vibin',20}};
	{Name="WArPeD",Walkspeed=186,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=1931001768,LeftWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Dark Indigo'.Color,Enum.Material.Glass};WingAnim={'BIGBLACK',20}};
	{Name="S P A C E T I M E",Walkspeed=186,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=4597078271,LeftWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Dark Indigo'.Color,Enum.Material.Glass};WingAnim={'Euclidean2',20}};
	{Name="Funky",Walkspeed=50,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=2521908088,LeftWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Dark Indigo'.Color,Enum.Material.Glass};WingAnim={'HalfStarGsolitudever',20}};	
	{Name="INTERGALACTIC",Walkspeed=186,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=4597078271,LeftWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Dark Indigo'.Color,Enum.Material.Glass};WingAnim={'agre2',20}};
	{Name="Fairy",Walkspeed=65,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.N(.4,.4,0);Music=260312442,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Olivine'.Color,Enum.Material.Glass};WingAnim={'ere21',20}};
		{Name="Euclidean",Walkspeed=250,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.N(.4,.4,0);Music=2272275958,LeftWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Dark Indigo'.Color,Enum.Material.Glass};WingAnim={'geometricbitch',20}};
	{Name="Lunar",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=561833161,LeftWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Lapis'.Color,Enum.Material.Glass};WingAnim={'lunarslo',20}};
	{Name="Randomizer",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=492070484,LeftWing={0,BrickColor.new'Pastel green'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Glass};WingAnim={'agess',25}};
	{Name="Luminous",Walkspeed=16,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255,255,255);Music=3091468842,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim={'silent',20}};
	{Name="Pecularity",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.4,.4,0);Music=3271126110,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'susB',1}};
	{Name="DETERMINED X",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,0,0);Music=511164015,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'thhhhh',20}};
	{Name="Lust",Walkspeed=16,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(1,0,1);Music=391089144,LeftWing={0,BrickColor.new'Hot pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Hot pink'.Color,Enum.Material.Neon};WingAnim='LustFrench'};
}

--future mode names -- LIGHTNING, STRENGTH, EARTH, GALACTIC, COLLAPSE, (more will be added future.)

NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

function newMotor(P0,P1,C0,C1)
	return NewInstance('Motor',P0,{Part0=P0,Part1=P1,C0=C0,C1=C1})
end

local welds = {}
local WeldDefaults = {}

table.insert(welds,newMotor(Torso,Head,CF.N(0,1.5,0),CF.N()))
table.insert(welds,newMotor(Root,Torso,CF.N(),CF.N()))
table.insert(welds,newMotor(Torso,RLeg,CF.N(.5,-1,0),CF.N(0,1,0)))
table.insert(welds,newMotor(Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0)))
table.insert(welds,newMotor(Torso,LLeg,CF.N(-.5,-1,0),CF.N(0,1,0)))
table.insert(welds,newMotor(Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0)))

WeldDefaults={}
for i = 1,#welds do
	local v=welds[i]
	WeldDefaults[i]=v.C0
end

local NK,RJ,RH,RS,LH,LS=unpack(welds)

local NKC0,RJC0,RHC0,RSC0,LHC0,LSC0=unpack(WeldDefaults)

function makeMusic(id,pit,timePos)
	local sound = Torso:FindFirstChild(Player.Name.."song") or Char:FindFirstChild(Player.Name.."song")
	local parent = (MusicMode==2 and Char or Torso)
	if(not sound)then 
		sound = NewInstance("Sound",parent,{Name=Player.Name.."song",Volume=(MusicMode==3 and 0 or 5),Pitch=(pit or 1),Looped=true})
		NewInstance("EqualizerSoundEffect",sound,{HighGain=0,MidGain=2,LowGain=10})
	end
	if(id=='stop')then
		if(sound)then
			sound:Stop()
		end
	else
		local timePos = typeof(timePos)=='number' and timePos or sound.TimePosition
		sound.Volume = (MusicMode==3 and 0 or 5)
		sound.Name = Player.Name.."song"
		sound.Looped=true
		sound.SoundId = "rbxassetid://"..id
		sound.Pitch=(pit or 1)
		sound:Play()
		sound.TimePosition = timePos
	end
	return sound;
end

function playMusic(id,pitch,timePos)
	return makeMusic(id,pitch,timePos)
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
	v:Stop(0);
end

-- SCRIPT STUFF --

function swait(num)
	if num == 0 or num == nil then
		game:GetService("RunService").Stepped:wait()
	else
		for i = 0, num do
			game:GetService("RunService").Stepped:wait()
		end
	end
end

--// Effects \\--

function Tween(obj,props,time,easing,direction,repeats,backwards)
	local info = TweenInfo.new(time or .5, easing or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out, repeats or 0, backwards or false)
	local tween = S.TweenService:Create(obj, info, props)
	
	tween:Play()
end

function StartShake(Settings)
	return true
end

function Camshake(shakedata)
	StartShake(shakedata)
end

local Effects=NewInstance("Folder",Char)
Effects.Name=Player.Name..'Effects'


function ShowDamage(Pos, Text, Time, Color)
	local Pos = Pos or V3.N(0, 0, 0)
	local Text = tostring(Text or "")
	local Time = Time or 2
	local Color = Color or C3.N(1, 0, 1)
	local EffectPart = Part(Effects,Color,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),CFrame.new(Pos),true,false)
	EffectPart.Transparency=1
	local BillboardGui = NewInstance("BillboardGui",EffectPart,{
		Size = UDim2.new(3,0,3,0),
		Adornee = EffectPart,
	})
	
	local TextLabel = NewInstance("TextLabel",BillboardGui,{
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		TextColor3 = Color,
		TextScaled = true,
		Font = Enum.Font.ArialBold, 
	})
	S.Debris:AddItem(EffectPart, Time+.5)
	delay(0, function()
		local rot=math.random(-10,10)/15
		local raise=.2
		local Frames = Time/Frame_Speed
		for i=0,1.1,.02 do
			swait()
			TextLabel.Rotation=TextLabel.Rotation+rot
			raise=raise-.008
			EffectPart.Position = EffectPart.Position + Vector3.new(0, raise, 0)
			TextLabel.TextTransparency=i
			TextLabel.TextStrokeTransparency=i
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end


local baseSound = IN("Sound")

function Soond(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = baseSound:Clone()
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or Torso
	return Sound
end
	
function SoondPart(id,pitch,volume,looped,effect,autoPlay,cf)
	local soundPart = NewInstance("Part",Effects,{Transparency=1,CFrame=cf or Torso.CFrame,Anchored=true,CanCollide=false,Size=V3.N()})
	local Sound = IN("Sound")
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			soundPart:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent = soundPart
	return Sound,soundPart
end

function SoundPart(...)
	return SoondPart(...)
end

function Sound(...)
	return Soond(...)
end
	
function Part(parent,color,material,size,cframe,anchored,cancollide)
	local part = IN("Part")
	part.Parent = parent or Char
	part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface,part.BottomSurface=10,10
	part.Size = size or V3.N(1,1,1)
	part.CFrame = cframe or CF.N(0,0,0)
	part.CanCollide = cancollide or false
	part.Anchored = anchored or false
	return part
end

function Weld(part0,part1,c0,c1)
	local weld = IN("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or CF.N()
	weld.C1 = c1 or CF.N()
	return weld
end

function Mesh(parent,meshtype,meshid,textid,scale,offset)
	local part = IN("SpecialMesh")
	part.MeshId = meshid or ""
	part.TextureId = textid or ""
	part.Scale = scale or V3.N(1,1,1)
	part.Offset = offset or V3.N(0,0,0)
	part.MeshType = meshtype or Enum.MeshType.Sphere
	part.Parent = parent
	return part
end

function GotEffect(data)
	-- just for easy reference
	local color = data.Color or Color3.new(.7,.7,.7);
	local endcolor = data.EndColor or nil;
	local mat = data.Material or Enum.Material.SmoothPlastic;
	local cframe = data.CFrame or CFrame.new();
	local endpos = data.EndPos or nil;
	local meshdata = data.Mesh or {}
	local sounddata = data.Sound or {}
	local size = data.Size or Vector3.new(1,1,1)
	local endsize = data.EndSize or Vector3.new(6,6,6)
	local rotinc = data.RotInc or {0,0,0} -- ONLY FOR LEGACY SYSTEM
	local transparency = data.Transparency or NumberRange.new(0,1)
	local acceleration = data.Acceleration or nil; -- ONLY FOR LEGACY SYSTEM
	local endrot = data.EndRotation or {0,0,0} -- ONLY FOR EXPERIMENTAL SYSTEM
	local style = data.Style or false; -- ONLY FOR EXPERIMENTAL SYSTEM
	local lifetime = data.Lifetime or 1;
	local system = data.FXSystem;
	local setpart = typeof(data.Part)=='string' and EffectFolder:FindFirstChild(tostring(data.Part)):Clone() or typeof(data.Part)=='Instance' and data.Part or nil
	
	local S,PM;
	
	local P = setpart or Part(Effects,color,mat,Vector3.new(1,1,1),cframe,true,false)
	
	if(not P:IsA'MeshPart' and not P:IsA'UnionOperation')then
		if(meshdata == "Blast")then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://20329976','',size,Vector3.new(0,0,-size.X/8))
		elseif(meshdata == 'Ring')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://559831844','',size,Vector3.new(0,0,0))
		elseif(meshdata == 'Slash1')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(size.X/10,.001,size.Z/10),Vector3.new(0,0,0))
		elseif(meshdata == 'Slash2')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(size.X/1000,size.Y/100,size.Z/100),Vector3.new(0,0,0))
		elseif(meshdata == 'Tornado1')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://443529437','',size/10,Vector3.new(0,0,0))
		elseif(meshdata == 'Tornado2')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://168892432','',size/4,Vector3.new(0,0,0))
		elseif(meshdata == 'Skull')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://4770583','',size*2,Vector3.new(0,0,0))
		elseif(meshdata == 'Crystal')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://9756362','',size,Vector3.new(0,0,0))
		elseif(meshdata == 'Cloud')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://1095708','',size,Vector3.new(0,0,0))
		elseif(typeof(meshdata) == 'table')then
			local Type = meshdata.Type or Enum.MeshType.Brick
			local ID = meshdata.ID or '';
			local Tex = meshdata.Texture or '';
			local Offset = meshdata.Offset or Vector3.new(0,0,0)
			PM = Mesh(P,Type,ID,Tex,size,Offset)
		else
			PM = Mesh(P,Enum.MeshType.Brick,'','',size)
		end
	end
	local startTrans = typeof(transparency) == 'number' and transparency or typeof(transparency) == 'NumberRange' and transparency.Min or typeof(transparency) == 'table' and transparency[1] or 0
	local endTrans = typeof(transparency) == 'NumberRange' and transparency.Max or typeof(transparency) == 'table' and transparency[2] or 1
	
	P.Material = mat
	P.CFrame = cframe
	P.Color = (typeof(color)=='BrickColor' and color.Color or color)
	P.Anchored = true
	P.CanCollide = false
	P.Transparency = startTrans
	P.Parent = Effects
	local random = Random.new();
	game:service'Debris':AddItem(P,lifetime+3)
	
	
	-- actual effect stuff
	local mult = 1;
	if(PM)then
		if(PM.MeshId == 'rbxassetid://20329976')then
			PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
		elseif(PM.MeshId == 'rbxassetid://4770583')then
			mult = 2
		elseif(PM.MeshId == 'rbxassetid://168892432')then
			mult = .25
		elseif(PM.MeshId == 'rbxassetid://443529437')then
			mult = .1
		elseif(PM.MeshId == 'rbxassetid://443529437')then
			mult = .1
		end
	end	
	coroutine.wrap(function()
		if(system == 'Legacy' or system == 1 or system == nil)then
			local frames = (typeof(lifetime) == 'NumberRange' and random:NextNumber(lifetime.Min,lifetime.Max) or typeof(lifetime) == 'number' and lifetime or 1)*Frame_Speed
			for i = 0, frames do
				local div = (i/frames)
				P.Transparency=(startTrans+(endTrans-startTrans)*div)
				
				if(PM)then PM.Scale = size:lerp(endsize*mult,div) else P.Size = size:lerp(endsize*mult,div) end
				
				local RotCF=CFrame.Angles(0,0,0)
				
				if(rotinc == 'random')then
					RotCF=CFrame.Angles(math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)))
				elseif(typeof(rotinc) == 'table')then
					RotCF=CFrame.Angles(unpack(rotinc))
				end
				
				if(PM and PM.MeshId == 'rbxassetid://20329976')then
					PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
				end
				
				if(endpos and typeof(endpos) == 'CFrame')then
					P.CFrame=cframe:lerp(endpos,div)*RotCF
				elseif(acceleration and typeof(acceleration) == 'table' and acceleration.Force)then
					local force = acceleration.Force;
					if(typeof(force)=='CFrame')then
						force=force.p;
					end
					if(typeof(force)=='Vector3')then
						if(acceleration.LookAt)then
							P.CFrame=(CFrame.new(P.Position,force)+force)*RotCF
						else
							P.CFrame=(P.CFrame+force)*RotCF
						end
					end
				else
					P.CFrame=P.CFrame*RotCF
				end
				
				if(endcolor and typeof(endcolor) == 'Color3')then
					P.Color = color:lerp(endcolor,div)
				end
				swait()
			end
			P:destroy()
		elseif(system == 'Experimental' or system == 2)then
			local info = TweenInfo.new(lifetime,style,Enum.EasingDirection.InOut,0,false,0)
			local info2 = TweenInfo.new(lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
			if(style == Enum.EasingStyle.Elastic)then
				info = TweenInfo.new(lifetime*2,style,Enum.EasingDirection.Out,0,false,0)
			elseif(style == Enum.EasingStyle.Bounce)then
				info = TweenInfo.new(lifetime,style,Enum.EasingDirection.Out,0,false,0)
			end
			local tweenPart = game:service'TweenService':Create(P,info2,{
				CFrame=(typeof(endpos) == 'CFrame' and endpos or P.CFrame)*CFrame.Angles(unpack(endrot)),
				Color=typeof(endcolor) == 'Color3' and endcolor or color,
				Transparency=endTrans,
			})
			local off = Vector3.new(0,0,0)
			if(PM.MeshId == 'rbxassetid://20329976')then off=Vector3.new(0,0,(endsize*mult).Z/8) end
			
			local tweenMesh = game:service'TweenService':Create(PM,info,{
				Scale=endsize*mult,
				Offset=off,
			})
			tweenPart:Play()
			tweenMesh:Play()
		end
	end)()
end

function Effect(edata)
	GotEffect(edata)
end

function Trail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			Effect(data)
			swait()
		end	
	end)()
end

function ClientTrail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			GotEffect(data)
			swait()
		end	
	end)()
end


if(Char:FindFirstChild('NGRWings'..Player.Name))then
	Char['NGRWings'..Player.Name]:destroy()
end

for _,v in next, Char:children() do
	if(v.Name:lower():find'wings')then 
		v:destroy()
	end
end

local wingModel = Instance.new("Model",Char)
wingModel.Name="NGRWings"..Player.Name
local rightWing = NewInstance("Model",wingModel,{Name='Right'})
local leftWing = NewInstance("Model",wingModel,{Name='Left'})

local MPASword = {}
for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Accessory") and v.Name:find("MeshPartAccessory") and v.Handle.Size == Vector3.new(4,4,1) then
		table.insert(MPASword,v)
	end
end

local LWP1 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(LWP1:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",LWP1.PrimaryPart)
	local atho = Instance.new("Attachment",LWP1.PrimaryPart)

	local HatChoice = MPASword[1]
	print(MPASword[1].Handle.Name)
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end
LWP1.Parent = leftWing
local LWP2 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(LWP2:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",LWP2.PrimaryPart)
	local atho = Instance.new("Attachment",LWP2.PrimaryPart)

	local HatChoice = MPASword[1]
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end
LWP2.Parent = leftWing
local LWP3 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory") then --BladeMasterAccessory
	for _,v in pairs(LWP3:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",LWP3.PrimaryPart)
	local atho = Instance.new("Attachment",LWP3.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory") --BladeMasterAccessory
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end
LWP3.Parent = leftWing
local RWP1 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(RWP1:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP1.PrimaryPart)
	local atho = Instance.new("Attachment",RWP1.PrimaryPart)

	local HatChoice = MPASword[1]
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end
RWP1.Parent = rightWing
local RWP2 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(RWP2:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP2.PrimaryPart)
	local atho = Instance.new("Attachment",RWP2.PrimaryPart)

	local HatChoice = MPASword[1]
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end

RWP2.Parent = rightWing
local RWP3 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("ShadowBladeMasterAccessory") then --ShadowBladeMasterAccessory
	for _,v in pairs(RWP3:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP3.PrimaryPart)
	local atho = Instance.new("Attachment",RWP3.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("ShadowBladeMasterAccessory") --ShadowBladeMasterAccessory
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end

RWP3.Parent = rightWing
local RWP4 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("Evil Aura") then --Evil Aura
	for _,v in pairs(RWP4:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP4.PrimaryPart)
	local atho = Instance.new("Attachment",RWP4.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("Evil Aura") --Evil Aura
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,.2,0)
	atho.Rotation = Vector3.new(0,0,0)
end


RWP4.Parent = rightWing

local RWP5 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("Guadaña") then --Evil Aura
	for _,v in pairs(RWP5:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP5.PrimaryPart)
	local atho = Instance.new("Attachment",RWP5.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("Guadaña") --Evil Aura
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end

RWP5.Parent = rightWing

local RWP6 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("swordhalo") then --Northern Star
	for _,v in pairs(RWP6:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP6.PrimaryPart)
	local atho = Instance.new("Attachment",RWP6.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("swordhalo") --Northern Star
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end

RWP6.Parent = rightWing

local RWP7 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("Teapot") then --Teapot
	for _,v in pairs(RWP7:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP7.PrimaryPart)
	local atho = Instance.new("Attachment",RWP7.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("Teapot") --Teapot
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,.2,0)
	atho.Rotation = Vector3.new(0,0,0)
end
RWP7.Parent = rightWing
local LWP1W=Weld(LWP1.PrimaryPart,Torso,CF.N(2,-2,-1)*CF.A(0,0,0))
local LWP2W=Weld(LWP2.PrimaryPart,Torso,CF.N(4.25,-1,-1)*CF.A(0,0,M.R(15)))
local LWP3W=Weld(LWP3.PrimaryPart,Torso,CF.N(6.5,.5,-1)*CF.A(0,0,M.R(30)))
local RWP1W=Weld(RWP1.PrimaryPart,Torso,CF.N(-2,-2,-1)*CF.A(0,0,0))
local RWP2W=Weld(RWP2.PrimaryPart,Torso,CF.N(-4.25,-1,-1)*CF.A(0,0,M.R(-15)))
local RWP3W=Weld(RWP3.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP4W=Weld(RWP4.PrimaryPart,Torso,CF.N(0,0,0)*CF.A(0,0,M.R(-0)))
local RWP5W=Weld(RWP5.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP6W=Weld(RWP6.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP7W=Weld(RWP7.PrimaryPart,Head,CF.N(-0,.0,-0)*CF.A(0,0,M.R(-0)))


local bbg=Head:FindFirstChild'Nametag' or NewInstance("BillboardGui",Head,{
	Adornee=Head;
	Name='Nametag';
	Size=UDim2.new(4,0,1.2,0);
	StudsOffset=V3.N(-8,5.3,0);
})
local text=bbg:FindFirstChild'TextLabel' or NewInstance("TextLabel",bbg,{
	Size=UDim2.new(5,0,3.5,0);
	TextScaled=true;
	BackgroundTransparency=1;
	TextStrokeTransparency=0;
	Font=Enum.Font.Arcade;
	TextColor3=C3.N(1,1,1);
	Text='Neutral'
})

function getMode(modeName)
	for i,v in next, modeInfo do
		if(v.Name==modeName)then
			return v
		end
	end
	return modeInfo[1]
end

function IsVaporwave(song)
	for i = 1,#VaporwaveSongs do
		if(VaporwaveSongs[i]==song)then
			return true
		end
	end
	return false
end

local blush = NewInstance('Decal',Head,{Transparency=1,Texture='rbxassetid://0',Color3=(Player.UserId==5719877 and C3.N(.45,0,1) or C3.N(1,0,0))})

function changeMudo(modeName)
	local info = getMode(modeName)
	Mode=info.Name
	WalkSpeed=info.Walkspeed
	movement=info.moveVal
	music=makeMusic(info.Music or 0,info.Pitch or 1,info.TimePos or music and music.TimePosition or 0)
	WingAnim=info.WingAnim or 'NebG1'
	text.Text = info.Name
	text.TextColor3 = info.LeftWing[2]
	text.TextStrokeColor3 = info.StrokeColor
	text.Font=info.Font;
	if(Mode=='HORROR' or Mode=='SUPERNATURAL')then
		blush.Transparency=0
		blush.Texture='rbxassetid://0'
	else
		blush.Transparency=1
		blush.Texture='rbxassetid://0'
	end
	if(Mode=='testmode')then
    StrokeColor=C3.N(r/255,g/255,b/255)
	end	
	
	for _,v in next,leftWing:GetDescendants() do
		if(v:IsA'BasePart' and v.Name~='Main')then
			--v.Transparency=info.LeftWing[1]
			v.Color=info.LeftWing[2]
			v.Material=info.LeftWing[3]
		elseif(v:IsA'Trail')then
			--v.Transparency=NumberSequence.new(info.LeftWing[1],1)
			v.Color=ColorSequence.new(info.LeftWing[2])	
		end
	end
	
	for _,v in next,rightWing:GetDescendants() do
		if(v:IsA'BasePart' and v.Name~='Main')then
			--v.Transparency=info.RightWing[1]
			v.Color=info.RightWing[2]
			v.Material=info.RightWing[3]
		elseif(v:IsA'Trail')then
			--v.Transparency=NumberSequence.new(info.RightWing[1],1)
			v.Color=ColorSequence.new(info.RightWing[2])	
		end
	end
	
	PrimaryColor = info.PrimaryColor or info.LeftWing[2]
end

function changeMode(modeName)
	changeMudo(modeName)
end	

function syncStuff(data)
	local neut,legwelds,c0s,c1s,sine,mov,walk,inc,musicmode,tpos,pit,wingsin,visSett,mode,newhue=unpack(data)
	local head0,torso0,rleg0,rarm0,lleg0,larm0=unpack(c0s)
	local head1,torso1,rleg1,rarm1,lleg1,larm1=unpack(c1s)
	legAnims=legwelds
	NeutralAnims=neut
	if(not neut)then
		NK.C0=head0
		RJ.C0=torso0
		RH.C0=rleg0
		RS.C0=rarm0
		LH.C0=lleg0
		LS.C0=larm0
		
		NK.C1=head1
		RJ.C1=torso1
		RH.C1=rleg1
		RS.C1=rarm1
		LH.C1=lleg1
		LS.C1=larm1
	end
	if(Mode~=mode)then
		changeMudo(mode)
	end
	movement=mov
	walking=walk
	Change=inc
	print(MusicMode,musicmode)
	if(musicmode~=MusicMode and music)then
		MusicMode=musicmode
		if(MusicMode==1)then
			music:Pause()
			music.Volume=5
			music.Parent=Torso
			music:Resume()
		elseif(MusicMode==2)then
			music:Pause()
			music.Volume=5
			music.Parent=Char
			music:Resume()
		elseif(MusicMode==3)then
			music.Volume = 0
		end
	end
	if(Sine-sine>.8 or Sine-sine<-.8)then
		Sine=sine
	end
	if(hue-newhue>.8 or hue-newhue<-.8)then
		hue=newhue
	end
	if(WingSine-wingsin>.8 or WingSine-wingsin<-.8)then
		WingSine=wingsin
	end
	if(music and (music.TimePosition-tpos>.8 or music.TimePosition-tpos<-.8))then
		music.TimePosition=tpos
	end
	if(music and pit)then
		music.Pitch = pit
	end
	if(Mode=='SYNAPSE-SCRIPTION' and music.SoundId~='rbxassetid://'..visSett.Music)then
		music.SoundId='rbxassetid://'..visSett.Music
	end
	getMode('SYNAPSE-SCRIPTION').Music = visSett.Music
	getMode('SYNAPSE-SCRIPTION').Pitch = visSett.Pitch
end


local footstepSounds = {
	[Enum.Material.Grass]=510933218;
	[Enum.Material.Metal]=1263161138;
	[Enum.Material.CorrodedMetal]=1263161138;
	[Enum.Material.DiamondPlate]=1263161138;
	[Enum.Material.Wood]=2452053757;
	[Enum.Material.WoodPlanks]=2452053757;
	[Enum.Material.Sand]=134456884;
	[Enum.Material.Snow]=2452051182;
}


function Vaporwaveify(s)
	local function wide(a)
		if a<'!' or a>'~' then return a end
		if a==' ' then return '  ' end 
		a = a:byte()+160
		if a<256 then return string.char(239,188,a-64) end
		return string.char(239,189,a-128)
	end
	return(s:gsub(".",wide))
end



function Choot(text)
	--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,0,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Antique,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='SYNAPSE-SCRIPTION' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				
				if(vaporwaveMode and Mode=='SYNAPSE-SCRIPTION')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='SYNAPSE-SCRIPTION' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
	--else
	--	Chat2(text)
	--end
end

function Chat(text)
	Choot(text)
end

function DealDamage(...)
	return true
end

function getRegion(point,range,ignore)
    return workspace:FindPartsInRegion3WithIgnoreList(R3.N(point-V3.N(1,1,1)*range/2,point+V3.N(1,1,1)*range/2),ignore,100)
end
function AOEDamage(where,range,options)
	local hit = {}
	for _,v in next, getRegion(where,range,{Char}) do
		if(v.Parent and v.Parent:FindFirstChildOfClass'Humanoid' and not hit[v.Parent:FindFirstChildOfClass'Humanoid'])then
			local callTable = {Who=v.Parent}
			hit[v.Parent:FindFirstChildOfClass'Humanoid'] = true
			for _,v in next, options do callTable[_] = v end
			DealDamage(callTable)
		end
	end
	return hit
end


function Click1()
	Attack=true
	NeutralAnims=false
	legAnims=false
	local orig = WalkSpeed
	WalkSpeed=4
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(-44.6),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.8,-1,-0.3)*CF.A(M.R(-17.4),M.R(44.4),M.R(7.1)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.4,-1,0)*CF.A(M.R(1.6),M.R(-13.1),M.R(7)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.3)*CF.A(M.R(90),M.R(0),M.R(-44.6)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.1)*CF.A(M.R(90),M.R(0),M.R(-44.6)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(44.6),M.R(0)),Alpha)
	end
	for i = 0, 1, 0.1 do
		swait()
		AOEDamage(RArm.CFrame.p,2,{
			DamageColor=(Mode=='SYNAPSE-SCRIPTION' and C3.HSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor);
			MinimumDamage=5;
			MaximumDamage=15;
		})
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.7)*CF.A(M.R(0),M.R(50.5),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7,-0.6)*CF.A(M.R(-26),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.6,-1.1,-0.1)*CF.A(M.R(20.2),M.R(-47.6),M.R(15.2)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,0)*CF.A(M.R(0),M.R(0),M.R(-20.4)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(50.5)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(-50.5),M.R(0)),Alpha)
	end
	WalkSpeed=orig
	legAnims=true
	Attack=false
	NeutralAnims=true
end

function SwordSummon()
	Attack = true
	NeutralAnims = false
	local orig=WalkSpeed
	WalkSpeed=4
	legAnims=false
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3

		RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,-0.1)*CF.A(M.R(-12.4),M.R(-15.7),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7,-0.5)*CF.A(M.R(16.2),M.R(15.2),M.R(-0.8)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(-28.5),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.4,0.5,0)*CF.A(M.R(27.2),M.R(-3.8),M.R(-5)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.6,0)*CF.A(M.R(-33.8),M.R(-18.1),M.R(24.8)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(13.4),M.R(15.3),M.R(-3.6)),Alpha)
	end

	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(70.7),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(-14.4)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.6,-1,0)*CF.A(M.R(15.1),M.R(-63.2),M.R(13.5)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.6,-0.1)*CF.A(M.R(0),M.R(15.9),M.R(-25.4)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.3,-0.2)*CF.A(M.R(0),M.R(19.3),M.R(157.1)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(-70.7),M.R(0)),Alpha)
	end
	legAnims=true
	WalkSpeed=orig
	Attack = false
	NeutralAnims = true
end

function Bombs()
	Attack=true
	NeutralAnims=false
	legAnims=false
	local orig = WalkSpeed
	WalkSpeed=0
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(19.1)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(-21.3)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
	end
	coroutine.wrap(function()
		for i = 0, 2 do
			Camshake({
			    Duration=.2;
				FadeOut=.2;
			    Intensity=1.5;
			    Position=Vector3.new(.5,.5,.5);
			    Rotation=Vector3.new(.5,.5,3);
			    DropDist=15;
			    IneffectiveDist=40;
			    Origin=Root.CFrame*CF.N(0,0,-4-i*4);
			})
			SoundPart(206083252,.8,4,false,true,true,Root.CFrame*CF.N(0,0,-4-i*4))
			AOEDamage(Root.CFrame*CF.N(0,0,-4-i*4).p,5,{
				DamageColor=PrimaryColor;
				MinimumDamage=25;
				MaximumDamage=45;
			})
			Effect{
				Lifetime=.4;
				Mesh={Type=Enum.MeshType.Sphere};
				Color=PrimaryColor;
				Material=Enum.Material.Neon;
				CFrame=Root.CFrame*CF.N(0,0,-4-i*4);
				Size=V3.N(1,1,1);
				EndSize=V3.N(10,10,10);
			}
			Effect{
				Lifetime=.4;
				Part='Ring';
				Color=PrimaryColor;
				Material=Enum.Material.Neon;
				CFrame=Root.CFrame*CF.N(0,0,-4-i*4)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
				RotInc={M.RNG(-25,25)/100,M.RNG(-25,25)/100,M.RNG(-25,25)/100};
				Size=V3.N(4,4,.2);
				EndSize=V3.N(13,13,.2);
			}
			Effect{
				Lifetime=.4;
				Part='Ring';
				Color=PrimaryColor;
				Material=Enum.Material.Neon;
				CFrame=Root.CFrame*CF.N(0,0,-4-i*4)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
				RotInc={M.RNG(-25,25)/100,M.RNG(-25,25)/100,M.RNG(-25,25)/100};
				Size=V3.N(4,4,.2);
				EndSize=V3.N(13,13,.2);
			}
			swait(4)
		end
	end)()
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,0.7)*CF.A(M.R(18.2),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.4)*CF.A(M.R(-33.4),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,-0.2)*CF.A(M.R(-6.7),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4,0.1)*CF.A(M.R(90.7),M.R(-2.5),M.R(-50)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,0.2)*CF.A(M.R(89.5),M.R(2.6),M.R(50)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
	end
	WalkSpeed=orig
	legAnims=true
	Attack=false
	NeutralAnims=true
end


function ClickCombo()
	ClickTimer=180
	if(Combo==1)then
		Click1()
		Combo=2
	elseif(Combo==2)then
		SwordSummon()
		Combo=1
	elseif(Combo==3)then
		Bombs()
		Combo=1
	end
end
	
function VaporTaunt()
	Attack = true
	NeutralAnims = false
	local orig=WalkSpeed
	WalkSpeed=0
	legAnims=false
	Chat"You need to chill out.."
	for i = 0, 14, 0.1 do
		swait()
		local Alpha = .1
		RJ.C0 = RJ.C0:lerp(CF.N(-0.1,-0.1-.1*M.S(Sine/36),0.6)*CF.A(M.R(55.3+2.5*M.C(Sine/36)),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.6,-1.2,-0.1)*CF.A(M.R(56.3+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.9,-1.2,-0.2)*CF.A(M.R(25+5*M.C(Sine/36)),M.R(3.5),M.R(-43.9)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1,0.8,0)*CF.A(M.R(11.4-5*M.C(Sine/42)),M.R(-3.3),M.R(137.5)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.2)*CF.A(M.R(61-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.3)*CF.A(M.R(-38.9-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
	end
	legAnims=true
	WalkSpeed=orig
	Attack = false
	NeutralAnims = true
end
function chilltaunt()
	Attack = true
	NeutralAnims = false
	local orig=WalkSpeed
	WalkSpeed=0
	legAnims=false
	Chat"whats the problem man?"
	for i = 0, 14, 0.1 do
		swait()
		local Alpha = .1
RJ.C0 = RJ.C0:lerp(CF.N(0,0.7+.1*M.C(Sine/36),0)*CF.A(M.R(20),M.R(0),M.R(-0-2.5*M.S(Sine/36))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(150+5*M.C(Sine/32))),Alpha)
NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.5)*CF.A(M.R(40-5*M.S(Sine/24)),M.R(-18.7),M.R(-3.7)),Alpha)
LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(70+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
	end
	legAnims=true
	WalkSpeed=orig
	Attack = false
	NeutralAnims = true
end
function oldbitchtaunt()
	Attack = true
	NeutralAnims = false
	local orig=WalkSpeed
	WalkSpeed=0
	legAnims=false
	Chat"let's fight, punk!"
	for i = 0, 14, 0.1 do
		swait()
		local Alpha = .1
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-25+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(115-5*M.C(Sine/32)),M.R(90+5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(90+5*M.C(Sine/32))),Alpha)
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				RWP5W.C0 = RWP5W.C0:lerp(CF.N(-4,-0,0)*CF.A(M.R(90+6000*M.C(WingSine/322)),0,M.R(-20)),.2)	
	end
	legAnims=true
	WalkSpeed=orig
	Attack = false
	NeutralAnims = true
end




UIS.InputBegan:connect(function(io,gpe)
	if(gpe or Attack or data.User~=data.Local)then return end
	--MODES
	if(io.KeyCode == Enum.KeyCode.One and Mode~='Neutral')then 
		changeMode'Neutral'
	elseif(io.KeyCode == Enum.KeyCode.Three and Mode~='Corruption')then 
		changeMode'Corruption'
	elseif(io.KeyCode == Enum.KeyCode.Two and Mode~='Purity')then 
		changeMode'Purity'
	elseif(io.KeyCode == Enum.KeyCode.Four and Mode~='Mayhem')then 
		changeMode'Mayhem'
	elseif(io.KeyCode == Enum.KeyCode.Five and Mode~='Chaos')then 
		changeMode'Chaos'
	elseif(io.KeyCode == Enum.KeyCode.F and Mode~='Destiny')then 
		changeMode'Destiny'
	elseif(io.KeyCode == Enum.KeyCode.G and Mode~='Azure')then 
		changeMode'Azure'
	elseif(io.KeyCode == Enum.KeyCode.Z and Mode~='Blaze')then 
		changeMode'Blaze'		
	elseif(io.KeyCode == Enum.KeyCode.E and Mode~='UnKnOwn')then 
	   if(M.RNG(1,15)==1)then
	       changeMode('Surreptitious')
	       else	    
		changeMode'UnKnOwn'
		end	
	elseif(io.KeyCode == Enum.KeyCode.E and Mode~='UnKnOwn')then 
	   if(M.RNG(1,15)==1)then
	       changeMode('Surreptitious')
	       else	    
		changeMode'UnKnOwn'
		end
	elseif(io.KeyCode == Enum.KeyCode.V and Mode~='Silence')then 
		changeMode'Silence'	
	elseif(io.KeyCode == Enum.KeyCode.Q and Mode~='Solitude')then 
		changeMode'Solitude'			
	elseif(io.KeyCode == Enum.KeyCode.R and Mode~='Chain Magician')then 
		changeMode'Chain Magician'		
	elseif(io.KeyCode == Enum.KeyCode.J and Mode~='Radioactive')then 
		changeMode'Radioactive'
	elseif(io.KeyCode == Enum.KeyCode.Seven and Mode~='Pastel')then 
		changeMode'Pastel'		
	elseif(io.KeyCode == Enum.KeyCode.Y and Mode~='Pecularity')then 
		changeMode'Pecularity'		
	elseif(io.KeyCode == Enum.KeyCode.H and Mode~='Love')then 
		changeMode'Love'
	elseif(io.KeyCode == Enum.KeyCode.L and Mode~='CHRONOS')then 
		changeMode'CHRONOS'	
	elseif(io.KeyCode == Enum.KeyCode.Zero and Mode~='Funky')then 
		changeMode'Funky'			
	elseif(io.KeyCode == Enum.KeyCode.X and Mode~='Memer')then 
		changeMode'Memer'	
	elseif(io.KeyCode == Enum.KeyCode.C and Mode~='testmode')then 
		changeMode'testmode'		
	elseif(io.KeyCode == Enum.KeyCode.Six and Mode~='Equinox')then 
		changeMode'Equinox'			
	elseif(io.KeyCode == Enum.KeyCode.P and Mode~='Chillin')then 
		changeMode'Chillin'
	elseif(io.KeyCode == Enum.KeyCode.Nine and Mode~='Nonsense')then 
		changeMode'Nonsense'		
	elseif(io.KeyCode == Enum.KeyCode.K and Mode~='Luminous')then 
		changeMode'Luminous'
	elseif(io.KeyCode == Enum.KeyCode.U and Mode~='90s')then 
		changeMode'90s'	
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Solitude')then 
		changeMode'The Big Black'
	elseif(io.KeyCode == Enum.KeyCode.V and Mode=='Corruption')then 
		changeMode'Stranger'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Corruption')then 
		changeMode'Stranger'		
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='The Big Black')then 
		changeMode'The Mediocrely-Sized Black'	
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Chaos')then 
		changeMode'DESTRUCTION'	
		elseif(io.KeyCode == Enum.KeyCode.M and Mode=='DESTRUCTION')then 
		changeMode'DESTRUCTION X'	
				elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Determined')then 
		changeMode'DETERMINED X'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Chaos')then 
		changeMode'THEORIES'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='BETRAYAL')then 
		changeMode'Anxiety'	
			elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Silence')then 
		changeMode'Redemption'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Equinox')then 
		changeMode'ACE OF SPADES'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Divinity')then 
		changeMode'FALLEN X'		
	elseif(io.KeyCode == Enum.KeyCode.Eight and Mode~='Divinity')then 
		changeMode'Divinity'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='THEORIES')then 
		changeMode'Hypnotic'
			elseif(io.KeyCode == Enum.KeyCode.N and Mode=='The Big Black')then 
		changeMode'Cursed'
					elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Cursed')then 
		changeMode'Satanic'
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Determined')then 
		changeMode'Faith'					
			elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Blaze')then 
		changeMode'Explosion'
			elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Violence')then 
		changeMode'Grim'		
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='UnKnOwn')then 
		changeMode'INFINITE'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='UnKnOwn')then 
		changeMode'nil'			
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Corruption')then 
		changeMode'KARMA'
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Stranger')then 
		changeMode'SSS+'		
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Radioactive')then 
		changeMode'IDOLS'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Mayhem')then 
		changeMode'Murder'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Murder')then 
		changeMode'Multi-Diversal'			
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Purity')then 
		changeMode'Sanctuary'			
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Luminous')then 
		changeMode'Euclidean'
	elseif(io.KeyCode == Enum.KeyCode.B and Mode=='Lunar')then 
		changeMode'Fairy'
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Neutral')then 
		changeMode'Lunar'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Lunar')then 
		changeMode'Randomizer'
	elseif(io.KeyCode == Enum.KeyCode.B and Mode=='Corruption')then 
		changeMode'Death'		
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Luminous')then 
		changeMode'S P A C E T I M E'
	elseif(io.KeyCode == Enum.KeyCode.B and Mode=='Luminous')then 
		changeMode'INTERGALACTIC'		
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='The Big Black')then 
		changeMode'BETRAYAL'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Chillin')then 
		changeMode'c a l m'	
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Chillin')then 
		changeMode'Laid-Back'			
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Radioactive')then 
		changeMode'Infestation'		
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Mayhem')then 
		changeMode'Violence'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Violence')then 
		changeMode'HATRED'		
	elseif(io.KeyCode == Enum.KeyCode.B and Mode=='Chaos')then 
		changeMode'Determined'		
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Lunar')then 
		changeMode'Superior'	
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='90s')then
		changeMode'80s'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='90s')then
		changeMode'70S'			
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Silence')then 
		changeMode'Celestial'	
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Azure')then 
		changeMode'AZURE X'	
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Corruption')then 
		changeMode'KARMA'	
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Purity')then 
		changeMode'SHD'
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Purity')then 
		changeMode'Crystallized'		
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='DESTRUCTION')then 
		changeMode'GOD OF DESTRUCTION'	
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Love')then 
		changeMode'NANODEATH'
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Destiny')then 
		changeMode'Calamity'
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Calamity')then 
		changeMode'Kalamari'	
	elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Calamity')then 
		changeMode'CATASTROPHE'	
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Corruption')then 
		changeMode'Vanta Black'
			elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Vanta Black')then 
		changeMode'Withered'
	elseif(io.KeyCode == Enum.KeyCode.N and Mode=='UnKnOwn')then 
		changeMode'WArPeD'
	--TOGGLE MUSIC
	elseif(io.KeyCode == Enum.KeyCode.M and getMode(Mode))then 
		MusicMode=MusicMode+1
		if(MusicMode>3)then MusicMode=1 end
		if(MusicMode==1)then
			music:Pause()
			music.Volume=5
			music.Parent=Torso
			music:Resume()
		elseif(MusicMode==2)then
			music:Pause()
			music.Volume=5
			music.Parent=Char
			music:Resume()
		elseif(MusicMode==3)then
			music.Volume = 0
		end
	elseif(io.KeyCode==Enum.KeyCode.B)then
		--TAUNTS
		if(Mode=='Laid-Back')then
			chilltaunt()
		end
	end
	if(io.KeyCode == Enum.KeyCode.B and Mode=='Blaze')then
			oldbitchtaunt()
		end
	end
)
WingAnims.StarG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-8,2,-1)*CF.A(M.R(5+20*M.C(WingSine/32)),0,M.R(-35-9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-10.60,1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+25*M.C(WingSine/32)),0,M.R(-40-9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-12.20,.10,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-45-9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/232))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.HalfStarG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0.3,-.7)*CF.A(M.R(65+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(-0)),.2)	
end

WingAnims.HalfStarGsolitudever=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-3)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(4.25,-1,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(6.5,.5,-3)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/402))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.FullStarG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/62),-2+0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.bruhmeme=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25 + .5 *M.C(WingSine/5),-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5 + .5 *M.C(WingSine/5),.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(0*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25 - .5 *M.C(WingSine/5),-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5 - .5 *M.C(WingSine/5),.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/62),-2+0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0-950*M.C(WingSine/60))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.agess=function()
    mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-180+5000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-2,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.thingy2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-120+45*M.C(WingSine/90))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-120+60*M.C(WingSine/90))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-120+75*M.C(WingSine/90))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(120-45*M.C(WingSine/90))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(120-60*M.C(WingSine/90))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(120-75*M.C(WingSine/90))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.falenecks=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-2)*CF.A(33,0-0*M.C(WingSine/36),M.R(90+3600*M.C(WingSine/360))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-2)*CF.A(33,0-0*M.C(WingSine/37),M.R(147.5+3600*M.C(WingSine/360))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-2)*CF.A(33,0-0*M.C(WingSine/51),M.R(32.5+3600*M.C(WingSine/360))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5-.75*M.C(WingSine/25),-2)*CF.A(33,0-0*M.C(WingSine/36),M.R(-90+3600*M.C(WingSine/360))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-2)*CF.A(33,0-0*M.C(WingSine/37),M.R(-147.5+3600*M.C(WingSine/360))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-2)*CF.A(33,0-0*M.C(WingSine/51),M.R(-32.5+3600*M.C(WingSine/360))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end


WingAnims.FullStarGscythe=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end


WingAnims.Euclidean2=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3.5,0,-.9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.5,0,-.9)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3.5,0,-.9)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3.5,0,-.9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.5,0,-.9)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-3.5,0,-.9)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.speedy=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,1,-2)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-45)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4,1,-2)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-45)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4,1,-2)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-45)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,1,-2)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(45)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4,1,-2)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(45)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4,1,-2)*CF.A(M.R(240+6000*M.C(WingSine/322)),44,M.R(45)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/-100)),M.R(100-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/-100)),M.R(100-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.whyareyoureding=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-40)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-40)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(40)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(40)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1000*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1000*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.gam=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,0,5)*CF.A(M.R(0+4000*M.C(WingSine/516)),0,M.R(-1)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,0,4.7)*CF.A(M.R(120+4000*M.C(WingSine/15)),0,M.R(6)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,0,3.5)*CF.A(M.R(240+4000*M.C(WingSine/616)),0,M.R(-417)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,0,2)*CF.A(M.R(0+3500*M.C(WingSine/111)),0,M.R(431)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,0,3)*CF.A(M.R(120+24415*M.C(WingSine/164)),0,M.R(235)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,0,2.6)*CF.A(M.R(240+1778*M.C(WingSine/322)),0,M.R(518)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+40000*M.C(WingSine/-402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+40000*M.C(WingSine/-402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(3,3,-1)*CF.A(M.R(5+20000*M.C(WingSine/322)),0,M.R(-90)),.2)	
end

WingAnims.omgsatn=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,-5+1*M.C(WingSine/50),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(72+1000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,-5+1*M.C(WingSine/50),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(144+1000*M.C(WingSine/400))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-5+1*M.C(WingSine/50),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(216+1000*M.C(WingSine/400))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,-5+1*M.C(WingSine/50),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(288+1000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,-5+1*M.C(WingSine/50),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(360+1000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,-1+0*M.C(WingSine/50),-0)*CF.A(M.R(68+0*M.C(WingSine/50)),0,M.R(0+0*M.C(WingSine/400))),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(0,M.R(0),0)*CF.N(-0,0,-1),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.eeete=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,0,2)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3,0,2)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3,0,2)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(3,5,2)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(3,5,2)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(3,5,2)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-2,-2,0)*CF.A(M.R(90+6000*M.C(WingSine/322)),0,M.R(20)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.hoverlol=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,2,1)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3,2,1)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3,2,1)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,2,8)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(90)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3,2,8)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-3,2,8)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(90)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-2,-2,0)*CF.A(M.R(90+6000*M.C(WingSine/322)),0,M.R(20)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-2,-2,0)*CF.A(M.R(90+6000*M.C(WingSine/322)),0,M.R(20)),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.spinnnnnnnnnnuy=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.9-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/402))),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.susB=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90-1080*M.C(WingSine/200))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-1080*M.C(WingSine/200))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-1080*M.C(WingSine/200))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0-1080*M.C(WingSine/200))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.9-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.spinnything=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(25+4000*M.C(WingSine/350))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(90+4000*M.C(WingSine/350))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(150+4000*M.C(WingSine/350))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(-25+4000*M.C(WingSine/350))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(-90+4000*M.C(WingSine/350))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(-150+4000*M.C(WingSine/350))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.FUNNY=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,4,-3-0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(25+4000*M.C(WingSine/350))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,4,-3-0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(90+4000*M.C(WingSine/350))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2,4,-3-0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(150+4000*M.C(WingSine/350))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2,4,-3+0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(-25+4000*M.C(WingSine/350))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2,4,-3+0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(-90+4000*M.C(WingSine/350))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2,4,-3+0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(-150+4000*M.C(WingSine/350))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end


WingAnims.crystuak=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1+3*M.C(WingSine/90),2,4)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0+720*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1+3*M.C(WingSine/90),2,4)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0+720*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1+3*M.C(WingSine/90),2,4)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0+720*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1+3*M.C(WingSine/90),2,4)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(0-720*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1+3*M.C(WingSine/90),2,4)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(0-720*M.C(WingSine/322))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1+3*M.C(WingSine/90),2,4)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(0-720*M.C(WingSine/322))),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,2,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,2,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.weniir23=function(mult)
	mult=mult or 1
    LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,4,-0-0*M.C(WingSine/16))*CF.A(M.R(25-0*M.C(WingSine/32)),0,M.R(25+4000*M.C(WingSine/350))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),2+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120-1500*M.C(WingSine/500))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,4,-0-0*M.C(WingSine/16))*CF.A(M.R(25-0*M.C(WingSine/32)),0,M.R(150+4000*M.C(WingSine/350))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),2+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240-1500*M.C(WingSine/500))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4,-0+0*M.C(WingSine/16))*CF.A(M.R(25-0*M.C(WingSine/32)),0,M.R(-90+4000*M.C(WingSine/350))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),2+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360-1500*M.C(WingSine/500))),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.ere1=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,0+0*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(0+4000*M.C(WingSine/500))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,0+0*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(115+4000*M.C(WingSine/500))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,0+0*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(225+4000*M.C(WingSine/500))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,0+3*M.C(WingSine/16),-3+0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(0+4000*M.C(WingSine/500))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,0+3*M.C(WingSine/16),-3+0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(115+4000*M.C(WingSine/500))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,0+3*M.C(WingSine/16),-3+0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(225+4000*M.C(WingSine/500))),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.crac=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,1+0*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(0+4000*M.C(WingSine/500))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,1+0*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(115+4000*M.C(WingSine/500))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,1+0*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-25-0*M.C(WingSine/32)),0,M.R(225+4000*M.C(WingSine/500))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,1+0*M.C(WingSine/16),3+0*M.C(WingSine/16))*CF.A(M.R(25-0*M.C(WingSine/32)),0,M.R(0+4000*M.C(WingSine/500))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,1+0*M.C(WingSine/16),3+0*M.C(WingSine/16))*CF.A(M.R(25-0*M.C(WingSine/32)),0,M.R(115+4000*M.C(WingSine/500))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,1+0*M.C(WingSine/16),3+0*M.C(WingSine/16))*CF.A(M.R(25-0*M.C(WingSine/32)),0,M.R(225+4000*M.C(WingSine/500))),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-0,3)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-3)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-3)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.thhhhh=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,0+2*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(25+5000*M.C(WingSine/600))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,4-4*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(90+5000*M.C(WingSine/600))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,0+2*M.C(WingSine/16),-3-0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(150+5000*M.C(WingSine/600))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4-4*M.C(WingSine/16),-3+0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(-25+5000*M.C(WingSine/600))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,0+2*M.C(WingSine/16),-3+0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(-90+5000*M.C(WingSine/600))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4-4*M.C(WingSine/16),-3+0*M.C(WingSine/16))*CF.A(M.R(-45-0*M.C(WingSine/32)),0,M.R(-150+5000*M.C(WingSine/600))),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.blaze2=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,2,1-4*M.C(WingSine/500))*CF.A(M.R(0+6000*M.C(WingSine/500)),0,M.R(-90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3,2,1-4*M.C(WingSine/500))*CF.A(M.R(-120+6000*M.C(WingSine/500)),0,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3,2,1-4*M.C(WingSine/500))*CF.A(M.R(-240+6000*M.C(WingSine/500)),0,M.R(-90)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,2,10+5*M.C(WingSine/250))*CF.A(M.R(0+6000*M.C(WingSine/250)),0,M.R(90)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3,2,10+5*M.C(WingSine/250))*CF.A(M.R(120+6000*M.C(WingSine/250)),0,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-3,2,10+5*M.C(WingSine/250))*CF.A(M.R(240+6000*M.C(WingSine/250)),0,M.R(90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(100,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
end

WingAnims.thi2ngy=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2.8,4,0-0*M.C(WingSine/500))*CF.A(M.R(0+9000*M.C(WingSine/500)),0,M.R(-90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2.8,4,0-0*M.C(WingSine/500))*CF.A(M.R(60+9000*M.C(WingSine/500)),0,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2.8,4,0-0*M.C(WingSine/500))*CF.A(M.R(120+9000*M.C(WingSine/500)),0,M.R(-90)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2.8,4,0+0*M.C(WingSine/250))*CF.A(M.R(0-9000*M.C(WingSine/500)),0,M.R(90)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-2.8,4,0+0*M.C(WingSine/250))*CF.A(M.R(240-9000*M.C(WingSine/500)),0,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-2.8,4,0+0*M.C(WingSine/250))*CF.A(M.R(300-9000*M.C(WingSine/500)),0,M.R(90)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,2.8,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,2.8,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.owie=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,1.5,0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3,7,0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3,13,0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,1.5,0)*CF.A(M.R(0-6000*M.C(WingSine/322)),0,M.R(180)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3,7,0)*CF.A(M.R(0-6000*M.C(WingSine/322)),0,M.R(180)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-3,13,0)*CF.A(M.R(0-6000*M.C(WingSine/322)),0,M.R(180)),.2)
RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.canta=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60-360*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120-360*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-360*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240-360*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300-360*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360-360*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/32),10+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0-90*M.C(WingSine/32))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/62),-20-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+400*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),0,M.R(-0)),.2)	
end

WingAnims.lunarslo=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(25+4000*M.C(WingSine/700))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(90+4000*M.C(WingSine/700))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(150+4000*M.C(WingSine/700))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(-25+4000*M.C(WingSine/350))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(-90+4000*M.C(WingSine/350))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(45-12*M.C(WingSine/32)),0,M.R(-150+4000*M.C(WingSine/350))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end


WingAnims.FullStarGscythe2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(45+3600*M.C(WingSine/450))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3+2.5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(165.5+3600*M.C(WingSine/450))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3+2.5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(285.5+3600*M.C(WingSine/450))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+1*M.C(WingSine/90),.5-.25*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(-0+3600*M.C(WingSine/360))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+1*M.C(WingSine/90),.5+.25*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(-120.5+3600*M.C(WingSine/360))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+1*M.C(WingSine/90),.5+.25*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(-240.5+3600*M.C(WingSine/360))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(-0)),.2)	
end

WingAnims.magiclol=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+0*M.C(WingSine/100),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+900*M.C(WingSine/100))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0-3*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90+360*M.C(WingSine/100))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0-3*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+360*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0-0*M.C(WingSine/100),1+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-0+900*M.C(WingSine/100))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+3*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90-360*M.C(WingSine/100))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+3*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-360*M.C(WingSine/100))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.murder=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+360*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90-2.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-0*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-90+360*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-2.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+0*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.GODDANM=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1+1*M.S(WingSine/35),-3+0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(180-0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.8*M.C(WingSine/60),-1)*CF.A(0,0,M.R(90-4000*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.8*M.S(WingSine/60),-1)*CF.A(0,0,M.R(180-4000*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1-1*M.S(WingSine/35),-3+0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0-0*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.8*M.S(WingSine/60),-1)*CF.A(0,0,M.R(-90-4000*M.C(WingSine/320))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+.8*M.S(WingSine/60),-1)*CF.A(0,0,M.R(0-4000*M.C(WingSine/320))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.lol=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+360*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90-2.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-0*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-90+360*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-2.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+0*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.geometricbitch=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+720*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+720*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+720*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240+720*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+720*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360+720*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.chillinbutgay=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+720*M.C(WingSine/800))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+720*M.C(WingSine/800))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+720*M.C(WingSine/800))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240+720*M.C(WingSine/800))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+720*M.C(WingSine/800))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2+0*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360+720*M.C(WingSine/800))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/1000))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/1000))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.gamer900=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(5+5*M.C(WingSine/200),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+720*M.C(WingSine/200))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5+5*M.C(WingSine/200),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+720*M.C(WingSine/200))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5+5*M.C(WingSine/200),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+720*M.C(WingSine/200))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(5+5*M.C(WingSine/200),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240+720*M.C(WingSine/200))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(5+5*M.C(WingSine/200),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+720*M.C(WingSine/200))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(5+5*M.C(WingSine/200),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360+720*M.C(WingSine/200))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/1000))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/1000))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.mewhenido=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2+5*M.C(WingSine/100),1.5+0*M.S(WingSine/32),-1)*CF.A(0.3,0,M.R(60+1400*M.C(WingSine/200))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2+5*M.C(WingSine/100),1.5+.25*M.C(WingSine/32),-1)*CF.A(0.3,0,M.R(120+1400*M.C(WingSine/200))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2+5*M.C(WingSine/100),1.5-.05*M.S(WingSine/32),-1)*CF.A(0.3,0,M.R(180+1400*M.C(WingSine/200))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2-5*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0.6,0,M.R(240+1000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2-5*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0.6,0,M.R(300+1000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2-5*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0.6,0,M.R(360+1000*M.C(WingSine/400))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/100))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.chillinbutgay2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2+5*M.C(WingSine/100),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+1400*M.C(WingSine/100))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2+5*M.C(WingSine/100),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+1400*M.C(WingSine/100))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2+5*M.C(WingSine/100),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+1400*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2-5*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240+1000*M.C(WingSine/200))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2-5*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+1000*M.C(WingSine/200))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2-5*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360+1000*M.C(WingSine/200))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/100))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/100))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.nonsenstual=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+6*M.C(WingSine/100),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+510*M.C(WingSine/100))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0-6*M.C(WingSine/100),1+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(180+510*M.C(WingSine/100))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0-3*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+0*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0-6*M.C(WingSine/100),1+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(0+510*M.C(WingSine/100))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+6*M.C(WingSine/100),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+510*M.C(WingSine/100))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+3*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+0*M.C(WingSine/100))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0+12*M.C(WingSine/100),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1500*M.C(WingSine/300))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.Celestialbutripoff=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+0*M.C(WingSine/100),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+900*M.C(WingSine/100))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0-9*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+360*M.C(WingSine/100))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0-9*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+360*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0-0*M.C(WingSine/100),1+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(0+900*M.C(WingSine/100))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+9*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0-360*M.C(WingSine/100))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+9*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-360*M.C(WingSine/100))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0+12*M.C(WingSine/100),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1500*M.C(WingSine/300))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+6000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0-12*M.C(WingSine/100),1+0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+1500*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.destroyinglol=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),-7+0.1*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/2000))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),-7+0.1*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+2000*M.C(WingSine/2000))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),-7+0.1*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+2000*M.C(WingSine/2000))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),-7+0.1*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240+2000*M.C(WingSine/2000))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),-7+0.1*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+2000*M.C(WingSine/2000))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),-7+0.1*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360+2000*M.C(WingSine/2000))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+8000*M.C(WingSine/1000))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.destroyinglolx=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),4+0.5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(55+0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),4+0.5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(110+0*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+1500*M.C(WingSine/150))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),4+0.5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-55+0*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),4+0.5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-110+0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(270+1500*M.C(WingSine/150))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.fuck=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0.5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+360*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0.5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+360*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0.5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+360*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0.5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(240+360*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0.5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+360*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0.5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(360+360*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.timebitch=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+144*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(7+0*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+1000*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(7+0*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+1000*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-90+720*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(7+0*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90+1000*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(7+0*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1000*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,-4,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,-4,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.WHATHTE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,4,-1)*CF.A(M.R(-15+0*M.C(WingSine/32)),0,M.R(35+360*M.C(WingSine/70))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,9,-1)*CF.A(M.R(10+0*M.C(WingSine/32)),0,M.R(180-5000*M.C(WingSine/500))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,4,-1)*CF.A(M.R(-15+0*M.C(WingSine/32)),0,M.R(145+360*M.C(WingSine/70))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,4,-1)*CF.A(M.R(-15+0*M.C(WingSine/32)),0,M.R(-35-360*M.C(WingSine/70))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,9,-1)*CF.A(M.R(10+0*M.C(WingSine/32)),0,M.R(-0-5000*M.C(WingSine/500))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,4,-1)*CF.A(M.R(-15+0*M.C(WingSine/32)),0,M.R(-145-360*M.C(WingSine/70))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.ogka=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2+5*M.C(WingSine/356),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0+6969*M.C(WingSine/123),M.R(60+6969*M.C(WingSine/123))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2+1*M.C(WingSine/6793),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0+6969*M.C(WingSine/123),M.R(120+420*M.C(WingSine/15))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2+9*M.C(WingSine/887),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0+6969*M.C(WingSine/123),M.R(180+269*M.C(WingSine/136))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2-0*M.C(WingSine/357),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0+6969*M.C(WingSine/123),M.R(240+125*M.C(WingSine/367))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2-3*M.C(WingSine/12),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0+6969*M.C(WingSine/123),M.R(300+290*M.C(WingSine/343))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2+6*M.C(WingSine/157),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0+6969*M.C(WingSine/123),M.R(360+623*M.C(WingSine/262))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(2+8*M.C(WingSine/1),1.5-.15*M.S(WingSine/32),-1)*CF.A(0,0-15627*M.C(WingSine/234),M.R(4+425*M.C(WingSine/664))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(2-8*M.C(WingSine/1),1.5-.15*M.S(WingSine/32),-1)*CF.A(0,0-15627*M.C(WingSine/68),M.R(4+134*M.C(WingSine/1))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.pinksand=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(45+20*M.C(WingSine/65))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),8+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+360*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),0-0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1000*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-45-20*M.C(WingSine/65))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),8+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90+360*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),3+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1000*M.C(WingSine/100))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.agre=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(7+1.5*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+1000*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(7+2*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+1000*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-180+5000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(7+1.5*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90+1000*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(7+2*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1000*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.agre2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1+3*M.C(WingSine/90),2,9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0+720*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1+3*M.C(WingSine/90),2,9)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0+720*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1+3*M.C(WingSine/90),2,9)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0+720*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1+3*M.C(WingSine/90),2,6)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(0-720*M.C(WingSine/180))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1+3*M.C(WingSine/90),2,6)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(0-720*M.C(WingSine/180))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1+3*M.C(WingSine/90),2,6)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(0-720*M.C(WingSine/180))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.silent=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+.35*M.S(WingSine/32),-1)*CF.A(0,0,M.R(35+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+2.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(145+5*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5-.15*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-35+5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90+2.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-145+5*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.animussrain=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(90+3600*M.C(WingSine/360))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(147.5+3600*M.C(WingSine/360))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(32.5+3600*M.C(WingSine/360))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5-.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(-90+3600*M.C(WingSine/360))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(-147.5+3600*M.C(WingSine/360))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(-32.5+3600*M.C(WingSine/360))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.whensusu=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,1+3*M.C(WingSine/50),-2-0*M.C(WingSine/16))*CF.A(M.R(-0-0*M.C(WingSine/32)),0,M.R(180+4000*M.C(WingSine/500))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,1+3*M.C(WingSine/50),-2-0*M.C(WingSine/16))*CF.A(M.R(-0-0*M.C(WingSine/32)),0,M.R(-57+4000*M.C(WingSine/500))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,5+0*M.C(WingSine/16),-2-0*M.C(WingSine/16))*CF.A(M.R(-0-0*M.C(WingSine/32)),0,M.R(0+4000*M.C(WingSine/500))),.2)
 
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,5+0*M.C(WingSine/16),-2+0*M.C(WingSine/16))*CF.A(M.R(-0-0*M.C(WingSine/32)),0,M.R(57.5+4000*M.C(WingSine/500))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,5+0*M.C(WingSine/16),-2+0*M.C(WingSine/16))*CF.A(M.R(-0-0*M.C(WingSine/32)),0,M.R(112.5+4000*M.C(WingSine/500))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,1+3*M.C(WingSine/50),-2+0*M.C(WingSine/16))*CF.A(M.R(-0-0*M.C(WingSine/32)),0,M.R(-112.5+4000*M.C(WingSine/500))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-0-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/402))),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.boombitch=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-2)*CF.A(0,0-0*M.C(WingSine/36),M.R(90+3600*M.C(WingSine/360))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-2)*CF.A(0,0-0*M.C(WingSine/37),M.R(147.5+3600*M.C(WingSine/360))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0+5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-2)*CF.A(0,0-0*M.C(WingSine/51),M.R(32.5+3600*M.C(WingSine/360))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+5*M.C(WingSine/180),7+.75*M.S(WingSine/25),-2)*CF.A(0,0-0*M.C(WingSine/36),M.R(90+3600*M.C(WingSine/360))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+5*M.C(WingSine/180),7+.75*M.C(WingSine/25),-2)*CF.A(0,0-0*M.C(WingSine/37),M.R(147.5+3600*M.C(WingSine/360))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+5*M.C(WingSine/180),7+.75*M.S(WingSine/25),-2)*CF.A(0,0-0*M.C(WingSine/51),M.R(32.5+3600*M.C(WingSine/360))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.9-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/402))),.2)	
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.radioguy=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(0+3600*M.C(WingSine/360))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(120.5+3600*M.C(WingSine/360))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0+2.5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(240.5+3600*M.C(WingSine/360))),.2)
	
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+0*M.C(WingSine/180),1+0*M.C(WingSine/25),-3)*CF.A(0,0-0*M.C(WingSine/36),M.R(-0+3600*M.C(WingSine/360))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+0*M.C(WingSine/180),1+.0*M.S(WingSine/25),-3)*CF.A(0,0-0*M.C(WingSine/37),M.R(-120+3600*M.C(WingSine/360))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+0*M.C(WingSine/180),1+.0*M.S(WingSine/25),-3)*CF.A(0,0-0*M.C(WingSine/51),M.R(-240+3600*M.C(WingSine/360))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.funywgis=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(45+3600*M.C(WingSine/450))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3+2.5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(165.5+3600*M.C(WingSine/450))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3+2.5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(285.5+3600*M.C(WingSine/450))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+1*M.C(WingSine/90),.5-.25*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(-0+3600*M.C(WingSine/360))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0+1*M.C(WingSine/90),.5+.25*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(-120.5+3600*M.C(WingSine/360))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+1*M.C(WingSine/90),.5+.25*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(-240.5+3600*M.C(WingSine/360))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.silent2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0-800*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),1+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(110-800*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),1+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(220-800*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-2)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2,-2,-2)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,-4,-3)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,-2.5)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(2,8,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
end

WingAnims.Violent=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-7,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+180*M.C(WingSine/32))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,9,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)	
end

WingAnims.whatthe=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+math.random(-40,40)),0,M.R(0+math.random(-40,40))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1.5)*CF.A(M.R(10+math.random(-40,40)),0,M.R(15+math.random(-40,40))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-2)*CF.A(M.R(15+math.random(-40,40)),0,M.R(30+math.random(-40,40))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5-math.random(-40,40)),0,M.R(0-math.random(-40,40))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1.5+.05*M.S(WingSine/35))*CF.A(M.R(10-math.random(-40,40)),0,M.R(-15-math.random(-40,40))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5-math.random(-2,2),-2)*CF.A(M.R(15+-math.random(-40,40)),0,M.R(-30-math.random(-40,40))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/62),-2+0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end 
WingAnims.vibin=function()
    mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,1.7,0),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135+WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,1.7,0),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225+WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,1.7,0),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,1.7,0),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,1.7,0),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,1.7,0),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+180*M.C(WingSine/32))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,2,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,2,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(-0)),.2)
end

WingAnims.DESTRUCTION=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+30*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+40*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+45*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-30*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-40*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-45*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/179))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.suplol=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+20*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+30*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+35*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-20*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-30*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-35*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/179))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+1100*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+360*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.StarLO=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/179))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLF=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+25*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+35*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(11.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+50*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-35*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-11.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-50*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),7,M.R(-30-800*M.C(WingSine/50))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLFY=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-7)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+25*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+35*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(11.5,.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+500*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-7)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-2+.0*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-35*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-11.5,.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-500*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),7,M.R(-30-800*M.C(WingSine/50))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLFR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1+1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/1))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+5*M.C(WingSine/2))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(11.5,.5,-1+1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+5*M.C(WingSine/1))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1+1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/1))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1-1*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-5*M.C(WingSine/2))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-11.5,.5,-1+1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-5*M.C(WingSine/1))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),7,M.R(-30-800*M.C(WingSine/50))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarL=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(-40-45*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(12,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(40+45*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLTE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-3)*CF.A(M.R(5+25*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-5)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-12)*CF.A(M.R(15+35*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-3)*CF.A(M.R(5+25*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-5+.0*M.S(WingSine/35))*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-12)*CF.A(M.R(15+35*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarNET=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-3)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-5)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-2)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-3)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-5+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-2)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Sonar1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1.15*M.C(WingSine/52),3+3.25*M.S(WingSine/32),-1)*CF.A(0,0,M.R(260+425*M.C(WingSine/62))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1.1*M.C(WingSine/52),3+2.28*M.C(WingSine/32),-1)*CF.A(0,0,M.R(390+465.5*M.C(WingSine/62))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1.25*M.C(WingSine/52),1+5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120+315*M.C(WingSine/62))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2.15*M.C(WingSine/52),4+2.15*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-260+545*M.C(WingSine/62))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2.1*M.C(WingSine/52),4+2.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-390+434.5*M.C(WingSine/62))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2.25*M.C(WingSine/52),2+5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+475*M.C(WingSine/62))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/432))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-5*M.C(WingSine/34))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-8*M.C(WingSine/34))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-11*M.C(WingSine/34))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(5*M.C(WingSine/34))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(8*M.C(WingSine/34))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(11*M.C(WingSine/34))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0.5,600,-0)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTRPLUS=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(7,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-7,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(0*M.C(WingSine/6400000))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0.5,600,-0)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLEX=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,0)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+0*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+360*M.C(WingSine/130))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0-0*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(-0-360*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/323))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarGLITCH=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/4))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/5))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/4))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/4))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/5))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/4))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/120))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarGLITCHV2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/4))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-2,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+23*M.C(WingSine/5))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-4)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+54*M.C(WingSine/4))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-25*M.C(WingSine/4))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-2,-2+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-34*M.C(WingSine/5))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-4)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-70*M.C(WingSine/4))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/120))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLK=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+500*M.C(WingSine/15))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+500*M.C(WingSine/15))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+500*M.C(WingSine/15))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-500*M.C(WingSine/15))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-500*M.C(WingSine/15))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-500*M.C(WingSine/15))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLEP=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1)*CF.A(M.R(10+350*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+350*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLED=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-10,-0)*CF.A(M.R(300+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-9,-0)*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,.5,-1)*CF.A(M.R(280+0*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-10,-0)*CF.A(M.R(300+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-9,-0+.05*M.S(WingSine/35))*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(280+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarA=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-4,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5.50,-6,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-4,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5.50,-6,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarEL=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-8*M.C(WingSine/32),-1)*CF.A(90,5,M.R(-150-320*M.C(WingSine/250))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-8*M.C(WingSine/32),-2)*CF.A(90,-5,M.R(-180-320*M.C(WingSine/250))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-8*M.C(WingSine/32),-3)*CF.A(90,5,M.R(-210-320*M.C(WingSine/250))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-8*M.C(WingSine/32),-4)*CF.A(-90,5,M.R(-60-320*M.C(WingSine/250))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-8*M.C(WingSine/32),-5)*CF.A(-90,-5,M.R(-90-320*M.C(WingSine/250))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-8*M.C(WingSine/32),-6)*CF.A(-90,5,M.R(-120-320*M.C(WingSine/250))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

 --special wing anim --	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0.5,-1)*CF.A(0,M.R(90+0*M.C(WingSine/39)),M.R(-0-2000*M.R(WingSine/99999))),.2)
 --     RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,0,-3)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) INSANE WING ANIM
  --  RWP4W.C0 = RWP4W.C0:lerp(CF.N(-5,0,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) another special

WingAnims.StarB=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(15+3.5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.50,-4,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+3.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-6,-3)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(0-3.5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.50,-4,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarEF=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0.0,5,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0.40,0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-30+10*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.0,15,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0.40,-0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(30-10*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.0,-0,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0.0,10,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarEFE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0.0,5,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-500,0.20,-100)*CF.A(M.R(90+0*M.C(WingSine/32)),0,M.R(-30+10*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.0,15,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-500.40,-0,-100)*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(30-10*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.0,-0.20,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0.0,10,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+2*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+2*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(30+800*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+2*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+2*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-150-2000*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-180-2000*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-210-2000*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-60-2000*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-90-2000*M.C(WingSine/322))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-120-2000*M.C(WingSine/322))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,.5,-2)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-900*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-180-3200*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-210-3200*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-60-3200*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-90-3200*M.C(WingSine/320))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,-5,M.R(-120-3200*M.C(WingSine/320))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,2,M.R(-180-3200*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,3,M.R(-210-3200*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,4,M.R(-60-3200*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,5,M.R(-90-3200*M.C(WingSine/320))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,-6,M.R(-120-3200*M.C(WingSine/320))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS3=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/290))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-180-3200*M.C(WingSine/290))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-210-3200*M.C(WingSine/290))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-60-3200*M.C(WingSine/290))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-90-3200*M.C(WingSine/290))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-120-3200*M.C(WingSine/290))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS4=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-7*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-150-32000*M.C(WingSine/2990))),.1)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-6*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-180-32000*M.C(WingSine/2990))),1)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-7*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-210-32000*M.C(WingSine/2990))),.1)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-7*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-60-32000*M.C(WingSine/2990))),.1)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-6*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-90-32000*M.C(WingSine/2990))),1)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-7*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-120-32000*M.C(WingSine/2990))),.1)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarTE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1*M.C(WingSine/32),1.5+3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+2000*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),1.5-3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120-2000*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-2000*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-2000*M.C(WingSine/322))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+2000*M.C(WingSine/322))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Aprins=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(90+5000*M.C(WingSine/400))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(120+5000*M.C(WingSine/400))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(-90+5000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+5000*M.C(WingSine/400))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,1.5,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(60)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,1.5,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,1.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(120)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,1.5,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(-60)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,1.5,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,1.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-120)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(0+5000*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-5000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(10*M.C(WingSine/32),0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1000*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
end	

WingAnims.Normal=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(40)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2,-1)*CF.A(M.R(10+10*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,2,-1)*CF.A(M.R(15+10*M.C(WingSine/32)),0,M.R(140)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(.15,2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(40)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(.1,2,-1)*CF.A(M.R(10+10*M.C(WingSine/32)),0,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(.25,2,-1)*CF.A(M.R(15+10*M.C(WingSine/32)),0,M.R(140)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(30+720*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
end	

WingAnims.INSANEGREG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(5+100*M.C(WingSine/22)),0,M.R(67)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+300*M.C(WingSine/22)),0,M.R(46)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(15+255*M.C(WingSine/22)),0,M.R(135)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(5+100*M.C(WingSine/22)),0,M.R(-67)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+300*M.C(WingSine/22)),0,M.R(-46)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(15+255*M.C(WingSine/22)),0,M.R(-135)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.MANGY=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(60)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(120)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(-60)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-120)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.MANGYT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(50+15*M.C(WingSine/23)),0,M.R(30)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/23)),0,M.R(60)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(50+15*M.C(WingSine/23)),0,M.R(90)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(50+15*M.C(WingSine/23)),0,M.R(-30)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/23)),0,M.R(-60)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(50+15*M.C(WingSine/23)),0,M.R(-90)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.TSI=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-0)*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-0+.05*M.S(WingSine/35))*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Sonar2=function()
    LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,5,-0)*CF.A(M.R(10+80000*M.C(WingSine/2000)),0,M.R(-90)),.2)
    LWP2W.C0 = LWP2W.C0:lerp(CF.N(5,5,-0)*CF.A(M.R(10+70000*M.C(WingSine/2000)),0,M.R(-90)),.2)
    LWP3W.C0 = LWP3W.C0:lerp(CF.N(6,5,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-90)),.2)
	
    RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,5,-0)*CF.A(M.R(10+80000*M.C(WingSine/2000)),0,M.R(-90)),.2)
    RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5,5,-0)*CF.A(M.R(10+70000*M.C(WingSine/2000)),0,M.R(-90)),.2)
    RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6,5,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-90)),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,0,-3)*CF.A(M.R(-90+90000*M.C(WingSine/200000000000000000000000000999999999999999999000000999900000099999999)),0,M.R(-0)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

 --special wing anim --	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0.5,-1)*CF.A(0,M.R(90+0*M.C(WingSine/39)),M.R(-0-2000*M.R(WingSine/99999))),.2)
 --     RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,0,-3)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) INSANE WING ANIM
  --  RWP4W.C0 = RWP4W.C0:lerp(CF.N(-5,0,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) another special
WingAnims.NebG2=function(div)
	div=div or 25
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG3=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.BIGBLACK=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,10,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
end

WingAnims.whatere=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,1,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,1,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,1,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2,3,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2,3,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2,3,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,4,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(60 - 120*M.C(WingSine/100))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,4,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-60 + 120*M.C(WingSine/100))),.2)	
end

WingAnims.shlol=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,10,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,14,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end

WingAnims.NEBGNEPTUNAINV=function(mult)
	mult=mult or 150
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-950*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-650*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-950*M.C(WingSine/mult))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-950*M.C(WingSine/mult))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.70,2.50,-1.20+0*M.S(WingSine/35))*CF.A(M.R(-60-0*M.C(WingSine/32)),0,M.R(-70-0*M.C(WingSine/6400000))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-270-950*M.C(WingSine/mult))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+1*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NEBGNEPTUNAINVU=function(mult)
	mult=mult or 150
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-950*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-650*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-950*M.C(WingSine/mult))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-950*M.C(WingSine/mult))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-290-640*M.C(WingSine/mult))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-270-950*M.C(WingSine/mult))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+1*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Neb=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG4=function(div)
	div=div or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG5=function(mult)
	mult=mult or 300
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-700*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-700*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-700*M.C(WingSine/mult))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-700*M.C(WingSine/mult))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-190-700*M.C(WingSine/mult))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-270-700*M.C(WingSine/mult))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG6=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,12,-1)*CF.A(M.R(122+10*M.C(WingSine/322)),0,M.R(60)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,10,-1)*CF.A(M.R(122+10*M.C(WingSine/342)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,8,-1)*CF.A(M.R(122+10*M.C(WingSine/320)),0,M.R(120)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,12,-1)*CF.A(M.R(122+10*M.C(WingSine/322)),0,M.R(-60)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,10,-1)*CF.A(M.R(122+10*M.C(WingSine/342)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,8,-1)*CF.A(M.R(122+10*M.C(WingSine/320)),0,M.R(-120)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.bikgmk=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+1*M.C(WingSine/50),-1)*CF.A(M.R(25+0*M.C(WingSine/50)),0,M.R(60+1000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+1*M.C(WingSine/50),-1)*CF.A(M.R(25+0*M.C(WingSine/50)),0,M.R(120+1000*M.C(WingSine/400))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2+1*M.C(WingSine/50),-1)*CF.A(M.R(25+0*M.C(WingSine/50)),0,M.R(180+1000*M.C(WingSine/400))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+1*M.C(WingSine/50),-1)*CF.A(M.R(25+0*M.C(WingSine/50)),0,M.R(240+1000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,2+1*M.C(WingSine/50),-1)*CF.A(M.R(25+0*M.C(WingSine/50)),0,M.R(300+1000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,2+1*M.C(WingSine/50),-1)*CF.A(M.R(25+0*M.C(WingSine/50)),0,M.R(360+1000*M.C(WingSine/400))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.ereeeeeeee=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(90+2*M.C(WingSine/50))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(120+4*M.C(WingSine/50))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(60+4*M.C(WingSine/50))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(-90+2*M.C(WingSine/50))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(-120+4*M.C(WingSine/50))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(-60+4*M.C(WingSine/50))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,3.5,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,90,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,2.5,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.gaymibng=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1-3*M.C(WingSine/150),0,-5)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0+1000*M.C(WingSine/750))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1-3*M.C(WingSine/150),0,-5)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0+1000*M.C(WingSine/750))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1-3*M.C(WingSine/150),0,-5)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0+1000*M.C(WingSine/750))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1+3*M.C(WingSine/150),0,5)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0+1000*M.C(WingSine/750))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1+3*M.C(WingSine/150),0,5)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0+1000*M.C(WingSine/750))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1+3*M.C(WingSine/150),0,5)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0+1000*M.C(WingSine/750))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,0)*CF.A(0,M.R(-0+0*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,4.5,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,90,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+0*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,3.5,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
end
WingAnims.sere=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-3)*CF.A(M.R(-65+0*M.C(WingSine/45)),0,M.R(90+2000*M.C(WingSine/250))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(-45+0*M.C(WingSine/45)),0,M.R(180+2000*M.C(WingSine/500))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(-45+0*M.C(WingSine/45)),0,M.R(60+2000*M.C(WingSine/500))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+.5*M.C(WingSine/50),-3)*CF.A(M.R(-65+0*M.C(WingSine/45)),0,M.R(-90+2000*M.C(WingSine/250))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(-45+0*M.C(WingSine/45)),0,M.R(-180+2000*M.C(WingSine/500))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(-45+0*M.C(WingSine/45)),0,M.R(-60+2000*M.C(WingSine/500))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,3.5,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,90,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,2.5,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
WingAnims.ere21=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(90+24*M.C(WingSine/50))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(120+24*M.C(WingSine/50))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(60+24*M.C(WingSine/50))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(-90+-24*M.C(WingSine/50))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(-120+-24*M.C(WingSine/50))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2+.5*M.C(WingSine/50),-1)*CF.A(M.R(25+29*M.C(WingSine/45)),0,M.R(-60+-24*M.C(WingSine/50))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(0,M.R(0),0)*CF.N(-0,0,-1),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,90,0),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-0-WingSine))*CF.A(20.4,M.R(0),0)*CF.N(-0,90,0),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)		
end
 WingAnims.traera=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,1.5,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(60 - 30*M.C(WingSine/60))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,1.5,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(90 - 50*M.C(WingSine/60))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,1.5,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(120 - 60*M.C(WingSine/60))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,1.5,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-60 + 30*M.C(WingSine/60))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,1.5,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-90 + 50*M.C(WingSine/60))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,1.5,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-120 + 60*M.C(WingSine/60))),.2) 
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(90,100,-1)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/100),-2-0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0+4000*M.C(WingSine/402))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0,0,-0)*CF.A(M.R(0+0*M.C(WingSine/322)),0,M.R(0)),.2)	
end	
WingAnims.NebG6INSANE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,12,-1)*CF.A(M.R(122+30*M.C(WingSine/20)),0,M.R(61)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,14,-1)*CF.A(M.R(122+30*M.C(WingSine/20)),0,M.R(91)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,8,-1)*CF.A(M.R(122+30*M.C(WingSine/20)),0,M.R(121)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,12,-1)*CF.A(M.R(122+30*M.C(WingSine/20)),0,M.R(-61)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,14,-1)*CF.A(M.R(122+30*M.C(WingSine/20)),0,M.R(-91)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,8,-1)*CF.A(M.R(122+30*M.C(WingSine/20)),0,M.R(-121)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG7=function()
        mult=mult or 28
        LWP1W.C0 = LWP1W.C0:lerp(CF.N(.12,1,-4)*CF.A(M.R(9+254*M.C(WingSine/19)),155,M.R(36)),.2)
    LWP2W.C0 = LWP2W.C0:lerp(CF.N(.4,-5,-2)*CF.A(M.R(10+274*M.C(WingSine/19)),155,M.R(91)),.2)
    LWP3W.C0 = LWP3W.C0:lerp(CF.N(.29,3,-3)*CF.A(M.R(45+254*M.C(WingSine/19)),155,M.R(120)),.2)
    
    RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.12,1,-4)*CF.A(M.R(8+254*M.C(WingSine/19)),44,M.R(-36)),.2)
    RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.4,5,-2)*CF.A(M.R(10+274*M.C(WingSine/19)),44,M.R(-91)),.2)
    RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.29,3,-3)*CF.A(M.R(25+254*M.C(WingSine/19)),44,M.R(-120)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.SUPERNATURALFrench=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

if(data.User==data.Local)then
	Player.Chatted:connect(function(m)
		if(m:sub(1,3) == "/e")then m=m:sub(4) end
		if(m:sub(1,5) == "play/")then
			getMode('SYNAPSE-SCRIPTION').Music=Playlist[m:sub(6)] or tonumber(m:sub(6)) or 0
			music.SoundId="rbxassetid://"..getMode('SYNAPSE-SCRIPTION').Music;
		elseif(m:sub(1,5) == "tpos/")then
			music.TimePosition = tonumber(m:sub(6)) or 0
		elseif(m:sub(1,6) == "pitch/")then
			music.Pitch = tonumber(m:sub(7)) or 0
			getMode('SYNAPSE-SCRIPTION').Pitch=music.Pitch
		end
	end)
end

	
while true do
	swait()
	ClickTimer=math.max(ClickTimer-1,0)
	if(ClickTimer<=0 and Combo~=1)then
		print('reset')
		Combo=1
	end
	Sine=Sine+Change
	hue=hue+1
	if(hue>360)then hue=1 end
	local hitfloor,posfloor = workspace:FindPartOnRayWithIgnoreList(Ray.new(Root.CFrame.p,((CFrame.new(Root.Position,Root.Position - Vector3.new(0,1,0))).lookVector).unit * (4)), {Effects,Char,workspace[Player.Name]})
	local Walking = (math.abs(Root.Velocity.x) > 1 or math.abs(Root.Velocity.z) > 1)
	local State = (Hum.PlatformStand and 'Paralyzed' or Hum.Sit and 'Sit' or (not hitfloor or hitfloor.CanCollide==false) and Root.Velocity.y < -1 and "Fall" or (not hitfloor or hitfloor.CanCollide==false) and Root.Velocity.y > 1 and "Jump" or hitfloor and Walking and "Walk" or hitfloor and "Idle")
	Hum.WalkSpeed = WalkSpeed
	local sidevec = math.clamp((Torso.Velocity*Torso.CFrame.rightVector).X+(Torso.Velocity*Torso.CFrame.rightVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local forwardvec =  math.clamp((Torso.Velocity*Torso.CFrame.lookVector).X+(Torso.Velocity*Torso.CFrame.lookVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local sidevelocity = sidevec/Hum.WalkSpeed
	local forwardvelocity = forwardvec/Hum.WalkSpeed
	
	local lhit,lpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(LLeg.CFrame.p,((CFrame.new(LLeg.Position,LLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char,workspace[Player.Name]})
	local rhit,rpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(RLeg.CFrame.p,((CFrame.new(RLeg.Position,RLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char,workspace[Player.Name]})
	if(Mode=='SYNAPSE-SCRIPTION' and IsVaporwave(getMode'SYNAPSE-SCRIPTION'.Music))then
		vaporwaveMode=true
		text.Text='Ｖａｐｏｒｗａｖｅ'
		WingAnim='NebG3'
	else
		if(Mode=='SYNAPSE-SCRIPTION')then
			text.Text='SYNAPSE-SCRIPTION'
			WingAnim=getMode'SYNAPSE-SCRIPTION'.WingAnim
		end
		vaporwaveMode=false
	end
	
	
		if(Mode~='GOD' and WingAnim and WingAnims[WingAnim])then
		WingAnims[WingAnim]()
	elseif(Mode=='GOD')then
		if(State=='Idle')then
			WingAnims.NebG5()
		else
			WingAnims.StarL(1)	
		end
	elseif(WingAnim and typeof(WingAnim)=='table' and WingAnims[WingAnim[1]])then
		local gay={unpack(WingAnim)};
		table.remove(gay,1)
		WingAnims[WingAnim[1]](unpack(gay))
	else
		WingAnims.NebG5()
	end
	
	if(Mode=='SYNAPSE-SCRIPTION' and NeutralAnims)then
		WingSine=WingSine+(0.1+music.PlaybackLoudness/300)
	else
		WingSine=WingSine+1
	end
	
	if(music)then
		if(Mode=='SYNAPSE-SCRIPTION')then
			local clr = Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1))
			local clr2 = Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/950,0,1))
			text.TextColor3 = clr
			PrimaryColor = clr2
			for _,v in next, wingModel:GetDescendants() do
				if(v:IsA'BasePart')then
					v.Color = clr2
				elseif(v:IsA'Trail')then
					v.Color = ColorSequence.new(clr2)
				end
			end
		end
	end
	
	if(Mode=='Astronaut')then
		local pos = Head.Position
		local dist = (camera.CFrame.p-pos).magnitude
		local DropDist = 1
		local IneffectiveDist = 15
		local modifier = dist < DropDist and 1 or dist < IneffectiveDist and (0 - 1) / (IneffectiveDist - DropDist) * (dist - DropDist) + 1 or 0
	end
	
	if(Mode=='SYNAPSE-SCRIPTION' and data.User==data.Local)then
		Tween(camera,{FieldOfView=70-(music.PlaybackLoudness/20)},.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
	else
		Tween(camera,{FieldOfView=70},.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
	end
	
	if(State == 'Idle')then
		if(Mode=='Visualizer' and NeutralAnims and not vaporwaveMode)then Change = 0.1+music.PlaybackLoudness/200 else Change = 1 end
		if(Mode=='Neutral')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='Corruption')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.4,-.2+.05*M.S(Sine/32),.3)*CF.A(M.R(-30),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.4,-.2+.05*M.S(Sine/32),.3)*CF.A(M.R(-30),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
		elseif(Mode=='70S')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.25*M.C(Sine/10),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/10),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/10),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.25*M.C(Sine/10),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.25*M.C(Sine/10),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end			
		elseif(Mode=='Iniquitous')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end			
		elseif(Mode=='Pecularity')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0 + .5*M.C(Sine/32),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end	
		elseif(Mode=='Nonsense')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.15*M.C(Sine/15),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.15*M.S(Sine/15),0)*CF.A(0,M.R(20+5*M.C(Sine/15)),M.R(-45-35*M.C(Sine/15))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.15*M.S(Sine/15),0)*CF.A(0,M.R(-20-5*M.C(Sine/15)),M.R(45+35*M.C(Sine/15))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end				
		elseif(Mode=='DETERMINED X')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0.5,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-0-2.5*M.S(Sine/32)),-.5,0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0.4)*CF.A(0 + .0*M.C(Sine/32),M.R(25+5*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(1.6 + .0*M.C(Sine/32),M.R(5-5*M.C(Sine/32)),M.R(25+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,-.2)*CF.A(M.R(-12+0*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,20,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end				
		elseif(Mode=='testmode')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-0.1+.05*M.S(Sine/32),.4)*CF.A(-.4 + .0*M.C(Sine/32),M.R(0+0*M.C(Sine/32)),M.R(45-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,-0.1+.05*M.S(Sine/32),.4)*CF.A(-.4 + .0*M.C(Sine/32),M.R(0-0*M.C(Sine/32)),M.R(-45+0*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end							
		elseif(Mode=='SSS+')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.4*M.C(Sine/32),0)*CF.A(M.R(-45+0*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
			LS.C0 = LS.C0:lerp(LSC0*CF.N(0.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0+0*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/20),0)*CF.A(.8 + 0*M.C(Sine/20),M.R(5-5*M.C(Sine/20)),M.R(10+5*M.C(Sine/20))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end							
		elseif(Mode=='Purity')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='Funky')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(0),M.R(-0),M.R(90-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/25),0)*CF.A(0 + .8*M.C(Sine/16),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,.25-.25*M.C(Sine/50),-0.4)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='80s')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='CHRONOS')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end						
		elseif(Mode=='Lunar')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(-35),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-0+2.5*M.S(Sine/32)),M.R(35),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.002*M.S(Sine/20),0.2)*CF.A(0 + 0*M.C(Sine/20),M.R(20+2*M.C(Sine/20)),M.R(-15-2*M.C(Sine/20))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.001*M.S(Sine/20),0.2)*CF.A(0 + 0*M.C(Sine/20),M.R(-20-2*M.C(Sine/20)),M.R(15+2*M.C(Sine/20))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
										LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-.1)*CF.A(0,.3,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0-.1)*CF.A(0,-.3,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='Randomizer')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-0+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-0.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-0.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-4),M.R(28),M.R(-8)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end					
		elseif(Mode=='Luminous')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-0+1*M.S(Sine/64)),.8,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-0-2.5*M.S(Sine/32)),M.R(-45),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='Superior')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-0+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.3,0+.05*M.S(Sine/32),-0)*CF.A(M.R(0),M.R(-45),M.R(-180-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.15,-0.26+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(-10-5*M.C(Sine/32)),M.R(-10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='90s')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-0+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.15,-0.26+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(20+5*M.C(Sine/32)),M.R(20-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.15,-0.26+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(-20-5*M.C(Sine/32)),M.R(-20+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end						
		elseif(Mode=='S P A C E T I M E')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(CF.N(0,4.8+.2*M.C(Sine/24),0)*CF.A(M.R(6+0*M.S(Sine/24)),M.R(0),M.R(-4)),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='THEORIES')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.2*M.C(Sine/39),3+.2*M.C(Sine/32),0)*CF.A(M.R(0+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(15-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(9+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-9-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+0*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+0*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
	elseif(Mode=='Euclidean')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,2.4+.2*M.C(Sine/24),0)*CF.A(M.R(60+5*M.S(Sine/24)),M.R(0),M.R(0)),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(-0.,-0+.05*M.S(Sine/32),0)*CF.A(M.R(-60),M.R(5+0*M.C(Sine/32)),M.R(0-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0.,-0+.05*M.S(Sine/32),0)*CF.A(M.R(-60),M.R(5-0*M.C(Sine/32)),M.R(-0+1*M.C(Sine/32))),Alpha)
				NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.5)*CF.A(M.R(-40-5*M.S(Sine/24)),M.R(-18.7),M.R(-3.7)),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-63.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end			
	elseif(Mode=='Chain Magician')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-0+.2*M.S(Sine/32),-.4)*CF.A(M.R(0),M.R(25),M.R(90-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.2*M.S(Sine/32),-.4)*CF.A(M.R(-0),M.R(-25),M.R(-90+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='BETRAYAL')then
			local Alpha = .1
			if(NeutralAnims)then
				if(M.RNG(1,15)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-25-2.5*M.S(Sine/32)),0,0),Alpha)
				end			    
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
			LS.C0 = LS.C0:lerp(LSC0*CF.N(0.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0+0*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(25),M.R(-15-2.5*M.C(Sine/32)),M.R(5-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(25),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(25),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end		
		elseif(Mode=='Grim')then
			local Alpha = .1
			if(NeutralAnims)then
				if(M.RNG(1,5)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-25-2.5*M.S(Sine/32)),0,0),Alpha)
				end			    
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0+.7*M.C(Sine/100),2+.3*M.C(Sine/32),0)*CF.A(M.R(-35+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
			LS.C0 = LS.C0:lerp(LSC0*CF.N(0.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0+0*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0-0*M.C(Sine/32)),M.R(-15+0*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end					
		elseif(Mode=='c a l m')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.2+.05*M.C(Sine/32),0)*CF.A(M.R(65+9*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(0+5*M.C(Sine/32)),M.R(-30-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-0-5*M.C(Sine/32)),M.R(30+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-25),0,M.R(-10)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-25),0,M.R(10)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='Laid-Back')then
			local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(CF.N(0,0.7+.1*M.C(Sine/36),0)*CF.A(M.R(20),M.R(0),M.R(-0-2.5*M.S(Sine/36))),Alpha)
			        LS.C0 = LS.C0:lerp(CF.N(-1.1,1,0.2)*CF.A(M.R(173.3+1*M.S(Sine/28)),M.R(19.9+2*M.S(Sine/28)),M.R(38.7)),Alpha)
			    	RS.C0 = RS.C0:lerp(CF.N(1.1,1,0.2)*CF.A(M.R(-173.3+1*M.S(Sine/28)),M.R(-19.9+2*M.S(Sine/28)),M.R(-38.7)),Alpha)
		    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					if(legAnims)then
				    LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(70+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			       	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		elseif(Mode=='Mayhem')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-5+1*M.S(Sine/64)),M.R(-25),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,.5+.05*M.S(Sine/32),-0.3)*CF.A(M.R(175),M.R(15),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(0-2.5*M.C(Sine/32)),M.R(15-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-0),M.R(25),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(0),-0,-0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='IDOLS')then
			local Alpha = .1
			if(NeutralAnims)then	
		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.2*M.C(Sine/39),4+.3*M.C(Sine/32),0)*CF.A(M.R(-0+0*M.S(Sine/58)),M.R(-0+0*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='Solitude')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-35+1*M.S(Sine/64)),M.R(-0),0),Alpha)
						    				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(M.R(0),M.R(0),M.R(0))*CF.A(M.R(0+0*M.S(Sine/32)),0,0),Alpha)
				end
			LS.C0 = LS.C0:lerp(LSC0*CF.N(0.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0+0*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0-0*M.C(Sine/32)),M.R(-15+0*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(35),M.R(7),-0.1),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(35),-7,0.1),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='Silence')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-23+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.6,0.3+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-35),M.R(50-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end				
		elseif(Mode=='INTERGALACTIC')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),15+.6*M.C(Sine/32),0)*CF.A(M.R(-25+5*M.S(Sine/58)),M.R(25+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-25),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,0+.05*M.S(Sine/32),-0.5)*CF.A(0.2,M.R(14+5*M.C(Sine/32)),M.R(55-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-0.5)*CF.A(2,M.R(-14-5*M.C(Sine/32)),M.R(-75+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end							
		--[[elseif(Mode=='Chaos')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),.5+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,0,M.R(-15+5*M.S(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,0,M.R(15-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,.5,-.2)*CF.A(0,0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end]]
		elseif(Mode=='Chaos')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='Destiny')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.40*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		elseif(Mode=='Equinox')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.40*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end	
		elseif(Mode=='Explosion')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.40*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-165-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end									
		elseif(Mode=='Kalamari')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.40*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(M.R(0),M.R(-20),M.R(-20-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-.0)*CF.A(M.R(-0),M.R(20),M.R(20+1*M.S(Sine/36))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+0*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end				
		elseif(Mode=='Surreptitious')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.2*M.C(Sine/39),4+.3*M.C(Sine/32),0)*CF.A(M.R(-0+5*M.S(Sine/58)),M.R(-25+5*M.C(Sine/42)),.3),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-0-2.5*M.S(Sine/32)),M.R(25),-.3),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.05*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(15+2.5*M.C(Sine/32)),M.R(-35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.2)*CF.A(M.R(-25),M.R(-15-2.5*M.C(Sine/32)),M.R(-25+1.5*M.C(Sine/32))),Alpha)
				if(legAnims)then
										LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(30),M.R(-12)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+0*M.S(Sine/24)),M.R(-15),M.R(25)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end		
		elseif(Mode=='Sanctuary')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.2*M.C(Sine/39),.3+.3*M.C(Sine/32),0)*CF.A(M.R(-0+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end					
		elseif(Mode=='CATASTROPHE')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.40*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end		
		elseif(Mode=='Calamity')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end	
		elseif(Mode=='Pastel')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(12+0*M.C(Sine/32)),M.R(-19-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-12-0*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end				
		elseif(Mode=='Anxiety')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.0+.0*M.C(Sine/39),1.8+.9*M.C(Sine/32),0)*CF.A(M.R(-25+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-9-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0.4,M.R(-25+5*M.C(Sine/32)),M.R(-25-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0.4,M.R(25-5*M.C(Sine/32)),M.R(25+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(-25+0*M.S(Sine/24)),M.R(0),M.R(-0)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.5,-.6,-0.4)*CF.A(M.R(-25+3.5*M.S(Sine/24)),M.R(0),M.R(0)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end		
					elseif(Mode=='Redemption')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.0+.0*M.C(Sine/39),1+.4*M.C(Sine/32),0)*CF.A(M.R(8+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-8-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-.2+.05*M.S(Sine/32),0.2)*CF.A(-0.2,M.R(15+5*M.C(Sine/32)),M.R(25-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,-.2+.05*M.S(Sine/32),0.2)*CF.A(-0.2,M.R(-15-5*M.C(Sine/32)),M.R(-25+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(-15+0*M.S(Sine/24)),M.R(0,2),M.R(-0)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.5,-.6,-0.4)*CF.A(M.R(-15+3.5*M.S(Sine/24)),M.R(-0.2),M.R(0)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end		
		elseif(Mode=='INFINITE')then
			local Alpha = .1
			if(NeutralAnims)then
			RS.C0 = RS.C0:lerp(RSC0*CF.N(-.6,0.3+math.random(-4,4),0)*CF.A(M.R(175+math.random(-90,90)),M.R(35-2.5*M.C(Sine/32)),M.R(-50-1.5*M.C(Sine/32))),Alpha)
				if(M.RNG(1,25)==1)then
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-.6,0.3+.05*M.S(Sine/32),0)*CF.A(M.R(54),M.R(1-2.5*M.C(Sine/32)),M.R(-93-1.5*M.C(Sine/32))),Alpha)
				else
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.6,0.3+.05*M.S(Sine/32),0)*CF.A(M.R(175+math.random(-30,30)),M.R(35-2.5*M.C(Sine/32)),M.R(-50-1.5*M.C(Sine/32))),Alpha)
				end
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175+math.random(-30,30)),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				if(M.RNG(1,25)==1)then
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(-.6,0.3+.05*M.S(Sine/32),0)*CF.A(M.R(54),M.R(1-2.5*M.C(Sine/32)),M.R(-93-1.5*M.C(Sine/32))),Alpha)
				else
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.6,0.3+.05*M.S(Sine/32),-0)*CF.A(M.R(175+math.random(-30,30)),M.R(-35),M.R(50-2*M.S(Sine/36))),Alpha)
				end
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+math.random(-9,9),3+math.random(-6,6),0)*CF.A(M.R(-23+math.random(-90,90)),M.R(-15+math.random(-55,55)),0),Alpha)
				if(M.RNG(1,25)==1)then
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-7+math.random(-9,9),7+math.random(-6,6),0)*CF.A(M.R(-95+math.random(-90,90)),M.R(-90+math.random(-55,55)),0),Alpha)
				else
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+math.random(-9,9),3+math.random(-6,6),0)*CF.A(M.R(-23+math.random(-90,90)),M.R(-15+math.random(-55,55)),0),Alpha)
				end				
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+math.random(-9,9),3+math.random(-6,6),0)*CF.A(M.R(-23+math.random(-90,90)),M.R(-15+math.random(-55,55)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
                RS.C0 = RS.C0:lerp(RSC0*CF.N(-.6,0.3+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(35-2.5*M.C(Sine/32)),M.R(-50-1.5*M.C(Sine/32))),Alpha)
                LS.C0 = LS.C0:lerp(LSC0*CF.N(.6,0.3+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-35),M.R(50-2*M.S(Sine/36))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end					
		elseif(Mode=='Memer')then
			local Alpha = .1
			if(NeutralAnims)then
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2.05*M.C(Sine/80),0)*CF.A(M.R(-336+350*M.S(Sine/80)),M.R(-335+330*M.C(Sine/80)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-90+0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(90+0*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end			
	elseif(Mode=='Overpowered')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.8,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end			
		elseif(Mode=='Celestial')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+2*M.C(Sine/39),4+.6*M.C(Sine/32),0)*CF.A(M.R(-0+0*M.S(Sine/58)),M.R(-0+0*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.2,-.2+.05*M.S(Sine/32),-0.35)*CF.A(M.R(25),M.R(-25),M.R(15-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.8,0+.05*M.S(Sine/32),-0.5)*CF.A(M.R(-90),M.R(-15),M.R(-90+1*M.S(Sine/36))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end	
		elseif(Mode=='WArPeD')then
			local Alpha = .1
			if(NeutralAnims)then
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.6,0.3+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(35-2.5*M.C(Sine/32)),M.R(-50-1.5*M.C(Sine/32))),Alpha)
				if(M.RNG(1,25)==1)then
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-.4,0+.05*M.S(Sine/32),0)*CF.A(M.R(30),M.R(5-2.5*M.C(Sine/32)),M.R(-60-1.5*M.C(Sine/32))),Alpha)
				else
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.6,0.3+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(35-2.5*M.C(Sine/32)),M.R(-50-1.5*M.C(Sine/32))),Alpha)
				end
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				if(M.RNG(1,25)==1)then
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.9,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(0),M.R(-0),M.R(686-2*M.S(Sine/36))),Alpha)
				else
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.6,0.3+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-35),M.R(50-2*M.S(Sine/36))),Alpha)
				end
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-23+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.6,0.3+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-35),M.R(50-2*M.S(Sine/36))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end	
		elseif(Mode=='KARMA')then
			local Alpha = .1
			if(NeutralAnims)then
			    				if(M.RNG(1,14)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				end
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.7*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-.0+.3*M.S(Sine/32),0)*CF.A(M.R(-0),M.R(7+2.5*M.C(Sine/32)),M.R(-15-14*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0,-.0+.3*M.S(Sine/32),0)*CF.A(M.R(-0),M.R(-7-2.5*M.C(Sine/32)),M.R(15+14*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end	
		elseif(Mode=='Crystallized')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(.3+.2*M.C(Sine/39),3+.6*M.C(Sine/32),0)*CF.A(M.R(-0+0*M.S(Sine/58)),M.R(-0+0*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end				
		elseif(Mode=='Azure')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.1,-0.2+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5+0*M.C(Sine/32)),M.R(20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-1,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-0),M.R(-0),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='AZURE X')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.7*M.C(Sine/39),1.5+.3*M.C(Sine/32),0)*CF.A(M.R(-0+0*M.S(Sine/58)),M.R(28+0*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-15+5*M.C(Sine/32)),M.R(-25-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(15-5*M.C(Sine/32)),M.R(25+5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end			
		elseif(Mode=='Visualizer')then
			if(vaporwaveMode)then
			  	local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2-.1*M.S(Sine/36),0.6)*CF.A(M.R(74.3+2.5*M.C(Sine/36)),M.R(0),M.R(0)),Alpha)
					LS.C0 = LS.C0:lerp(CF.N(-1,0.8,0)*CF.A(M.R(11.4-5*M.C(Sine/42)),M.R(-3.3),M.R(137.5)),Alpha)
					RS.C0 = RS.C0:lerp(CF.N(1,0.9,-0.1)*CF.A(M.R(13.7-5*M.C(Sine/42)),M.R(7.7),M.R(-136.2)),Alpha)
					NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.3)*CF.A(M.R(-16.6-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
					if(legAnims)then
						LH.C0 = LH.C0:lerp(CF.N(-0.7,-1,0)*CF.A(M.R(37.2+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
						RH.C0 = RH.C0:lerp(CF.N(0.8,-1.1,-0.1)*CF.A(M.R(5.9+5*M.C(Sine/36)),M.R(3.5),M.R(-43.9)),Alpha)
					end
				elseif(legAnims)then
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			else
				local Alpha = .3
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/20)+(music.PlaybackLoudness/5000),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(35),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(0+1*M.S(Sine/24)),M.R(-35),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.A(0,0,M.R(-15+10*M.C(Sine/20))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(75-(music.PlaybackLoudness/7.5)),M.R(5),M.R(35)),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-.05*M.C(Sine/20)-(music.PlaybackLoudness/5000),0)*CF.A(0,M.R(25),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-.05*M.C(Sine/20)-(music.PlaybackLoudness/5000),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			end
		elseif(Mode=='Radioactive')then
			local Alpha = .1
			if(NeutralAnims)then	
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(-15),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.1,-0.2+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5+0*M.C(Sine/32)),M.R(20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-1,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-0),M.R(-0),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='Infestation')then
			local Alpha = .1
			if(NeutralAnims)then	
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(-15),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='Plague')then
			local Alpha = .1
			if(NeutralAnims)then	
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(-15),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.1,-0.2+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5+0*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-1,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-0),M.R(-0),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
	elseif(Mode=='GOD OF DESTRUCTION')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.1,-0.2+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5+0*M.C(Sine/32)),M.R(20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-1,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-0),M.R(-0),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end		
	elseif(Mode=='Love')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(0,0,M.R(0+5*M.C(Sine/16))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-0.2+0.1*M.S(Sine/52),-.5)*CF.A(M.R(10+1*M.C(Sine/51)),M.R(5+5*M.C(Sine/57)),M.R(35-1*M.C(Sine/46))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,-0.2+0.1*M.S(Sine/52),-.5)*CF.A(M.R(25),M.R(10+1*M.C(Sine/51)),M.R(-35+1*M.C(Sine/46))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,-M.R(0+5*M.C(Sine/16)))*CF.A(M.R(0),M.R(0),.1),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,-M.R(0+5*M.C(Sine/16)))*CF.A(M.R(0),M.R(0),-.1),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='Vanta Black')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
	elseif(Mode=='Violence')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(0,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-1)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(4),M.R(-28),M.R(8)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
	elseif(Mode=='Withered')then
			local Alpha = .1
			if(NeutralAnims)then
			    				if(M.RNG(1,59)==1)then
					RS.C0 = RS.C0:lerp(RSC0*CF.N(2,0+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5-2.5*M.C(Sine/32)),M.R(-60-1.5*M.C(Sine/32))),Alpha)
				else
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(125),M.R(15-2.5*M.C(Sine/32)),M.R(20-1.5*M.C(Sine/32))),Alpha)
				end
				if(M.RNG(1,59)==1)then
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(-3,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(0),M.R(-0),M.R(1-2*M.S(Sine/36))),Alpha)
				else
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(55),M.R(-15),M.R(-20-2*M.S(Sine/36))),Alpha)
				end	
			    				if(M.RNG(1,35)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-25-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				end				
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0+.3*M.C(Sine/125),4+.3*M.C(Sine/65),0)*CF.A(-0.7,M.R(0),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-25-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(55),M.R(-15),M.R(-20-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(125),M.R(15-2.5*M.C(Sine/32)),M.R(20-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end				
	elseif(Mode=='HATRED')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.35*M.C(Sine/32),0)*CF.A(M.R(-35+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(M.R(35),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end				
	elseif(Mode=='Murder')then
			local Alpha = .1
			if(NeutralAnims)then	
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-23+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.6,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(15),M.R(8.3)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end		
	elseif(Mode=='Multi-Diversal')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-5+25*M.C(Sine/39),60+7*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.4,1,0.2)*CF.A(M.R(173.3+1*M.S(Sine/28)),M.R(7+2*M.S(Sine/28)),M.R(0)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.7,0.3,-0.6)*CF.A(M.R(46.8+1*M.S(Sine/28)),M.R(6.4+2*M.S(Sine/28)),M.R(-79.6)),Alpha)
				NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.5)*CF.A(M.R(-40-5*M.S(Sine/24)),M.R(-18.7),M.R(-3.7)),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end		
	elseif(Mode=='nil')then
			local Alpha = .1
			if(NeutralAnims)then
			    				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
				if(M.RNG(1,5)==1)then
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-9,0+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5-2.5*M.C(Sine/32)),M.R(-60-1.5*M.C(Sine/32))),Alpha)
				else
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
				end
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				if(M.RNG(1,5)==1)then
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.9,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(0),M.R(-0),M.R(1-2*M.S(Sine/36))),Alpha)
				else
				    LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				end	
                    RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-23+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,5)==1)then
				    RJ.C0 = RJ.C0:lerp(LSC0*CF.N(-3,-4+.05*M.S(Sine/32),-0)*CF.A(M.R(0),M.R(-90),M.R(686-2*M.S(Sine/36))),Alpha)
				else
                    RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-23+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				end	
    			    LH.C0 = LH.C0:lerp(CF.N(-0.6,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(15),M.R(8.3)),Alpha)
				if(M.RNG(1,5)==1)then
				    LH.C0 = LH.C0:lerp(CF.N(4,-6,-8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
   					LH.C0 = LH.C0:lerp(CF.N(-0.6,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(15),M.R(8.3)),Alpha)
				end	
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				if(M.RNG(1,5)==1)then
					RH.C0 = RH.C0:lerp(CF.N(4,-6,-8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
   					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end					
                RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.5+.7*M.C(Sine/39),6+.6*M.C(Sine/32),0)*CF.A(M.R(-23+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.6,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(15),M.R(8.3)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end					
		elseif(Mode=='UnKnOwn')then
			local Alpha = .1
			if(NeutralAnims)then
			    				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(M.R(-15.6),M.R(-20.1),M.R(-5.5))*CF.A(M.R(0+1.5*M.S(Sine/32)),0,0),Alpha)
				end
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-1.4+.05*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-25-2.5*M.S(Sine/32)),M.R(-0),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0+0*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0-0*M.C(Sine/32)),M.R(-15+0*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0-.8)*CF.A(M.R(-65),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1.3-.05*M.C(Sine/32),0-.3)*CF.A(M.R(25),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='Fairy')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.4*M.C(Sine/32),0)*CF.A(M.R(15+5*M.S(Sine/32)),-.0,.0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-16-2.5*M.S(Sine/32)),M.R(.6),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.3,0+.05*M.S(Sine/32),0)*CF.A(M.R(160),M.R(15+5*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(M.R(-8),M.R(-15-5*M.C(Sine/32)),M.R(15+0*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-0-.05*M.C(Sine/32),0-.0)*CF.A(M.R(-15),0,M.R(-0)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.3-.0)*CF.A(M.R(-15),0,M.R(0)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end				
		elseif(Mode=='Stranger')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(25+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(10-2.5*M.S(Sine/32)),M.R(-5-25*M.S(Sine/25)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(M.R(-25),M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(M.R(-25),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end		
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-25),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-25),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end			
		elseif(Mode=='The Big Black')then
			local Alpha = .1
			if(NeutralAnims)then
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(CF.N(0,2+.35*M.C(Sine/32),0.2)*CF.A(M.R(15.5),M.R(90),M.R(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-0.9,0.4,-0.7)*CF.A(M.R(121.8),M.R(50),M.R(84.8))*CF.A(M.R(0+3*M.S(Sine/32)),0,0),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.3,0.3,-0.1)*CF.A(M.R(40+5*M.C(Sine/44)),M.R(-11.6),M.R(65.5+2.5*M.C(Sine/36))),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(M.R(-15.6),M.R(-20.1),M.R(-5.5))*CF.A(M.R(0+1.5*M.S(Sine/32)),0,0),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		elseif(Mode=='NANODEATH')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),3+.2*M.C(Sine/32),0)*CF.A(M.R(15+5*M.S(Sine/58)),M.R(10+1*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-15-2.5*M.S(Sine/32)),M.R(-10),0),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end			
		elseif(Mode=='SHD')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-.15,0)*CF.A(M.R(15),0,M.R(20)),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.A(0,0,M.R(15+3*M.S(Sine/16))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='Blaze')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(200+5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='Death')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end				
		elseif(Mode=='Determined')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
					elseif(Mode=='Cursed')then
			local Alpha = .1
			if(NeutralAnims)then
			    				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),3+.2*M.C(Sine/32),0)*CF.A(M.R(-35+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(-0.3,0,-M.R(0+1*M.C(Sine/16))),Alpha)
LS.C0 = LS.C0:lerp(LSC0*CF.N(0.2,-0+.05*M.S(Sine/32),-0.2)*CF.A(M.R(167),M.R(15-2.5*M.C(Sine/32)),M.R(15-1.5*M.C(Sine/32))),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.2,-0+.05*M.S(Sine/32),-0.2)*CF.A(M.R(167),M.R(-15-2.5*M.C(Sine/32)),M.R(-15-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(-30+0*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30+0*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
								elseif(Mode=='Satanic')then
			local Alpha = .1
			if(NeutralAnims)then
			    				if(M.RNG(1,10)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-76,76),M.RRNG(-76,76),M.RRNG(-76,76)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),3+.2*M.C(Sine/32),0)*CF.A(M.R(-8+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(-0.3,0,-M.R(0+1*M.C(Sine/16))),Alpha)
LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0+.1*M.S(Sine/32),-0)*CF.A(M.R(8),M.R(45-2.5*M.C(Sine/32)),M.R(-35-1.5*M.C(Sine/32))),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.N(-0,-0+.1*M.S(Sine/32),-0)*CF.A(M.R(8),M.R(-45-2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(-30+0*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30+0*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='The Mediocrely-Sized Black')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-0+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end							
		elseif(Mode=='DESTRUCTION')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.1*M.C(Sine/39),3+.4*M.C(Sine/100),0)*CF.A(M.R(-4+0*M.S(Sine/58)),M.R(-15+0*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(-.4,0+.3*M.C(Sine/600),-M.R(0+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(15-5*M.C(Sine/32)),M.R(200+12*M.C(Sine/75))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.7,-.1+.05*M.S(Sine/32),-.6)*CF.A(M.R(-15),M.R(-15),M.R(-90+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+0*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+0*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end	
		elseif(Mode=='DESTRUCTION X')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.4+.9*M.C(Sine/39),9+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end				
		elseif(Mode=='Hypnotic')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.2*M.C(Sine/39),3+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
LS.C0 = LS.C0:lerp(LSC0*CF.N(-0,-.0+.05*M.S(Sine/32),.0)*CF.A(M.R(90),M.R(-6+2.5*M.C(Sine/32)),M.R(-15-1.5*M.C(Sine/32))),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,-.5+.05*M.S(Sine/32),-0.2)*CF.A(M.R(180),M.R(25-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+0*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+0*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end							
		elseif(Mode=='ACE OF SPADES')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(200+5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-0),M.R(-0),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end							
        elseif(Mode=='Divinity')then
			local Alpha = .1
			if(NeutralAnims)then	
			RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.2*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-17.5+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0.3+.5*M.C(Sine/45),-M.R(0+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-.0+.05*M.S(Sine/32),-.0)*CF.A(M.R(15),M.R(15+2.5*M.C(Sine/32)),M.R(-15-7*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0,-.0+.05*M.S(Sine/32),.0)*CF.A(M.R(15),M.R(-15-2.5*M.C(Sine/32)),M.R(15+7*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end							
       elseif(Mode=='FALLEN X')then
			local Alpha = .1
			if(NeutralAnims)then	
			RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.2*M.C(Sine/39),4+.2*M.C(Sine/32),0)*CF.A(M.R(-0+5*M.S(Sine/58)),M.R(-25+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0.5+.0*M.C(Sine/45),-M.R(0+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.7,-.0+.05*M.S(Sine/32),-.8)*CF.A(M.R(90),M.R(0),M.R(90-7*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0,-.0+.05*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(-15-2.5*M.C(Sine/32)),M.R(15+7*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end										
		elseif(Mode=='Faith')then
			local Alpha = .1
			if(NeutralAnims)then
			   GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Pink'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(10+1*M.C(Sine/16))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0,M.R(5-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-30.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end										
			elseif(Mode=='Chillin')then
				local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(CF.N(0,0.7+.1*M.C(Sine/36),0)*CF.A(M.R(0),M.R(0),M.R(-0-2.5*M.S(Sine/36))),Alpha)
					LS.C0 = LS.C0:lerp(CF.N(-1.4,0.2,0)*CF.A(M.R(-0),M.R(10),M.R(-10)),Alpha)
		    		RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.2+.05*M.S(Sine/32),0)*CF.A(M.R(0),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
		    		NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		end
	--custom walks--
	
	    elseif(State == 'Walk')then
		if(Mode=='EMPEROR ZINYAK')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-15+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				    elseif(State == 'Walk')then
		if(Mode=='ETERNAL LIGHT')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-57+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
 elseif(State == 'Walk')then
		if(Mode=='ENERGY')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,17+3/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
			
			 elseif(State == 'Walk')then
		if(Mode=='GL^%£ITCH')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),4+.2*M.C(Sine/32),0)*CF.A(M.R(-15+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48322732e-06, 1)*CF.A(-2,4,M.R(-7+14*M.S(Sine/50))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.53871994e-07, 1)*CF.A(-2,-4,M.R(7-14*M.S(Sine/50))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.8845396508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
    elseif(State == 'Walk')then
		if(Mode=='KARMA' or Mode=='Sanctuary'  or Mode=='IDOLS')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-35+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-0.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-0.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(35-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			    elseif(State == 'Walk')then
		if(Mode=='Galaxy')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.0+.0*M.C(Sine/39),0+.0*M.C(Sine/32),0)*CF.A(M.R(-0+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-0.2+0.1*M.S(Sine/52),-.5)*CF.A(M.R(10+1*M.C(Sine/51)),M.R(5+5*M.C(Sine/57)),M.R(35-1*M.C(Sine/46))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,-0.2+0.1*M.S(Sine/52),-.5)*CF.A(M.R(25),M.R(10+1*M.C(Sine/51)),M.R(-35+1*M.C(Sine/46))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end

		    
	    elseif(State == 'Walk')then
		if(Mode=='S P E E D')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				    elseif(State == 'Walk')then
		if(Mode=='The Big Black'  or Mode=='Surreptitious' or Mode=='Destiny'or Mode=='Satanic' or Mode=='Cursed' or Mode=='FALLEN X' or Mode=='Explosion' or Mode=='Divinity'or Mode=='Withered' or Mode=='Grim' or Mode=='Withered' or Mode=='Grim' or Mode=='Crystallized'  or Mode=='HATRED'  or Mode=='Silence'  or Mode=='INFINITE' or Mode=='Faith' or Mode=='ACE OF SPADES' or Mode=='Anxiety' or Mode=='Equinox' or Mode=='Hypnotic' or Mode=='Laid-Back'or Mode=='The Mediocrely-Sized Black' or Mode=='DESTRUCTION' or Mode=='Kalamari' or Mode=='INTERGALACTIC' or Mode=='Murder' or Mode=='Overpowered' or Mode=='Multi-Diversal' or Mode=='SHD' or Mode=='DESTRUCTION X'or Mode=='GOD OF DESTRUCTION' or Mode=='Chillin' or Mode=='c a l m' or Mode=='Determined' or Mode=='THEORIES'or Mode=='nil'or Mode=='Fairy' or Mode=='WArPeD' or Mode=='Blaze' or Mode=='Celestial' or Mode=='Pastel' or Mode=='NANODEATH' or Mode=='Calamity' or Mode=='S P A C E T I M E' or Mode=='AZURE X' or Mode=='Euclidean' or Mode=='CATASTROPHE')then
			local Alpha = .1
  			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),.5+.2*M.C(Sine/32),0)*CF.A(M.R(-65+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0,Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end



  elseif(State == 'Walk')then
		if(Mode=='+OVERPOWERED+')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			  elseif(State == 'Walk')then
		if(Mode=='AFTERLIFE')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
	  elseif(State == 'Walk')then
		if(Mode=='GOD OF BLADES')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			
			
				  elseif(State == 'Walk')then
		if(Mode=='Death')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
							  elseif(State == 'Walk')then
		if(Mode=='ULTRA SANS')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			
	  elseif(State == 'Walk')then
		if(Mode=='Corruption' or Mode=='Randomizer' or Mode=='Iniquitous')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-0.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

	  elseif(State == 'Walk')then
		if(Mode=='Galaxy')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),13+3*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			



	  elseif(State == 'Walk')then
		if(Mode=='Love')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-0.2+0.1*M.S(Sine/52),-.5)*CF.A(M.R(10+1*M.C(Sine/51)),M.R(5+5*M.C(Sine/57)),M.R(35-1*M.C(Sine/46))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,-0.2+0.1*M.S(Sine/52),-.5)*CF.A(M.R(25),M.R(10+1*M.C(Sine/51)),M.R(-35+1*M.C(Sine/46))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

	  elseif(State == 'Walk')then
		if(Mode=='LEGMAN')then

			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
            	RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,17+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
			LS.C0 = LH.C0:lerp(LHC0*CF.N(0,28-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
			RS.C0 = RH.C0:lerp(RHC0*CF.N(0,28-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-28-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-28+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
	  elseif(State == 'Walk')then
		if(Mode=='Mayhem')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,.5+.05*M.S(Sine/32),-0.3)*CF.A(M.R(175),M.R(15),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
			end
				  elseif(State == 'Walk')then
		if(Mode=='UnKnOwn' or Mode=='Solitude' or Mode=='BETRAYAL')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0+0*M.C(Sine/32)),M.R(15-0*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.8,0+.05*M.S(Sine/32),0-.3)*CF.A(M.R(145),M.R(0-0*M.C(Sine/32)),M.R(-15+0*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				end
	  elseif(State == 'Walk')then
		if(Mode=='Chain Magician' or Mode=='CHRONOS')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

	  elseif(State == 'Walk')then
		if(Mode=='OVERKILL')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end


		else
		
			local wsVal = 4
			local Alpha = .2
			if(Mode=='+DANGEROUS+')then Change=.3 elseif(Mode=='Astronaut' or Mode=='J O Y F U L L' or Mode=='=-RED XESTER-=')then Change=1 else Change=.5 end
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0,0)*CF.A(M.R(0-55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				local footstepIds = {141491460,141491460}
				if(lhit and lhit.CanCollide and footstepSounds[lhit.Material])then
					if(lhit.Material==Enum.Material.Sand and lhit.Color.r*255>=160 and lhit.Color.g*255>=160 and lhit.Color.b*255>=160)then
						footstepIds[1] = footstepSounds[Enum.Material.Snow]
					else
						footstepIds[1] = footstepSounds[lhit.Material]
					end

				
				if(rhit and rhit.CanCollide and footstepSounds[rhit.Material])then
					if(rhit.Material==Enum.Material.Sand and rhit.Color.r*255>=160 and rhit.Color.g*255>=160 and rhit.Color.b*255>=160)then
						footstepIds[2] = footstepSounds[Enum.Material.Snow]
					else
						footstepIds[2] = footstepSounds[rhit.Material]
					end
				end
		

--end
	elseif(State == 'Jump')then
		local Alpha = .1
		local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)),Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
			RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
		end
	elseif(State == 'Fall')then
		local Alpha = .1
		local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)+idk),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)-idk),Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
			RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
		end
	elseif(State == 'Paralyzed')then
		local Alpha = .1
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0,Alpha)
			RS.C0 = RS.C0:lerp(RSC0,Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0,Alpha)
			NK.C0 = NK.C0:lerp(NKC0,Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0,Alpha)
			RH.C0 = RH.C0:lerp(RHC0,Alpha)
		end
	elseif(State == 'Sit')then
		

	if(data.User==data.Local)then
		local syncStuff={
			NeutralAnims;
			legAnims;
			{NK.C0,RJ.C0,RH.C0,RS.C0,LH.C0,LS.C0};
			{NK.C1,RJ.C1,RH.C1,RS.C1,LH.C1,LS.C1};
			Sine;
			movement;
			walking;	
			Change;
			--// OPTIONAL SYNC \\--
			MusicMode;
			(music and music.TimePosition or 0);
			(music and music.Pitch or 1);
			WingSine;
			getMode('SYNAPSE-SCRIPTION');
			Mode;
			hue;
		}
	end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end