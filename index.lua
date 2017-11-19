MODE = "app0:/"
--//--// Libraries //--
dofile(MODE.."libs/CryptLib.lua")
dofile(MODE.."libs/Font.lua")
--//--//--//--//--//--
NAMEOMBTQ={"Million", "Billion", "Trillion", "Quadrillion", "Quintillion", "Sextillion", "Septillion", "Octillion", "Nonillion", "Decillion", "Undecillion", "Duodecillion", "Tredecillion", "Quattuordecillion", "Quindecillion", "Sexdecillion", "Septendecillion", "Octodecillion", "Novemdecillion", "Vigintillion"}
--//--//Colors//--//--
local white = Color.new(255,255,255)
local black = Color.new(0,0,0)
local gray = Color.new(128,128,128)
local yellow = Color.new(255,255,80)
local blue = Color.new(80,80,255)
local red = Color.new(255,80,80)
local transred = Color.new(255,80,80,80)
local trans150red = Color.new(255,80,80,150)
local green = Color.new(80,255,80)
local transwhite = Color.new(255,255,255,150)
local trans100white = Color.new(255,255,255,100)
--//--//--//--//--//--

--//--//Const//--//--
CENTER_OF_COOKIE_X = 148
CENTER_OF_COOKIE_Y = 273
--//--//--//--//--//--
menu = 0
temp4grade = 0
version = "Version          0.2"
--//--//Tables//--//--
Building = {}
Button = {}
Cookie = {}
Cookie.shower = {}
CookiePerSecond = {}
Cursor = {}
Panel = {}
Price = {}
ScreenB = {}
Shine = {}
SpdOf = {}
Texture = {}
Touch = {}
Upgrade = {}
Upgrade.Now = {}
Game = {}
Milk = {}
Stick = {}
Stick.left={}
Stick.right={}
--//--//--//--//--//--
Button.default = 184
Button.tmp = 0
Button.quantity = 2
Button.x = 660
Button.y = Button.default
Button.defaulttemp = Button.default
Building.default = 112
Building.x = 312
Building.y = Building.default
Cookie.count = 0
Cookie.total = 0
Cookie.size = 0
Cookie.tmp = 0
Cookie.speed = 0.1
Cookie.shower.speed = 1
Cookie.shower.y = 0
Cursor.rot = 0
Cursor.speed = -0.0025
Cursor.max=30
Panel.kolvo = 1
Panel.state = "Buy"
Panel.tmp = 0
Shine.rot = 0
Shine.speed = 0.008
SpdOf.framerate = 60
SpdOf.tmp = 0
SpdOf.cmn = 0
Upgrade.default = Button.default
Upgrade.tmp = 0
Upgrade.mode = 1
Milk.y = 464
Milk.x = 0
Milk.speed = 0.8
Game.state = "Normal"
--//--//--//--//--//--
pi = math.pi
--//--//--//--//--//--
oldpad = SCE_CTRL_CROSS
function Building.show()
	for i=1, #Building do
		if Building.y + 144 * i > Building.default and Building.y + 144 * (i - 1) < 544 then
			Graphics.drawPartialImage(Building.x,Building.y+144*(i - 1), Texture["BLDBacks"], 0, 144 * (Button[Building[i].."id"] - 2), 332, 144)
			if (Button[Building[i].."count"] <= 9 and Button[Building[i].."id"] > 2 and Button[Building[i].."id"] < 6) or (Button[Building[i].."count"] <= 27 and Button[Building[i].."id"] == 2) or (Button[Building[i].."count"] <= 5 and Button[Building[i].."id"] >= 6) then
				if Building[i] == "Grandma" then
					for f = 1, math.floor((Button[Building[i].."count"] + 2) / 3) do
						Graphics.drawPartialImage(305 + 32 * (f - 1), Building.y + 144 * (i - 1) + 12, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
					for f = 1, math.floor((Button[Building[i].."count"] + 1) / 3) do
						Graphics.drawPartialImage(305 + 32 * (f - 1) + 12, Building.y + 144 * (i - 1) + 28, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
					for f = 1, math.floor((Button[Building[i].."count"]) / 3) do
						Graphics.drawPartialImage(305 + 32 * (f - 1) + 24, Building.y + 144 * (i - 1) + 44, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
				end
				if (Button[Building[i].."count"] <= 9 and Button[Building[i].."id"] > 2 and Button[Building[i].."id"] < 6) then
					for f = 1, math.floor((Button[Building[i].."count"] + 1) / 2) do
						Graphics.drawPartialImage(316 + 64 * (f - 1),Building.y + 144 * (i - 1) + 28, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
					for f = 1, math.floor((Button[Building[i].."count"]) / 2) do
						Graphics.drawPartialImage(316 + 64 * (f - 1) + 32, Building.y + 144 * (i - 1) + 52, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
				end
				if (Button[Building[i].."count"] <= 5 and Button[Building[i].."id"] >= 6) then
					local c = 0
					if Button[Building[i].."id"] == 7 then c = 32 end
					if Button[Building[i].."id"] == 7 then c = 32 end
					if Button[i] == "Shipment" then c = 28 end
					if Button[i] == "AlchemyLab" then c = 24 end
					if Button[i] == "Temple" then c = 28 end
					for f = 1, Button[Building[i].."count"] do
						Graphics.drawPartialImage(316 + 64 * (f - 1), Building.y + 144 * (i - 1) + 16 + c, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
				end
				else
				if (Button[Building[i].."count"] > 27 and Button[Building[i].."id"] == 2) then
					if Building[i] == "Grandma" then
						for f = 1, 9 do
							Graphics.drawPartialImage(305 + 32 * (f - 1), Building.y + 144 * (i - 1) + 12, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
						end
						for f = 1, 9 do
							Graphics.drawPartialImage(305 + 32 * (f - 1) + 12, Building.y + 144 * (i - 1) + 28, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
						end
						for f = 1, 9 do
							Graphics.drawPartialImage(305 + 32 * (f - 1) + 24, Building.y + 144 * (i - 1) + 44, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
						end
					end
				end
				if (Button[Building[i].."count"] > 9 and Button[Building[i].."id"] > 2 and Button[Building[i].."id"] < 6) then
					for f = 1, 5 do
						Graphics.drawPartialImage(316 + 64 * (f - 1), Building.y + 144 * (i - 1) + 28, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
					for f = 1, 4 do
						Graphics.drawPartialImage(316 + 64 * (f - 1) + 32, Building.y + 144 * (i - 1) + 52, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
				end
				if (Button[Building[i].."count"] > 5 and Button[Building[i].."id"] >= 6) then
					local c = 0
					if Button[Building[i].."id"] == 7 then c = 32 end
					if Button[i] == "Shipment" then c = 28 end
					if Button[i] == "AlchemyLab" then c = 24 end
					if Button[i] == "Temple" then c = 28 end
					for f = 1, 5 do
						Graphics.drawPartialImage(316 + 64 * (f - 1), Building.y + 144 * (i - 1) + 16 + c, Texture["BLDIcons"], 0 + 64 * (Button[Building[i].."id"] - 2), 0, 64, 64)
					end
				end
			end
		end
	end
	Graphics.drawPartialImage(312, 0, Texture["background"], 312, 0, 332, Building.default)
end
function Building.touch()
	if Touch["x"] ~= nil and Touch["x"] > Building.x and Touch["x"] < Building.x + 332 and Touch["y"] > Building.default and Touch["y"] < Building.y + 144 * #Building and Touch["Now"] == "N" then
		Building.oldy = Building.oldy or Touch["y"] - Building.y
		Touch["Now"] = "Buildings"
	end	
	if Touch["Now"] == "Buildings" and Touch["x"]~=nil then
		if Building.y < Building.default then
			Building.y = Touch["y"] - Building.oldy
		elseif Building.y > Building.default - (#Building - 1) * 144 then
			Building.y = Touch["y"] - Building.oldy
		end
		if Building.y > Building.default then
			Building.y = Building.default
		end
		if Building.y < Building.default - (#Building - 1) * 144 then
			Building.y = Building.default - (#Building - 1) * 144
		end
		else
		Building.oldy = nil
	end
end
function Building.update()
	for i = 1, #Button do
		if Button[Button[i].."id"] > 1 and Button[Button[i].."count"] > 0 and Button[Button[i].."A"] == 0 then
			Building[#Building + 1] = Button[i]
			Button[Button[i].."A"] = 1
		end
	end
end
function Button.make(name, fprice, id, cps)
	Button[name.."id"] = id
	Button[name.."fprice"] = fprice
	Button[name.."price"] = fprice
	Button[name.."count"] = 0
	Button[name.."cps"] = cps
	Button[name.."A"] = 0
	Button[#Button+1] = name
end
function Button.show()
	Graphics.drawScaleImage(Button.x, 0, Texture["shadedBorders"],300/256,544/256)
	for i = 1, Button.quantity do
		if Button.y + 64 * i > Button.default and Button.y+64*(i - 1) < 544  then
			if (Cookie.count > Button[Button[i].."price"] and Panel.state == "Buy") or (Button[Button[i].."price"] ~= 0 and Panel.state == "Sell") then
				Graphics.drawImage(Button.x, Button.y + 64 * (i - 1), Texture["storetile"])
				Graphics.drawPartialImage(Button.x, Button.y + 64 * (i - 1), Texture["buildings"], 0, 64 * (Button[Button[i].."id"] - 1), 64, 64)
				gpu_drawtext(Button.x + 64, 10 + Button.y + 64 * (i - 1), Button[i], white)
				gpu_drawtext(Button.x + 80, 30 + Button.y + 64 * (i - 1), NumberMod(math.ceil(Button[Button[i].."price"])), green)
				gpu_drawtext(Button.x + 256, 20 + Button.y + 64 * (i - 1), Button[Button[i].."count"], trans100white)
				Graphics.drawImage(Button.x + 64, 32 + Button.y + 64 * (i - 1), Texture["favicon"])
				if Panel.state == "Sell" then
					Graphics.drawImage(Button.x, Button.y + 64 * (i - 1), Texture["tile"], red)
				end
				if Button.now == i and Button.tmp > 0 then
					Graphics.drawImage(Button.x, Button.y + 64 * (i - 1), Texture["pressedtile"])
				end
				else
				Graphics.drawImage(Button.x, Button.y+64*(i - 1), Texture["storetile"], transwhite)
				if Cookie.total >= Button[Button[i].."fprice"] then
					Graphics.drawPartialImage(Button.x, Button.y + 64 * (i - 1), Texture["buildings"], 0, 64 * (Button[Button[i].."id"] - 1), 64, 64, transwhite)
					gpu_drawtext(Button.x + 64, 10 + Button.y + 64 * (i - 1), Button[i], transwhite)
					gpu_drawtext(Button.x + 80, 30 + Button.y + 64 * (i - 1), NumberMod(math.ceil(Button[Button[i].."price"])), trans150red)
					gpu_drawtext(Button.x + 256, 20 + Button.y + 64 * (i - 1), Button[Button[i].."count"], trans100white)
					Graphics.drawImage(Button.x + 64, 32 + Button.y + 64 * (i - 1), Texture["favicon"])
					if Panel.state == "Sell" then
						Graphics.drawImage(Button.x, Button.y + 64 * (i - 1), Texture["tile"], transred)
					end
					else
					Graphics.drawPartialImage(Button.x, Button.y + 64 * (i - 1), Texture["buildings"], 64, 64 * (Button[Button[i].."id"] - 1), 64, 64, transwhite)
					gpu_drawtext(Button.x + 64, 10 + Button.y + 64 * (i - 1), "###", transwhite)
					gpu_drawtext(Button.x + 80, 30 + Button.y + 64 * (i - 1), NumberMod(math.ceil(Button[Button[i].."price"])), trans150red)
					gpu_drawtext(Button.x + 256, 20 + Button.y + 64 * (i - 1), Button[Button[i].."count"], trans100white)
					Graphics.drawImage(Button.x + 64, 32 + Button.y + 64 * (i - 1), Texture["favicon"])
					if Panel.state == "Sell" then
						Graphics.drawImage(Button.x, Button.y + 64 * (i - 1), Texture["tile"], transred)
					end
				end
			end
		end
	end
	Graphics.drawScaleImage(Button.x, Button.y + 64 * Button.quantity, Texture["shadedBorders"],300/256,544/256)
end
function Button.touch()
	for i = 1, Button.quantity do
		if Touch["Now"] == "N" and Button.tmp > 0 and Button.now == i and ((Button[Button[i].."price"] <= Cookie.count and Panel.state == "Buy") or (Button[Button[i].."price"] ~= 0 and Panel.state == "Sell")) then
			if Panel.state == "Buy" then
				Button[Button[i].."count"] = Button[Button[i].."count"] + Panel.kolvo
				Button[Button[i].."total"] = Button[Button[i].."total"] + Panel.kolvo
				Cookie.count = Cookie.count - Button[Button[i].."price"]
			elseif Panel.state == "Sell" then
				if Button[Button[i].."count"] >= Panel.kolvo then
					Button[Button[i].."count"] = Button[Button[i].."count"] - Panel.kolvo
					else
					Button[Button[i].."count"] = Button[Button[i].."count"] - Button[Button[i].."count"]
				end
				Cookie.count = Cookie.count + Button[Button[i].."price"]
				Cookie.total = Cookie.total + Button[Button[i].."price"]
			end
			Building.update()
			Button.update()
			CookiePerSecond.update()
			Price.update()
			Upgrade.update()
		end
	end
	if Touch["x"] ~= nil and Touch["x"] > Button.x and Touch["y"] > Button.default and Touch["y"] < Button.y + 64 * Button.quantity and Touch["Now"] == "N" then
		Button.oldy = Button.oldy or Touch["y"] - Button.y
		Touch["Now"] = "Buttons"
	end	
	if Touch["Now"] == "Buttons" and Touch["x"]~=nil then
		if Button.y < Button.default then
			Button.y = Touch["y"] - Button.oldy
			elseif Button.y > Button.default - (Button.quantity - 1) * 64 then
			Button.y = Touch["y"] - Button.oldy
		end
		if Button.y > Button.default then
			Button.y = Button.default
		end
		if Button.y < Button.default - (Button.quantity - 1) * 64 then
			Button.y = Button.default - (Button.quantity - 1) * 64
		end
		for i = 1, Button.quantity do
			if Touch["y"] > Button.y+64*(i-1) and Touch["y"] < Button.y+64*i then
				Button.now = i
			end		
		end
		if Button.tmp == 0 then
			Button.tmp = Touch["y"]
		end
		if Touch["y"] > Button.tmp + 10 or Touch["y"] < Button.tmp - 10 then
			Button.tmp = -1
		end
		else
		Button.oldy = nil
		Button.now = 0
	end
end
function Button.update()
	Button.quantity = 2
	for i = 3, #Button do
		if Cookie.total >= Button[Button[i - 2].."fprice"] then
			Button.quantity = Button.quantity + 1
		end
	end
	for i = 1, #Building do
		if Building[i] ~= nil and Button[Building[i].."count"] == 0 and Button[Building[i].."id"] > 1 and Button[Building[i].."A"] == 1 then
			Button[Building[i].."A"] = 0
			table.remove(Building,i)
		end
	end
end
function CookiePerSecond.update()
	CpS = 0
	for i = 1, Button.quantity do
		if Upgrade[Button[i].."Quan"]~=nil then
			CpS = CpS + Button[Button[i].."count"] * Button[Button[i].."cps"] * Upgrade[Button[i].."Quan"]
		else
			CpS = CpS + Button[Button[i].."count"] * Button[Button[i].."cps"]
		end
	end
end
function Cookie.show()
	if SpdOf.tmp == 1 then
		Shine.rot = Shine.rot + Shine.speed     
	end
	if Shine.rot > 2 * pi then Shine.rot = Shine.rot - 2 * pi end
	Graphics.drawRotateImage(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["shine"], Shine.rot)
	Graphics.drawRotateImage(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["shine"], - Shine.rot)
	Graphics.drawImageExtended(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["cookie"], 0, 0, 256, 256, 0, 1+Cookie.formula,1+Cookie.formula)
end
function Cookie.touch()
	if Touch["x"]~=nil and Touch["Now"]=="N" and Touch["x"]>CENTER_OF_COOKIE_X-128 and Touch["x"]<CENTER_OF_COOKIE_X+128 and Touch["y"]>CENTER_OF_COOKIE_Y-128 and Touch["y"]<CENTER_OF_COOKIE_Y+128 then
		Touch["Now"] = "Cookie"
		Cookie.tmp = 1
		Cookie.count = Cookie.count + 1 * Upgrade["CursorQuan"]
		Cookie.total = Cookie.total + 1 * Upgrade["CursorQuan"]
	end
	if SpdOf.tmp==1 then
		if Cookie.tmp==1 then
			if Cookie.size<2 then
				Cookie.size=Cookie.size+Cookie.speed
				else
				Cookie.size=2
				Cookie.tmp=0
			end
		end
		if Cookie.tmp==0 then
			if Cookie.size>0 then
				Cookie.size=Cookie.size-Cookie.speed
				else
				Cookie.size=0
			end
		end
	end
end
function NumberMod(num)
	num=tonumber(num)
	if num<1e+14 then
		if string.len(num)>6 then
			return (math.floor(math.floor(num)/1000^(math.floor((1/3)*string.len(math.floor(num))-0.1)-1))/1000).." "..NAMEOMBTQ[math.floor((1/3)*string.len(math.floor(num))-0.1)-1]
			else
			return num
		end
		else
		local e = tonumber(string.sub(num,string.len(num)-1,string.len(num)))
		num = tonumber(string.sub(num,1,string.len(num)-5))
		local r = math.floor(e / 3) * 3
		local c = e - r
		num = num * 10^c
		num = tonumber(string.sub(num, 1, c + 5))
		return (num.." "..NAMEOMBTQ[(r / 3) - 1])
	end
end
function Panel.show()
	Graphics.drawImage(Button.x, Button.default - 54, Texture["darkNoise"])
	if Panel.state == "Buy" then
		Graphics.debugPrint(Button.x + 10, Button.default - 48, "Buy", white)
		Graphics.debugPrint(Button.x + 10, Button.default - 28, "Sell", gray)
		elseif Panel.state == "Sell" then
		Graphics.debugPrint(Button.x + 10, Button.default - 48, "Buy", gray)
		Graphics.debugPrint(Button.x + 10, Button.default - 28, "Sell", white)
	end
	if Panel.kolvo == 1 then
		Graphics.debugPrint(Button.x + 80, Button.default - 36, "1", white)
		Graphics.debugPrint(Button.x + 140, Button.default - 36, "10", gray)
		Graphics.debugPrint(Button.x + 220, Button.default - 36, "100", gray)
		elseif Panel.kolvo == 10 then
		Graphics.debugPrint(Button.x + 80, Button.default - 36, "1", gray)
		Graphics.debugPrint(Button.x + 140, Button.default - 36, "10", white)
		Graphics.debugPrint(Button.x + 220, Button.default - 36, "100", gray)
		elseif Panel.kolvo == 100 then
		Graphics.debugPrint(Button.x + 80, Button.default - 36, "1", gray)
		Graphics.debugPrint(Button.x + 140, Button.default - 36, "10", gray)
		Graphics.debugPrint(Button.x + 220, Button.default - 36, "100", white)
	end
	Graphics.drawImage(Button.x, Button.default - 64, Texture["panelhorizontal"])
	Graphics.drawImage(Button.x, Button.default - 64, Texture["panelGradientLeft"])
	Graphics.drawImage(960-64, Button.default - 64, Texture["panelGradientRight"])
end
function Panel.touch()
	if Touch["y"] ~= nil then
		if Touch["Now"] == "N" and Touch["y"] > Button.default - 42 and Touch["y"] < Button.default and Touch["x"] > Button.x and Touch["x"] < Button.x + 60 and Panel.tmp == 0 then
			Panel.tmp = 1
			if Panel.state == "Buy" then Panel.state = "Sell" else Panel.state = "Buy" end
			Price.update()
		end
		if Touch["Now"] == "N" and Touch["y"] > Button.default - 42 and Touch["y"] < Button.default and Touch["x"] > Button.x + 60 and Touch["x"] < Button.x + 120 and Panel.tmp == 0 then
			Panel.tmp = 1
			Panel.kolvo = 1
			Price.update()
		end
		if Touch["Now"] == "N" and Touch["y"] > Button.default - 42 and Touch["y"] < Button.default and Touch["x"] > Button.x + 120 and Touch["x"] < Button.x + 200 and Panel.tmp == 0 then
			Panel.tmp = 1
			Panel.kolvo = 10
			Price.update()
		end
		if Touch["Now"] == "N" and Touch["y"] > Button.default - 42 and Touch["y"] < Button.default and Touch["x"] > Button.x + 200 and Touch["x"] < Button.x + 270 and Panel.tmp == 0 then
			Panel.tmp = 1
			Panel.kolvo = 100
			Price.update()
		end
	end
end
function Price.update()
	if Panel.state == "Buy" then
		if Panel.kolvo==1 then
			for i=1,#Button do
				Button[Button[i].."price"]=Button[Button[i].."fprice"]*1.15^Button[Button[i].."count"]
			end
			elseif Panel.kolvo>=10 then
			for i=1,#Button do
				Button[Button[i].."price"]=Button[Button[i].."fprice"]*(1.15^(Button[Button[i].."count"]+Panel.kolvo)-1.15^(Button[Button[i].."count"]))/0.15
			end
		end
		else
		if Panel.kolvo==1 then
			for i=1,#Button do
				if Button[Button[i].."count"]>0 then
					Button[Button[i].."price"] = math.ceil(Button[Button[i].."fprice"]*1.15^(Button[Button[i].."count"]-1)/2)
					else
					Button[Button[i].."price"] = 0
				end
			end
			elseif Panel.kolvo >= 10 then
			for i=1,#Button do
				if Button[Button[i].."count"]>=Panel.kolvo then
					Button[Button[i].."price"]=math.ceil(math.abs(Button[Button[i].."fprice"]*(1.15^(Button[Button[i].."count"]-Panel.kolvo)-1.15^(Button[Button[i].."count"]))/0.15)/2)
					elseif Button[Button[i].."count"]<Panel.kolvo and Button[Button[i].."count"]>0 then
					Button[Button[i].."price"]=math.ceil(Button[Button[i].."fprice"]*(1.15^(Button[Button[i].."count"])-1.15^(0))/0.15/2)
					elseif Button[Button[i].."count"]==0 then
					Button[Button[i].."price"] = 0
				end
			end
		end
		
	end
end
function ScreenButton(xbut,ybut,texture,name)
	ScreenB[name]=ScreenB[name] or "NO"
	if (Touch["x"]==nil and Touch["y"]==nil) and ScreenB[name] == "YES" then 
		menu = name
		ScreenB[name]="NO"
	end
	if (Touch["x"]~=nil and Touch["y"]~=nil)  then
		if (Touch["x"] >=xbut and Touch["y"]>=ybut and Touch["x"]<=xbut+Graphics.getImageWidth(texture) and Touch["y"]<=ybut+(Graphics.getImageHeight(texture)/2) and Touch["Now"]=="N") then
			ScreenB[name]="YES"
			Touch["NowButtons"] = 1
			else
			ScreenB[name]="NO"
		end
	end
	if ScreenB[name]=="NO" then
		Graphics.drawPartialImage(xbut, ybut,texture, 0, 0, Graphics.getImageWidth(texture), (Graphics.getImageHeight(texture)/2))
		elseif ScreenB[name]=="YES" then
		Graphics.drawPartialImage(xbut, ybut,texture, 0, (Graphics.getImageHeight(texture)/2), Graphics.getImageWidth(texture), (Graphics.getImageHeight(texture)/2))
	end
end
function SpdOf.init()
	if Timer.getTime(SpdOf.timer)>1000/SpdOf.framerate then
		SpdOf.tmp = 1
		Timer.reset(SpdOf.timer)
	end
end
function SpdOf.term()
	SpdOf.tmp = 0
end
function Texture.GarbadgeCollection()
	for i = 1, #Texture do
		Graphics.freeImage(Texture[Texture[i]])
	end
end
function Texture.load(name, place)
	Texture[name] = Graphics.loadImage(MODE.."assets/"..place)
	Texture[#Texture + 1] = name
end
function Upgrade.show()
	Graphics.drawPartialImage(660,Upgrade.default-140+16,Texture["darkback"],660,Upgrade.default-140+16,300, Button.default-64 - Upgrade.default+140-16)
	for i=1,#Upgrade.Now do
		if i <= 5 and Upgrade.mode == 1 then
			Graphics.drawPartialImage(660 + 6 * i + 48 * (i - 1) + 6 * (i - 1),Upgrade.default - 124 + 6, Texture["icons"], (Upgrade[Upgrade.Now[i].."column"]-1)*48,(Upgrade[Upgrade.Now[i].."row"]-1)*48,48,48)	
			
			if Upgrade[Upgrade.Now[i].."price"] <= Cookie.count then
				Graphics.drawPartialImage(660+60*(i-1),Upgrade.default - 124,Texture["upgradeFrame"],0,0,60,60)
				else
				Graphics.drawPartialImage(660+60*(i-1),Upgrade.default - 124,Texture["upgradeFrame"],60,0,60,60)
			end
			elseif Upgrade.mode==2 then
			Graphics.drawPartialImage(660 + 6 * i + 48 * (i - 1) + 6 * (i - 1) - 300*(math.floor((i-0.1)/5)),Upgrade.default - 124 + 6+60*(math.floor((i-0.1)/5)) , Texture["icons"], (Upgrade[Upgrade.Now[i].."column"]-1)*48,(Upgrade[Upgrade.Now[i].."row"]-1)*48,48,48)	
			
			if Upgrade[Upgrade.Now[i].."price"] <= Cookie.count then
			Graphics.drawPartialImage(660+60*(i-1)- 300*(math.floor((i-0.1)/5)),Upgrade.default - 124 + 60 * (math.floor((i-0.1)/5)) ,Texture["upgradeFrame"],0,0,60,60)
				else
			Graphics.drawPartialImage(660+60*(i-1)- 300*(math.floor((i-0.1)/5)),Upgrade.default - 124 + 60 *(math.floor((i-0.1)/5)) ,Texture["upgradeFrame"],60,0,60,60)
			end
		end
	end
	Graphics.drawImage(Button.x, Upgrade.default - 140, Texture["panelhorizontal"])
	Graphics.drawImage(Button.x, Upgrade.default - 140, Texture["panelGradientLeft"])
	Graphics.drawImage(960-64, Upgrade.default - 140, Texture["panelGradientRight"])
end
function Upgrade.touch()
	for i = 1, #Upgrade.Now do
		if i <= 5 and Upgrade.mode == 1 then
			if Touch["x"] ~= nil and Touch["Now"]=="N" and Touch["NowButtons"]~=1 and Touch["x"] > Button.x + 60 * (i - 1) and Touch["x"] <= Button.x + 60 * i and Touch["y"] > Upgrade.default - 124 and Touch["y"] < Upgrade.default - 64 and Upgrade.tmp == 0 and Upgrade[Upgrade.Now[i].."price"] <= Cookie.count then
				Cookie.count = Cookie.count - Upgrade[Upgrade.Now[i].."price"]
				Upgrade.tmp = 1
				Upgrade[Upgrade.Now[i].."a"] = 2
				Upgrade.update()
				Upgrade.cps()
				CookiePerSecond.update()
			end
			elseif Upgrade.mode==2 then
			if Touch["x"] ~= nil and Touch["Now"]=="N" and Touch["NowButtons"]~=1 and Touch["x"] > Button.x + 60 * (i - 1)-300*(math.floor((i-0.1)/5)) and Touch["x"] <= Button.x + 60 * i-300*(math.floor((i-0.1)/5)) and Touch["y"] > Upgrade.default - 124+60*(math.floor((i+0.1)/5)-1) and Touch["y"] < Upgrade.default - 64+60*(math.floor((i+0.1)/5)) and Upgrade.tmp == 0 and Upgrade[Upgrade.Now[i].."price"] <= Cookie.count then
				Cookie.count = Cookie.count - Upgrade[Upgrade.Now[i].."price"]
				Upgrade.tmp = 1
				Upgrade[Upgrade.Now[i].."a"] = 2
				Upgrade.update()
				Upgrade.cps()
				CookiePerSecond.update()
			end
		end
	end
end
function Upgrade.make(name, id, count, price, column, row)
	Upgrade[name..id.."id"] = id
	Upgrade[name..id.."name"] = name
	Upgrade[name..id.."count"] = count
	Upgrade[name..id.."price"] = price
	Upgrade[name..id.."column"] = column
	Upgrade[name..id.."row"] = row
	Upgrade[name..id.."a"] = 0
	Upgrade[name.."Quan"] = 1
	Upgrade[#Upgrade + 1] = name..id
end
function Upgrade.update()
	for i = 1, #Upgrade do
		if Upgrade[Upgrade[i].."a"] == 1 then
			Upgrade[Upgrade[i].."a"] = 0
		end
	end
	for i = 1, #Upgrade.Now do
		table.remove(Upgrade.Now,1)
	end
	for i = 1, #Upgrade do
		if Upgrade[Upgrade[i].."count"] <= Button[Upgrade[Upgrade[i].."name"].."total"] and Upgrade[Upgrade[i].."a"] == 0 then
			Upgrade[Upgrade[i].."a"] = 1
		end
		if Upgrade[Upgrade[i].."a"] == 1 then
			Upgrade.Now[#Upgrade.Now+1] = Upgrade[i]
		end
	end
end
function Upgrade.cps()
	for i = 1, #Upgrade do
		Upgrade[Upgrade[Upgrade[i].."name"].."Quan"] = 1
	end
	for i = 1, #Upgrade do
		if Upgrade[Upgrade[i].."a"]==2 then
			Upgrade[Upgrade[Upgrade[i].."name"].."Quan"] = Upgrade[Upgrade[Upgrade[i].."name"].."Quan"]*2
		end
	end
end
function Game.save()
	savefile = System.openFile("ux0:/data/ccsave.sav",FCREATE)
	savestring = Cookie.count.."#"..Cookie.total.."#"..Button["Cursorcount"].."#"..Button["Grandmacount"].."#"..Button["Farmcount"].."#"..Button["Minecount"].."#"..Button["Factorycount"].."#"..Button["Bankcount"].."#"..Button["Templecount"].."#"..Button["WizardTowercount"].."#"..Button["Shipmentcount"].."#"..Button["AlchemyLabcount"].."#"..Button["Portalcount"].."#"..Button["TimeMachinecount"].."#"..Button["AntimatterCondensercount"].."#"..Button["Prismcount"].."#"
	savestring = crypt(savestring,enc1)
	savestringlen = string.len(savestring)
	System.writeFile(savefile,savestring,savestringlen)
	System.closeFile(savefile)
	
	savefile = System.openFile("ux0:/data/ccupsave.sav",FCREATE)
	
	savestring = Upgrade["Cursor1a"].."#"..Upgrade["Cursor2a"].."#"..Upgrade["Cursor3a"].."#"..Upgrade["Cursor4a"]
	savestring = savestring.."#"..Upgrade["Grandma1a"].."#"..Upgrade["Grandma2a"].."#"..Upgrade["Grandma3a"].."#"..Upgrade["Grandma4a"]
	savestring = savestring.."#"..Upgrade["Farm1a"].."#"..Upgrade["Farm2a"].."#"..Upgrade["Farm3a"].."#"..Upgrade["Farm4a"]
	savestring = savestring.."#"..Upgrade["Mine1a"].."#"..Upgrade["Mine2a"].."#"..Upgrade["Mine3a"].."#"..Upgrade["Mine4a"]
	savestring = savestring.."#"..Upgrade["Factory1a"].."#"..Upgrade["Factory2a"].."#"..Upgrade["Factory3a"].."#"..Upgrade["Factory4a"]
	savestring = savestring.."#"..Upgrade["Bank1a"].."#"..Upgrade["Bank2a"].."#"..Upgrade["Bank3a"].."#"..Upgrade["Bank4a"]
	savestring = savestring.."#"..Upgrade["Temple1a"].."#"..Upgrade["Temple2a"].."#"..Upgrade["Temple3a"].."#"..Upgrade["Temple4a"]
	savestring = crypt(savestring,enc1)
	savestringlen = string.len(savestring)
	System.writeFile(savefile,savestring,savestringlen)
	System.closeFile(savefile)
	
end
function Game.continue()
	if System.doesFileExist("ux0:/data/ccsave.sav") then
		savefile = System.openFile("ux0:/data/ccsave.sav", FREAD)
		size = System.sizeFile(savefile)
		file = System.readFile(savefile, size)
		file = crypt(file,enc1,true)
		System.closeFile(savefile)
		savearray = Game.explode("#",file,size)
		Cookie.count = tonumber(savearray[1]) or 0
		Cookie.total = tonumber(savearray[2]) or 0
		Button["Cursorcount"] = tonumber(savearray[3]) or 0
		Button["Grandmacount"] = tonumber(savearray[4]) or 0
		Button["Farmcount"] = tonumber(savearray[5]) or 0
		Button["Minecount"] = tonumber(savearray[6]) or 0
		Button["Factorycount"] = tonumber(savearray[7]) or 0
		Button["Bankcount"] = tonumber(savearray[8]) or 0
		Button["Templecount"] = tonumber(savearray[9]) or 0
		Button["WizardTowercount"] = tonumber(savearray[10]) or 0
		Button["Shipmentcount"] = tonumber(savearray[11]) or 0
		Button["AlchemyLabcount"] = tonumber(savearray[12]) or 0
		Button["Portalcount"] = tonumber(savearray[13]) or 0
		Button["TimeMachinecount"] = tonumber(savearray[14]) or 0
		Button["AntimatterCondensercount"] = tonumber(savearray[15]) or 0
		Button["Prismcount"] = tonumber(savearray[16]) or 0
	end
	if System.doesFileExist("ux0:/data/ccupsave.sav") then
		savefile = System.openFile("ux0:/data/ccupsave.sav", FREAD)
		size = System.sizeFile(savefile)
		file = System.readFile(savefile, size)
		file = crypt(file,enc1,true)
		System.closeFile(savefile)
		savearray = Game.explode("#",file,size)
		
		Upgrade["Cursor1a"] = tonumber(savearray[1]) or 0
		Upgrade["Cursor2a"] = tonumber(savearray[2]) or 0
		Upgrade["Cursor3a"] = tonumber(savearray[3]) or 0
		Upgrade["Cursor4a"] = tonumber(savearray[4]) or 0
		
		Upgrade["Grandma1a"] = tonumber(savearray[5]) or 0
		Upgrade["Grandma2a"] = tonumber(savearray[6]) or 0
		Upgrade["Grandma3a"] = tonumber(savearray[7]) or 0
		Upgrade["Grandma4a"] = tonumber(savearray[8]) or 0
		
		Upgrade["Farm1a"] = tonumber(savearray[9]) or 0
		Upgrade["Farm2a"] = tonumber(savearray[10]) or 0
		Upgrade["Farm3a"] = tonumber(savearray[11]) or 0
		Upgrade["Farm4a"] = tonumber(savearray[12]) or 0
		
		Upgrade["Mine1a"] = tonumber(savearray[13]) or 0
		Upgrade["Mine2a"] = tonumber(savearray[14]) or 0
		Upgrade["Mine3a"] = tonumber(savearray[15]) or 0
		Upgrade["Mine4a"] = tonumber(savearray[16]) or 0
		
		Upgrade["Factory1a"] = tonumber(savearray[17]) or 0
		Upgrade["Factory2a"] = tonumber(savearray[18]) or 0
		Upgrade["Factory3a"] = tonumber(savearray[19]) or 0
		Upgrade["Factory4a"] = tonumber(savearray[20]) or 0
		
		Upgrade["Bank1a"] = tonumber(savearray[21]) or 0
		Upgrade["Bank2a"] = tonumber(savearray[22]) or 0
		Upgrade["Bank3a"] = tonumber(savearray[23]) or 0
		Upgrade["Bank4a"] = tonumber(savearray[24]) or 0
		
		Upgrade["Temple1a"] = tonumber(savearray[25]) or 0
		Upgrade["Temple2a"] = tonumber(savearray[26]) or 0
		Upgrade["Temple3a"] = tonumber(savearray[27]) or 0
		Upgrade["Temple4a"] = tonumber(savearray[28]) or 0
	end
end
function Game.delsave()
	System.deleteFile("ux0:/data/ccsave.sav")
	System.deleteFile("ux0:/data/ccupsave.sav")
end
function Game.explode(div,str)
	pos = 0
	arr = {}
	for st,sp in function() return string.find(str,div,pos,true) end do
		table.insert(arr,string.sub(str,pos,st-1))
		pos = sp + 1
	end
	table.insert(arr,string.sub(str,pos))
	return arr
end
function Cursor.show()
	if SpdOf.tmp==1 then
		Cursor.rot = Cursor.rot+Cursor.speed
	end
	if Cursor.rot>2*pi then
		Cursor.rot = Cursor.rot-2*pi
	end
	if Button["Cursorcount"] <= Cursor.max then
		for i=1, Button["Cursorcount"] do
			Graphics.drawRotateImage(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["cursor"],Cursor.rot+(pi/(Cursor.max/2)*i))
		end
		else
		for i=1, Cursor.max do
			Graphics.drawRotateImage(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["cursor"],Cursor.rot+(pi/(Cursor.max/2)*i))
		end
	end
end
function drawPanel(x,y,width,height)
	Graphics.drawPartialImage(x + 1, y + 1, Texture["darkNoise"], 0,0,width-2,height-2)
	Graphics.drawPartialImage(x , y, Texture["frameBorder"], 0, 0, 3, 3)
	Graphics.drawPartialImage(x , y + height - 3,Texture["frameBorder"], 0, 497, 3, 3)
	Graphics.drawPartialImage(x + width - 3, y, Texture["frameBorder"], 497, 0, 3, 3)
	Graphics.drawPartialImage(x + width - 3, y + height - 3,Texture["frameBorder"], 497, 497, 3,3)
	Graphics.drawPartialImage(x + 3, y,Texture["frameBorder"], 3, 0, width - 6, 3)
	Graphics.drawPartialImage(x, y + 3,Texture["frameBorder"], 0, 3, 3, height - 6)
	Graphics.drawPartialImage(x + width - 3, y + 3,Texture["frameBorder"], 497, 3, 3, height - 6)
	Graphics.drawPartialImage(x + 3, y + height - 3,Texture["frameBorder"], 3, 497, width - 6, 3)
end
function Milk.show()
	Graphics.drawImage(Milk.x,Milk.y,Texture["milk"])
	Graphics.drawImage(Milk.x-480,Milk.y,Texture["milk"])
	if Milk.x >= 480 then
		Milk.x=Milk.x-480
	end
	if SpdOf.tmp==1 then
		Milk.x=Milk.x + Milk.speed 
	end
end
function Stick.move()
	Stick.left.y=Stick.left.y-128
	if math.abs(Stick.left.y) > 15 and Building.y >= Building.default-(#Building-1)*144 and Building.y <= Building.default then
		Building.y = Building.y - Stick.left.y/25
	end
	if Building.y > Building.default then
		Building.y = Building.default
		elseif Building.y < Building.default-(#Building-1)*144 then
		Building.y = Building.default-(#Building-1)*144
	end
	Stick.right.y=Stick.right.y-128
	if math.abs(Stick.right.y) > 15 and Button.y >= Button.default-(Button.quantity-1)*64 and Button.y <= Button.default then
		Button.y = Button.y - Stick.right.y/25
	end
	if Button.y > Button.default then
		Button.y = Button.default
		elseif Button.y < Button.default-(Button.quantity-1)*64 then
		Button.y = Button.default-(Button.quantity-1)*64
	end
end
function Cookie.shower.show()
	if SpdOf.tmp==1 then
		Cookie.shower.y = Cookie.shower.y + Cookie.shower.speed
	end
	local name = 0
	if CpS>=200 and CpS<500 then
		name = 1
	elseif CpS>=500 and CpS<1000 then
		name = 2
	elseif CpS>=1000 then
		name = 3
	end
	if Cookie.shower.y >= 544 then
		Cookie.shower.y = Cookie.shower.y - 544
	end
	if name>0 then
		Graphics.drawImage(0,Cookie.shower.y,Texture["cookieShower"..name])
		Graphics.drawImage(0,Cookie.shower.y-544,Texture["cookieShower"..name])
	end
end
Texture.load("background", "background.png")
Texture.load("cookie", "cookie.png")
Texture.load("cursor", "cursor.png")
Texture.load("shine", "shine.png")
Texture.load("favicon", "favicon.png")
Texture.load("darkNoise", "DarkNoise.png")
Texture.load("buildings", "buildings.png")
Texture.load("storetile", "storeTile.jpg")
Texture.load("tile", "Tile.png")
Texture.load("pressedtile", "pressedTile.png")
Texture.load("panelvertical", "panelVertical.png")
Texture.load("panelhorizontal", "panelHorizontal.png")
Texture.load("panelGradientBottom", "panelGradientBottom.png")
Texture.load("panelGradientLeft", "panelGradientLeft.png")
Texture.load("panelGradientRight", "panelGradientRight.png")
Texture.load("panelGradientTop", "panelGradientTop.png")
Texture.load("shadedBorders", "shadedBorders.png")
Texture.load("buttonUR", "buttonUR.png")
Texture.load("buttonUL", "buttonUL.png")
Texture.load("buttonDR", "buttonDR.png")
Texture.load("buttonDL", "buttonDL.png")
Texture.load("BLDBacks","BLDBacks.png")
Texture.load("BLDIcons","BLDIcons.png")
Texture.load("icons","icons.png")
Texture.load("milk","milk.png")
Texture.load("frameBorder","frameBorder.png")
Texture.load("pressSquare1","pressSquare1.png")
Texture.load("pressSquare2","pressSquare2.png")
Texture.load("upgradeFrame","upgradeFrame.png")
Texture.load("cookieShower1","cookieShower1.png")
Texture.load("cookieShower2","cookieShower2.png")
Texture.load("cookieShower3","cookieShower3.png")
Texture.load("darkback","darkback.png")
Texture.load("reset","reset.png")
Button.make("Cursor", 15, 1, 0.1)
Button.make("Grandma", 100, 2, 1)
Button.make("Farm", 1000, 4, 8)
Button.make("Mine", 12000, 5, 47)
Button.make("Factory", 130000, 6, 260)
Button.make("Bank", 1400000, 7, 1400)
Button.make("Temple", 20000000, 8, 7800)
Button.make("WizardTower", 330000000, 9, 44000)
Button.make("Shipment", 5100000000, 10, 260000)
Button.make("AlchemyLab", 75000000000, 11, 1600000)
Button.make("Portal", 1000000000000, 12, 10000000)
Button.make("TimeMachine", 14000000000000, 13, 65000000)
Button.make("AntimatterCondenser", 170000000000000, 14, 430000000)
Button.make("Prism", 2100000000000000, 15, 2900000000)
--------------[NAME]----ID---Q------[MONEY]-------C---R-
Upgrade.make("Cursor",  1,   1,    100,           1,  1)
Upgrade.make("Cursor",  2,   1,    500,           1,  2)
Upgrade.make("Grandma", 1,   1,    1000,          2,  1)
Upgrade.make("Grandma", 2,   5,    5000,          2,  2)
Upgrade.make("Cursor",  3,  10,    10000,         1,  3)
Upgrade.make("Farm",    1,   1,    11000,         3,  1)
Upgrade.make("Grandma", 3,  25,    50000,         2,  3)
Upgrade.make("Farm",    2,   5,    55000,         3,  2)
Upgrade.make("Cursor",  4,  25,    100000,        1, 14)
Upgrade.make("Mine",    1,   1,    120000,        4,  1)
Upgrade.make("Farm",    3,  25,    550000,        3,  3)
Upgrade.make("Mine",    2,   5,    600000,        4,  2)
Upgrade.make("Factory", 1,   1,    1300000,       5,  1)
Upgrade.make("Grandma", 4,  50,    5000000,       2, 14)
Upgrade.make("Mine",    3,  25,    6000000,       4,  3)
Upgrade.make("Factory", 2,   5,    6500000,       5,  2)
Upgrade.make("Bank",    1,   1,    14000000,      6,  1)
Upgrade.make("Farm",    4,  50,    55000000,      3, 14)
Upgrade.make("Factory", 3,  25,    65000000,      5,  3)
Upgrade.make("Bank",    2,   5,    70000000,      6,  2)
Upgrade.make("Temple",  1,   1,    200000000,     7,  1)
Upgrade.make("Mine",    4,  50,    600000000,     4, 14)
Upgrade.make("Bank",    3,  25,    700000000,     6,  3)
Upgrade.make("Temple",  2,   5,    1000000000,    7,  2)
Upgrade.make("Factory", 4,  50,    6500000000,    5, 14)
Upgrade.make("Temple",  3,  25,    10000000000,   7,  3)
Upgrade.make("Bank",    4,  50,    70000000000,   6, 14)
Upgrade.make("Temple",  4,  50,    1000000000000, 7, 14)
--------------------------------------------------------

--[[Upgrade.make("Temple", 1, 1, 200000000, 7, 1)
Upgrade.make("Temple", 2, 5, 1000000000, 7, 2)
Upgrade.make("Temple", 3, 25, 10000000000, 7, 3)
Upgrade.make("Temple", 4, 50, 1000000000000, 7, 14)]]

--Button.make("Chancemaker",26000000000000000,16,21000000000) Need in asset update
CookiePerSecond.timer = Timer.new()
SecTimer = Timer.new()
SpdOf.timer = Timer.new()
SaveTimer = Timer.new()
--//--//--//--//--//--//--
CookiePerSecond.update()
Building.update()
--//--//--//--//--//--//--
Game.continue()
Building.update()
Button.update()
CookiePerSecond.update()
Price.update()
for i = 1, #Button do
	Button[Button[i].."total"] = Button[Button[i].."count"]
end
Upgrade.update()
Upgrade.cps()
CookiePerSecond.update()
while true do
	SpdOf.init()
	pad = Controls.read()
	Touch["x"], Touch["y"] = Controls.readTouch()
	Stick.left.x, Stick.left.y = Controls.readLeftAnalog()
	Stick.right.x, Stick.right.y = Controls.readRightAnalog()
	Stick.move()
	if Touch["x"]==nil or Touch["y"]==nil then
		Touch["Now"] = "N"
		Touch["NowButtons"] = 0
	end
	Button.touch()
	Panel.touch()
	if Game.state ~= "Options" then
		Building.touch()
	end
	Upgrade.touch()
	Cookie.touch()
	Cookie.formula = (Cookie.size*math.sin(4*Cookie.size)/8)
	if Timer.getTime(CookiePerSecond.timer)/40>=1 then
		Cookie.count = Cookie.count+CpS/25
		Cookie.total = Cookie.total+CpS/25
		Timer.reset(CookiePerSecond.timer)
	end
	if Timer.getTime(SecTimer)/1000>=1 then
		Button.update()
		Timer.reset(SecTimer)
	end
	Graphics.initBlend()
	Screen.clear()
	Graphics.drawImage(0,0,Texture["background"])
	Cookie.shower.show()
	Milk.show()
	Graphics.drawPartialImage(644,0,Texture["background"], 644, 0, 960 - 644, 544)
	Graphics.drawScaleImage(0, 0, Texture["shadedBorders"], 296 / 256, 544 / 256)
	Cookie.show()
	Cursor.show()
	Graphics.drawPartialImage(296,0,Texture["background"], 296, 0, 644 - 296, 544)
	if Game.state ~= "Options" then
		Building.show()
		else
		Graphics.drawPartialImage(312,112,Texture["darkback"], 312, 112, 644 - 312, 544 - 112)
		ScreenButton(312+66,400,Texture["reset"],"DELETESAVE")
		gpu_drawtext(322,519,version,white)
	end
	
	
	Graphics.drawPartialImage(296,96,Texture["panelhorizontal"], 0, 0, 644 - 296, 16)
	Graphics.drawImage(312,96,Texture["panelGradientLeft"])
	Graphics.drawImage(644-64,96,Texture["panelGradientRight"])
		
	Graphics.drawImage(296, 0, Texture["panelvertical"])
	Graphics.drawImage(296, 0, Texture["panelGradientTop"])
	Graphics.drawImage(296, 544 - 64, Texture["panelGradientBottom"])
	
	Graphics.drawImage(644, 0, Texture["panelvertical"])
	Graphics.drawImage(644, 0, Texture["panelGradientTop"])
	Graphics.drawImage(644, 544 - 64, Texture["panelGradientBottom"])
	
	Button.show()
	Panel.show()
	Upgrade.show()
	if Cookie.count>=1000000 then
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X,40,NumberMod(math.floor(Cookie.count)), white)
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X,60,"Cookies", white)
	else
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X,60,NumberMod(math.floor(Cookie.count)).."Cookies", white)
	end
	gpu_drawCenteredtext(810,15,"Store", white)
	if CpS >= 1000 then
		gpu_drawCenteredtext(CENTER_OF_COOKIE_X, 80,"per second: ", white)
		gpu_drawCenteredtext(CENTER_OF_COOKIE_X,100,NumberMod(CpS), white)
	else
		gpu_drawCenteredtext(CENTER_OF_COOKIE_X, 80,"per second: "..NumberMod(CpS), white)
	end
	Graphics.drawScaleImage(352, 0, Texture["shadedBorders"], 252 / 256, 96 / 256)
	ScreenButton(312,48,Texture["buttonDL"],"DLButton")
	ScreenButton(544,0,Texture["buttonUR"],"URButton")
	ScreenButton(544,48,Texture["buttonDR"],"DRButton")
	gpu_drawCenteredtext(594,60,"Exit", white)
	gpu_drawCenteredtext(362,60,"Save", white)
	if menu == "DLButton" then
		Game.state="Save"
		Timer.reset(SaveTimer)
		menu = "Saving"
	end
	if Game.state~="Options" then
		ScreenButton(312,0,Texture["buttonUL"],"ULButton")
		gpu_drawCenteredtext(362,12,"Stngs", white)
		else
		ScreenButton(312,0,Texture["buttonUL"],"Normal")
		gpu_drawCenteredtext(362,12,"Stngs", white)
	end
	if Timer.getTime(SaveTimer)/600000>=1 then
		Game.save()
		drawPanel(312+106,514,120,30)
		gpu_drawCenteredtext(312+166,517,"Saved",white)
		if Timer.getTime(SaveTimer)/602000>=1 then
			Timer.reset(SaveTimer)
		end
	end
	if Game.state == "Save" then
		Game.save()
		drawPanel(312+106,514,120,30)
		gpu_drawCenteredtext(312+166,517,"Saved",white)
		if Timer.getTime(SaveTimer)/2000>=1 then
			Timer.reset(SaveTimer)
			menu = "Normal"
		end
		
	end
	if Controls.check(pad, SCE_CTRL_SQUARE) and not Controls.check(oldpad, SCE_CTRL_SQUARE) then
		if Upgrade.mode==1 and #Upgrade.Now>5 then Upgrade.mode=2 else Upgrade.mode=1 end
		if Upgrade.mode==2 then
			Button.y = Button.defaulttemp + 60 * (math.floor((#Upgrade.Now-0.1)/5))
		elseif #Upgrade.Now>5 then
			Button.y = Button.defaulttemp
		end
	end
	if Upgrade.mode == 2 then
			Button.default = Button.defaulttemp + 60 * (math.floor((#Upgrade.Now-0.1)/5))
			Graphics.drawImage(697,Upgrade.default - 140,Texture["pressSquare2"])
		else
			Button.default = Button.defaulttemp
			if #Upgrade.Now>5 then
				Graphics.drawImage(697,Upgrade.default - 140,Texture["pressSquare1"])
			end
	end
	if #Upgrade.Now<=5 and Upgrade.mode==2 then
		Button.y = Button.defaulttemp
		Upgrade.mode = 1
	end
	if Upgrade.mode == 2 and math.floor((#Upgrade.Now-0.1)/5)~=temp4grade then
		temp4grade = math.floor((#Upgrade.Now-0.1)/5)
		Button.y = Button.defaulttemp + 60 * (math.floor((#Upgrade.Now-0.1)/5))
	end
	Graphics.termBlend()
	if Touch["x"] == nil or Touch["y"] == nil then
		Button.tmp = 0
		Panel.tmp = 0
		Upgrade.tmp = 0
	end
	if Controls.check(pad, SCE_CTRL_TRIANGLE) and not Controls.check(oldpad, SCE_CTRL_TRIANGLE) then
		Cookie.count = Cookie.count + 1 * Upgrade["CursorQuan"]
		Cookie.total = Cookie.total + 1 * Upgrade["CursorQuan"]
		Cookie.tmp = 1
	end
	if menu == "DELETESAVE" then
		Game.delsave()
		System.exit()
	end
	if menu == "ULButton" then
		Game.state = "Options"	
	end
	if menu == "Normal" then
		Game.state = "Normal"
	end
	if menu == "DRButton" then
		Game.save()
		Texture.GarbadgeCollection()
		System.exit()
	end
	Screen.flip()
	oldpad = pad
	SpdOf.term()
end