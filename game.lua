local white = Color.new(255,255,255)
local gray = Color.new(128,128,128)
local yellow = Color.new(255,255,80)
local blue = Color.new(80,80,255)
local red = Color.new(255,80,80,80)
NAMEOMBTQ={"Million","Billion","Trillion","Quadrillion","Quintillion","Sextillion","Septillion","Octillion","Nonillion","Decillion","Undecillion","Duodecillion","Tredecillion","Quattuordecillion","Quindecillion","Sexdecillion","Septendecillion","Octodecillion","Novemdecillion","Vigintillion"}
defaultFolder="CookieClicker"
Texture={}
Stick={}
Stick.left={}
Stick.right={}
Button={defaulty=184,quantity=2}
Button.y=Button.defaulty
Buildings={defaulty=130}
Buildings.y=Buildings.defaulty
Touch={}
Shine={rot=0,speed=0.008}
CENTER_OF_COOKIE_X=148
CENTER_OF_COOKIE_Y=273
Version="ver####0.1"
function Texture.load(name,place)
	Texture[name] = Graphics.loadImage("app0:/"..place)
	Texture[#Texture+1] = name
end
function Button.make(name,fprice,price,count,id,cps,activation)
	Button[name.."FirstPrice"] = fprice
	Button[name.."Price"] = price
	Button[name.."Count"] = count
	Button[name.."Id"] = id
	Button[name.."CpS"] = cps
	Button[name.."A"] = activation
	Button[#Button+1] = name
end
oldpad = SCE_CTRL_CROSS
pi=math.pi
Texture.load("BKG","data/background.png")
Texture.load("Cookie","data/perfectCookie.png")
Texture.load("PanelVertical","data/panelVertical.png")
Texture.load("StoreTile","data/storeTile.jpg")
Texture.load("PressedTile","data/pressedTile.png")
Texture.load("Buildings","data/buildings.png")
Texture.load("PanelHorizontal","data/panelHorizontal.png")
Texture.load("Cursor","data/cursor.png")
Texture.load("Shine","data/shine.png")
Texture.load("Favicon","data/favicon.png")
Texture.load("BLDBacks","data/BLDBacks.png")
Texture.load("BLDIcons","data/BLDIcons.png")
Texture.load("shadedBorders","data/shadedBorders.png")
Texture.load("DarkNoise","data/DarkNoise.png")
Texture.load("Tile","data/Tile.png")
Texture.load("panelGradientBottom","data/panelGradientBottom.png")
Texture.load("panelGradientLeft","data/panelGradientLeft.png")
Texture.load("panelGradientRight","data/panelGradientRight.png")
Texture.load("panelGradientTop","data/panelGradientTop.png")
--//LOAD FONT SYSTEM//--
glyph_l = {}
glyph_r = {}
glyph_w = {}
function g_init(char, l, r) --this saves to an array the left and right pixels, as well as the width of each character, and the character's string is the index
    glyph_l[char] = l
    glyph_r[char] = r
    glyph_w[char] = r-l+1
end
g_init('0',414,430)
g_init('1',431,439)
g_init('2',440,454)
g_init('3',455,468)
g_init('4',469,483)
g_init('5',484,497)
g_init('6',498,512)
g_init('7',512,525)
g_init('8',526,540)
g_init('9',541,554)
g_init('A',1,19)
g_init('B',20,35)
g_init('C',36,52)
g_init('D',53,70)
g_init('E',71,84)
g_init('F',85,98)
g_init('G',99,116)
g_init('H',117,133)
g_init('I',134,139)
g_init('J',140,148)
g_init('K',149,164)
g_init('L',165,177)
g_init('M',178,196)
g_init('N',197,213)
g_init('O',214,232)
g_init('P',233,248)
g_init('Q',249,268)
g_init('R',269,284)
g_init('S',285,296)
g_init('T',297,310)
g_init('U',311,327)
g_init('V',328,344)
g_init('W',345,367)
g_init('X',368,383)
g_init('Y',384,399)
g_init('Z',400,413)
g_init('.',562,568)
g_init(' ',580,581)
g_init(':',555,561)
g_init('-',569,580)
g_init('#',582,599)
Texture.load("Font2","data/Font2.png")
Center={}
function gpu_drawtext(x, y, text, font_color)
    local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
    while i_str < str_length do
        i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
        if cw ~= nil then --as long as the character exists
            Graphics.drawPartialImage(x+str_width, y,Texture["Font2"], glyph_l[i_chr], 0, cw, 22, font_color)
            str_width = str_width + cw - 1
        end
    end
end
function gpu_drawCenteredtext(x, y, text, font_color)
    local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
	while i_str < str_length do
		i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
		if cw ~= nil then --as long as the character exists
            str_width = str_width + cw + 1
		end
	end
	Center[x*y]=str_width
	local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
    while i_str < str_length do
        i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
        if cw ~= nil then --as long as the character exists
			Graphics.drawPartialImage(x-math.floor(Center[x*y]/2)+str_width, y,Texture["Font2"], glyph_l[i_chr], 0, cw, 22, font_color)
            str_width = str_width + cw + 1
        end
    end
end
--//LOAD FONT SYSTEM//--
SpdOf={}
SpdOf.timer = Timer.new()
SpdOf.framerate = 60
SpdOf.tmp = 0
SpdOf.cmn = 0
ScondUpdt={}
ScondUpdt.timer=Timer.new()
ScondUpdt.length=1000
ScondUpdt.tmp=0
CpSTimer=Timer.new()
Cookie={count=0,total=0,size=0,speed=0.1,tmp=0}
Cursor={speed=-0.005,max=30,rot=0}
Button.make("Cursor",15,15,0,1,0.1,0)
Button.make("Grandma",100,100,0,2,1,0)
Button.make("Farm",1000,1000,0,4,8,0)
Button.make("Mine",12000,12000,0,5,47,0)
Button.make("Factory",130000,130000,0,6,260,0)
Button.make("Bank",1400000,1400000,0,7,1400,0)
Button.make("Temple",20000000,20000000,0,8,7800,0)
Button.make("WizardTower",330000000,330000000,0,9,44000,0)
Button.make("Shipment",5100000000,5100000000,0,10,260000,0)
Button.make("AlchemyLab",75000000000,75000000000,0,11,1600000,0)
Button.make("Portal",1000000000000,1000000000000,0,12,10000000,0)
Button.make("TimeMachine",14000000000000,14000000000000,0,13,65000000,0)
Button.make("AntimatterCondenser",170000000000000,170000000000000,0,14,430000000,0)
Button.make("Prism",2100000000000000,2100000000000000,0,15,2900000000,0)
squaretmp=1
Panel={}
Panel.state="Buy"
Panel.Quan=1
Panel.tmp=0
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
		local r = math.floor(e/3)*3
		local c = e - r
		num = num*10^c
		num = tonumber(string.sub(num,1,c+5))
		return (num.." "..NAMEOMBTQ[(r/3)-1])
	end
end
function explode(div,str)
	pos = 0
	arr = {}
	for st,sp in function() return string.find(str,div,pos,true) end do
		table.insert(arr,string.sub(str,pos,st-1))
		pos = sp + 1
	end
	table.insert(arr,string.sub(str,pos))
	return arr
end
function save()
	savefile = System.openFile("ux0:/data/ccsave.sav",FCREATE)
	savestring=Cookie.count.."#"..Cookie.total.."#"
	savestring = Cookie.count.."#"..Cookie.total.."#"..Button["CursorCount"].."#"..Button["GrandmaCount"].."#"..Button["FarmCount"].."#"..Button["MineCount"].."#"..Button["FactoryCount"].."#"..Button["BankCount"].."#"..Button["TempleCount"].."#"..Button["WizardTowerCount"].."#"..Button["ShipmentCount"].."#"..Button["AlchemyLabCount"].."#"..Button["PortalCount"].."#"..Button["TimeMachineCount"].."#"..Button["AntimatterCondenserCount"].."#"..Button["PrismCount"].."#"
	savestring = crypt(savestring,enc1)
	savestringlen = string.len(savestring)
	System.writeFile(savefile,savestring,savestringlen)
	System.closeFile(savefile)
end
function PriceUpdate(state)
	if Panel.state=="Buy" then
		if state==1 then
			for i=1,#Button do
				Button[Button[i].."Price"]=Button[Button[i].."FirstPrice"]*1.15^Button[Button[i].."Count"]
			end
			elseif state==10 then
			for i=1,#Button do
				Button[Button[i].."Price"]=Button[Button[i].."FirstPrice"]*(1.15^(Button[Button[i].."Count"]+10)-1.15^(Button[Button[i].."Count"]))/0.15
			end
			elseif state==100 then
			for i=1,#Button do
				Button[Button[i].."Price"]=Button[Button[i].."FirstPrice"]*(1.15^(Button[Button[i].."Count"]+100)-1.15^(Button[Button[i].."Count"]))/0.15
			end
		end
		else
		if state==1 then
			for i=1,#Button do
				if Button[Button[i].."Count"]>0 then
					Button[Button[i].."Price"] = math.ceil(Button[Button[i].."FirstPrice"]*1.15^(Button[Button[i].."Count"]-1)/2)
					else
					Button[Button[i].."Price"] = 0
				end
			end
			elseif state==10 then
			for i=1,#Button do
				if Button[Button[i].."Count"]>=10 then
					Button[Button[i].."Price"]=math.ceil(math.abs(Button[Button[i].."FirstPrice"]*(1.15^(Button[Button[i].."Count"]-10)-1.15^(Button[Button[i].."Count"]))/0.15)/2)
					elseif Button[Button[i].."Count"]<10 and Button[Button[i].."Count"]>0 then
					Button[Button[i].."Price"]=math.ceil(Button[Button[i].."FirstPrice"]*(1.15^(Button[Button[i].."Count"])-1.15^(0))/0.15/2)
					elseif Button[Button[i].."Count"]==0 then
					Button[Button[i].."Price"] = 0
				end
			end
			elseif state==100 then
			for i=1,#Button do
				if Button[Button[i].."Count"]>=100 then
					Button[Button[i].."Price"]=math.ceil(math.abs(Button[Button[i].."FirstPrice"]*(1.15^(Button[Button[i].."Count"]-100)-1.15^(Button[Button[i].."Count"]))/0.15)/2)
					elseif Button[Button[i].."Count"]<100 and Button[Button[i].."Count"]>0 then
					Button[Button[i].."Price"]=math.ceil(Button[Button[i].."FirstPrice"]*(1.15^(Button[Button[i].."Count"])-1.15^(0))/0.15/2)
					elseif Button[Button[i].."Count"]==0 then
					Button[Button[i].."Price"] = 0
				end
			end
		end
		
	end
end
function continue()
	if System.doesFileExist("ux0:/data/ccsave.sav") then
		savefile = System.openFile("ux0:/data/ccsave.sav", FREAD)
		size = System.sizeFile(savefile)
		file = System.readFile(savefile, size)
		file = crypt(file,enc1,true)
		System.closeFile(savefile)
		savearray = explode("#",file,size)
		Cookie.count = tonumber(savearray[1]) or 0
		Cookie.total = tonumber(savearray[2]) or 0
		Button["CursorCount"] = tonumber(savearray[3]) or 0
		Button["GrandmaCount"] = tonumber(savearray[4]) or 0
		Button["FarmCount"] = tonumber(savearray[5]) or 0
		Button["MineCount"] = tonumber(savearray[6]) or 0
		Button["FactoryCount"] = tonumber(savearray[7]) or 0
		Button["BankCount"] = tonumber(savearray[8]) or 0
		Button["TempleCount"] = tonumber(savearray[9]) or 0
		Button["WizardTowerCount"] = tonumber(savearray[10]) or 0
		Button["ShipmentCount"] = tonumber(savearray[11]) or 0
		Button["AlchemyLabCount"] = tonumber(savearray[12]) or 0
		Button["PortalCount"] = tonumber(savearray[13]) or 0
		Button["TimeMachineCount"] = tonumber(savearray[14]) or 0
		Button["AntimatterCondenserCount"] = tonumber(savearray[15]) or 0
		Button["PrismCount"] = tonumber(savearray[16]) or 0
		
	end
end
function RestateButtons()
	Button.quantity = 2
	for i=3, #Button do
		if Button[Button[i-2].."FirstPrice"]<=Cookie.total then
			Button.quantity=Button.quantity+1
		end
	end
	for i=1,#Buildings do
		if Buildings[i]~=nil and Button[Buildings[i].."Count"]==0 and Button[Buildings[i].."Id"]>1 and Button[Buildings[i].."A"]==1 then
			Button[Buildings[i].."A"] = 0
			table.remove(Buildings,i)
		end
	end
end
function RestateBildings(mode)
	mode=mode or 1
	for i=1, #Button do
		if Button[Button[i].."Id"]>1 and Button[Button[i].."Count"]>0 and Button[Button[i].."A"] == 0 then
			Buildings[#Buildings+1]=Button[i]
			Button[Button[i].."A"] = 1
		end
	end
	
end
function Shine.show()
	if SpdOf.tmp==1 then
		Shine.rot=Shine.rot+Shine.speed     
	end
	if Shine.rot>2*pi then Shine.rot=Shine.rot-2*pi end
	Graphics.drawRotateImage(CENTER_OF_COOKIE_X,CENTER_OF_COOKIE_Y,Texture["Shine"],Shine.rot)
	Graphics.drawRotateImage(CENTER_OF_COOKIE_X,CENTER_OF_COOKIE_Y,Texture["Shine"],-Shine.rot)
end
function Texture.GarbadgeCollection()
	for i=1, #Texture do
		Graphics.freeImage(Texture[Texture[i]])
	end
end
function Cookie.add(quantity)
	quantity=quantity or 1
	Cookie.count=Cookie.count+quantity
	Cookie.total=Cookie.total+quantity
end
function Cookie.touch()
	if Touch.x~=nil and Touch.now=="N" and Touch.x>CENTER_OF_COOKIE_X-128 and Touch.x<CENTER_OF_COOKIE_X+128 and Touch.y>CENTER_OF_COOKIE_Y-128 and Touch.y<CENTER_OF_COOKIE_Y+128 then
		Touch.now="Cookie"
		Cookie.tmp=1
		Cookie.add()
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
function SpdOf.init()
	if Timer.getTime(SpdOf.timer)>1000/SpdOf.framerate then
		SpdOf.tmp = 1
		Timer.reset(SpdOf.timer)
	end
end
function SpdOf.term()
	SpdOf.tmp = 0
end
function ScondUpdt.init()
	if Timer.getTime(ScondUpdt.timer)/ScondUpdt.length>=1 then
		ScondUpdt.tmp = 1
		Timer.reset(ScondUpdt.timer)
	end
end
function ScondUpdt.term()
	ScondUpdt.tmp = 0
end
function Button.show()
	for i=1, Button.quantity do
		if (Button.y+64*i)>Button.defaulty and (Button.y+64*(i-1))<544 then
			if (Cookie.count >= Button[Button[i].."Price"] and Panel.state=="Buy") or (Button[Button[i].."Price"]~=0 and Panel.state=="Sell") then
				Graphics.drawImage(660,Button.y+64*(i-1),Texture["StoreTile"])
				Graphics.drawPartialImage(660,Button.y+64*(i-1),Texture["Buildings"],0,64*(Button[Button[i].."Id"]-1),64,64)
				gpu_drawtext(724,10+Button.y+64*(i-1),Button[i],white)
				gpu_drawtext(740,30+Button.y+64*(i-1),NumberMod(math.ceil(Button[Button[i].."Price"])),Color.new(80,255,80))
				gpu_drawtext(916,20+Button.y+64*(i-1),Button[Button[i].."Count"],Color.new(255,255,255,100))
				Graphics.drawImage(724,32+Button.y+64*(i-1),Texture["Favicon"])
				if Panel.state=="Sell" then
					Graphics.drawImage(660,Button.y+64*(i-1),Texture["Tile"],red)
				end
				if Button.now==i and Button.tmp>0 then
					Graphics.drawImage(660,Button.y+64*(i-1),Texture["PressedTile"])
				end
				else
				Graphics.drawImage(660,Button.y+64*(i-1),Texture["StoreTile"],Color.new(255,255,255,150))
				if Cookie.total >= Button[Button[i].."FirstPrice"] then
					Graphics.drawPartialImage(660,Button.y+64*(i-1),Texture["Buildings"],0,64*(Button[Button[i].."Id"]-1),64,64,Color.new(255,255,255,150))
					gpu_drawtext(724,10+Button.y+64*(i-1),Button[i],Color.new(255,255,255,150))
					gpu_drawtext(740,30+Button.y+64*(i-1),NumberMod(math.ceil(Button[Button[i].."Price"])),Color.new(255,80,80))
					gpu_drawtext(916,20+Button.y+64*(i-1),Button[Button[i].."Count"],Color.new(255,255,255,50))
					Graphics.drawImage(724,32+Button.y+64*(i-1),Texture["Favicon"],Color.new(255,255,255,150))
					if Panel.state=="Sell" then
						Graphics.drawImage(660,Button.y+64*(i-1),Texture["Tile"],Color.new(255,80,80,80))
					end
					else
					Graphics.drawPartialImage(660,Button.y+64*(i-1),Texture["Buildings"],64,64*(Button[Button[i].."Id"]-1),64,64,Color.new(255,255,255,150))
					gpu_drawtext(724,10+Button.y+64*(i-1),"###",Color.new(255,255,255,150))
					gpu_drawtext(740,30+Button.y+64*(i-1),NumberMod(math.ceil(Button[Button[i].."Price"])),Color.new(255,80,80))
					gpu_drawtext(916,20+Button.y+64*(i-1),Button[Button[i].."Count"],Color.new(255,255,255,50))
					Graphics.drawImage(724,32+Button.y+64*(i-1),Texture["Favicon"],Color.new(255,255,255,150))
					if Panel.state=="Sell" then
						Graphics.drawImage(660,Button.y+64*(i-1),Texture["Tile"],Color.new(255,80,80,80))
					end
				end
			end
		end
	end
	if Touch.x~=nil and Touch.now=="N" and Touch.x>660 and Touch.y>Button.defaulty and Touch.y<Button.y+64*Button.quantity then
		Button.oldy=Button.oldy or Touch.y-Button.y
		Touch.now="Buttons"
	end
	for i=1, Button.quantity do
		if Touch.now=="N" and Button.now==i and Button.tmp>0 and ((Button[Button[i].."Price"]<=Cookie.count and Panel.state=="Buy") or(Button[Button[i].."Price"]~=0 and Panel.state=="Sell")) then
			if Button[Button[i].."Count"]==0 and Button[Button[i].."Id"]>1 and Button[Button[i].."A"]==0 then
				Buildings[#Buildings+1] = Button[i]
				Button[Button[i].."A"] = 1
			end
			if Panel.state=="Buy" then
				Button[Button[i].."Count"]=Button[Button[i].."Count"]+Panel.Quan
				else
				if Panel.Quan==1 and Button[Button[i].."Count"]>=1 then
					Button[Button[i].."Count"]=Button[Button[i].."Count"]-1
				end
				if Panel.Quan==10 and Button[Button[i].."Count"]>=10 then
					Button[Button[i].."Count"]=Button[Button[i].."Count"]-10
					elseif Panel.Quan==10 then
					Button[Button[i].."Count"]=Button[Button[i].."Count"]-Button[Button[i].."Count"]
				end
				if Panel.Quan==100 and Button[Button[i].."Count"]>=100 then
					Button[Button[i].."Count"]=Button[Button[i].."Count"]-100
					elseif Panel.Quan==100 then
					Button[Button[i].."Count"]=Button[Button[i].."Count"]-Button[Button[i].."Count"]
				end
			end
			if Panel.state=="Buy" then
				Cookie.count = Cookie.count - Button[Button[i].."Price"]
				else
				Cookie.count = Cookie.count + Button[Button[i].."Price"]
				Cookie.total = Cookie.total + Button[Button[i].."Price"]
			end
			RestateButtons()
			Touch.now="Bought "..Button[i]
			PriceUpdate(Panel.Quan)
			CookiesPerSecond()
		end
	end
	if Touch.now=="Buttons" then
		--SCROLL for buildings--
		if Button.y<Button.defaulty then
			Button.y=Touch.y-Button.oldy
			elseif Button.y>Button.defaulty-(Button.quantity-1)*64 then
			Button.y=Touch.y-Button.oldy
		end
		if Button.y>Button.defaulty then
			Button.y=Button.defaulty
		end
		if Button.y<Button.defaulty-(Button.quantity-1)*64 then
			Button.y=Button.defaulty-(Button.quantity-1)*64
		end
		------------------------
		for i=1,#Button do
			if Touch.y>Button.y+64*(i-1) and Touch.y<Button.y+64*i then
				Button.now = i
			end		
		end
		if Button.tmp==0 then
			Button.tmp=Touch.y
		end
		if Touch.y>Button.tmp+10 or Touch.y<Button.tmp-10 then
			Button.tmp=-1
		end
		else
		Button.oldy = nil
		Button.now = 0
	end
	
end
function CookiesPerSecond()
	CpS=0
	for i=1, Button.quantity do
		CpS=CpS+Button[Button[i].."Count"]*Button[Button[i].."CpS"]
	end
end
function Buildings.show()
	if Touch.x~=nil and Touch.now=="N" and Touch.x>312 and Touch.x<644 and Touch.y>130 and Touch.y<Buildings.y+#Buildings*144 then
		Buildings.oldy=Buildings.oldy or Touch.y-Buildings.y
		Touch.now="Buildings"
	end
	if Touch.now=="Buildings" then
		--SCROLL for buildings--
		if Buildings.y<130 then
			Buildings.y=Touch.y-Buildings.oldy
			elseif Buildings.y>130-144*(#Buildings-1) then
			Buildings.y=Touch.y-Buildings.oldy
		end
		if Buildings.y>130 then
			Buildings.y=130
		end
		if Buildings.y<130-144*(#Buildings-1) then
			Buildings.y=130-144*(#Buildings-1)
		end
		------------------------
		else
		Buildings.oldy = nil
	end
	for i=1, #Buildings do
		if (Buildings.y+144*i)>130 and (Buildings.y+144*(i-1))<544 then
			Graphics.drawPartialImage(312,Buildings.y+144*(i-1),Texture["BLDBacks"],0,144*(Button[Buildings[i].."Id"]-2),332,144)
			if (Button[Buildings[i].."Count"]<=9 and Button[Buildings[i].."Id"]>2 and Button[Buildings[i].."Id"]<6) or (Button[Buildings[i].."Count"]<=27 and Button[Buildings[i].."Id"]==2) or (Button[Buildings[i].."Count"]<=5 and Button[Buildings[i].."Id"]>=6) then
				if Buildings[i]=="Grandma" then
					for f=1, math.floor((Button[Buildings[i].."Count"]+2)/3) do
						Graphics.drawPartialImage(305+32*(f-1),Buildings.y+144*(i-1)+12,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
					for f=1, math.floor((Button[Buildings[i].."Count"]+1)/3) do
						Graphics.drawPartialImage(305+32*(f-1)+12,Buildings.y+144*(i-1)+28,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
					for f=1, math.floor((Button[Buildings[i].."Count"])/3) do
						Graphics.drawPartialImage(305+32*(f-1)+24,Buildings.y+144*(i-1)+44,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
				end
				if (Button[Buildings[i].."Count"]<=9 and Button[Buildings[i].."Id"]>2 and Button[Buildings[i].."Id"]<6) then
					for f=1, math.floor((Button[Buildings[i].."Count"]+1)/2) do
						Graphics.drawPartialImage(316+64*(f-1),Buildings.y+144*(i-1)+28,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
					for f=1, math.floor((Button[Buildings[i].."Count"])/2) do
						Graphics.drawPartialImage(316+64*(f-1)+32,Buildings.y+144*(i-1)+52,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
				end
				if (Button[Buildings[i].."Count"]<=5 and Button[Buildings[i].."Id"]>=6) then
					local c=0
					if Button[Buildings[i].."Id"]==7 then c=32 end
					if Button[Buildings[i].."Id"]==7 then c=32 end
					if Button[i]=="Shipment" then c=28 end
					if Button[i]=="AlchemyLab" then c=24 end
					if Button[i]=="Temple" then c=28 end
					for f=1, Button[Buildings[i].."Count"] do
						Graphics.drawPartialImage(316+64*(f-1),Buildings.y+144*(i-1)+16+c,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
				end
				else
				if (Button[Buildings[i].."Count"]>27 and Button[Buildings[i].."Id"]==2) then
					if Buildings[i]=="Grandma" then
						for f=1, 9 do
							Graphics.drawPartialImage(305+32*(f-1),Buildings.y+144*(i-1)+12,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
						end
						for f=1, 9 do
							Graphics.drawPartialImage(305+32*(f-1)+12,Buildings.y+144*(i-1)+28,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
						end
						for f=1, 9 do
							Graphics.drawPartialImage(305+32*(f-1)+24,Buildings.y+144*(i-1)+44,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
						end
					end
				end
				if (Button[Buildings[i].."Count"]>9 and Button[Buildings[i].."Id"]>2 and Button[Buildings[i].."Id"]<6) then
					for f=1, 5 do
						Graphics.drawPartialImage(316+64*(f-1),Buildings.y+144*(i-1)+28,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
					for f=1, 4 do
						Graphics.drawPartialImage(316+64*(f-1)+32,Buildings.y+144*(i-1)+52,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
				end
				if (Button[Buildings[i].."Count"]>5 and Button[Buildings[i].."Id"]>=6) then
					local c=0
					if Button[Buildings[i].."Id"]==7 then c=32 end
					if Button[i]=="Shipment" then c=28 end
					if Button[i]=="AlchemyLab" then c=24 end
					if Button[i]=="Temple" then c=28 end
					for f=1, 5 do
						Graphics.drawPartialImage(316+64*(f-1),Buildings.y+144*(i-1)+16+c,Texture["BLDIcons"],0+64*(Button[Buildings[i].."Id"]-2),0,64,64)
					end
				end
			end
		end
	end
end
function Cursor.show()
	if SpdOf.tmp==1 then
		Cursor.rot=Cursor.rot+Cursor.speed
	end
	if Cursor.rot>2*pi then
		Cursor.rot=Cursor.rot-2*pi
	end
	if Button["CursorCount"]<=Cursor.max then
		for i=1, Button["CursorCount"] do
			Graphics.drawRotateImage(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["Cursor"],Cursor.rot+(pi/(Cursor.max/2)*i))
		end
		else
		for i=1, Cursor.max do
			Graphics.drawRotateImage(CENTER_OF_COOKIE_X, CENTER_OF_COOKIE_Y, Texture["Cursor"],Cursor.rot+(pi/(Cursor.max/2)*i))
		end
	end
end
function Panel.show()
	if Panel.state=="Buy" then
		Graphics.debugPrint(670,142,"Buy",white)
		Graphics.debugPrint(670,162,"Sell",gray)
		else
		Graphics.debugPrint(670,142,"Buy",gray)
		Graphics.debugPrint(670,162,"Sell",white)
	end
	if Touch.x~=nil and Touch.y>141 and Touch.y<184 and Touch.x>660 and Touch.x<720 and Touch.now=="N" and Panel.tmp==0 then
		Panel.tmp=1
		if Panel.state=="Buy" then Panel.state="Sell" else Panel.state="Buy" end
		PriceUpdate(Panel.Quan)
	end
	if Panel.Quan==1 then
		Graphics.debugPrint(740,152,"1",white)
		Graphics.debugPrint(800,152,"10",gray)
		Graphics.debugPrint(880,152,"100",gray)
		elseif Panel.Quan==10 then
		Graphics.debugPrint(740,152,"1",gray)
		Graphics.debugPrint(800,152,"10",white)
		Graphics.debugPrint(880,152,"100",gray)
		elseif Panel.Quan==100 then
		Graphics.debugPrint(740,152,"1",gray)
		Graphics.debugPrint(800,152,"10",gray)
		Graphics.debugPrint(880,152,"100",white)
	end
	if Touch.x~=nil and Touch.y>141 and Touch.y<184 and Touch.x>720 and Touch.x<780 and Touch.now=="N" and Panel.tmp==0 then
		Panel.tmp=1
		Panel.Quan=1
		PriceUpdate(1)
	end
	if Touch.x~=nil and Touch.y>141 and Touch.y<184 and Touch.x>780 and Touch.x<850 and Touch.now=="N" and Panel.tmp==0 then
		Panel.tmp=1
		Panel.Quan=10
		PriceUpdate(10)
	end
	if Touch.x~=nil and Touch.y>141 and Touch.y<184 and Touch.x>850 and Touch.x<940 and Touch.now=="N" and Panel.tmp==0 then
		Panel.tmp=1
		Panel.Quan=100
		PriceUpdate(100)
	end
end
function Stick.move()
	Stick.left.y=Stick.left.y-128
	if math.abs(Stick.left.y) > 15 and Buildings.y >= Buildings.defaulty-(#Buildings-1)*144 and Buildings.y <= Buildings.defaulty then
		Buildings.y = Buildings.y - Stick.left.y/25
	end
	if Buildings.y > Buildings.defaulty then
		Buildings.y = Buildings.defaulty
		elseif Buildings.y < Buildings.defaulty-(#Buildings-1)*144 then
		Buildings.y = Buildings.defaulty-(#Buildings-1)*144
	end
	Stick.right.y=Stick.right.y-128
	if math.abs(Stick.right.y) > 15 and Button.y >= Button.defaulty-(Button.quantity-1)*64 and Button.y <= Button.defaulty then
		Button.y = Button.y - Stick.right.y/25
	end
	if Button.y > Button.defaulty then
		Button.y = Button.defaulty
		elseif Button.y < Button.defaulty-(Button.quantity-1)*64 then
		Button.y = Button.defaulty-(Button.quantity-1)*64
	end
end
continue()
PriceUpdate(1)
RestateButtons()
RestateBildings()
CookiesPerSecond()
while true do
	ScondUpdt.init()
	SpdOf.init()
	pad = Controls.read()
	if ScondUpdt.tmp==1 then
		RestateButtons()
	end
	Touch.x, Touch.y = Controls.readTouch()
	Stick.left.x, Stick.left.y = Controls.readLeftAnalog()
	Stick.right.x, Stick.right.y = Controls.readRightAnalog()
	Stick.move()
	if Touch.x==nil and Touch.y==nil then
		Touch.now = "N"
	end
	if Timer.getTime(CpSTimer)/40>=1 then
		Cookie.count=Cookie.count+CpS/25
		Cookie.total=Cookie.total+CpS/25
		Timer.reset(CpSTimer)
	end
	Graphics.initBlend()
	Screen.clear()
	Graphics.drawImage(0,0,Texture["BKG"])
	Graphics.drawScaleImage(0,0,Texture["shadedBorders"],296/256,544/256)
	
	Shine.show()
	Cookie.touch()
	Cookie.formula = (Cookie.size*math.sin(4*Cookie.size)/16) --Formula for Cookie size change graphics ENGLISH IS THE BEST
	Graphics.drawImageExtended(CENTER_OF_COOKIE_X,CENTER_OF_COOKIE_Y,Texture["Cookie"],0,0,256,256,0,1+Cookie.formula,1+Cookie.formula)
	Cursor.show()
	Graphics.drawPartialImage(296,0,Texture["BKG"],296,0,664,544)
	Graphics.drawScaleImage(644,130,Texture["shadedBorders"],(960-644)/256,414/256)
	
	Button.show()
	Buildings.show()
	Graphics.drawPartialImage(296,0,Texture["BKG"],296,0,664,114)
	Graphics.drawImage(296,114,Texture["PanelHorizontal"])
	Graphics.drawImage(296,0,Texture["PanelVertical"])
	Graphics.drawImage(660,130,Texture["DarkNoise"])
	Graphics.drawScaleImage(660,141,Texture["shadedBorders"],300/256,43/256)
	Panel.show()
	Graphics.drawImage(644,125,Texture["PanelHorizontal"])
	Graphics.drawImage(644,0,Texture["PanelVertical"])
	Graphics.drawImage(296,0,Texture["panelGradientTop"])
	Graphics.drawImage(644,0,Texture["panelGradientTop"])
	Graphics.drawImage(296,544-64,Texture["panelGradientBottom"])
	Graphics.drawImage(644,544-64,Texture["panelGradientBottom"])
	Graphics.drawImage(312,114,Texture["panelGradientLeft"])
	Graphics.drawImage(660,125,Texture["panelGradientLeft"])
	Graphics.drawImage(644-64,114,Texture["panelGradientRight"])
	Graphics.drawImage(960-64,125,Texture["panelGradientRight"])
	Graphics.drawPartialImage(660,0,Texture["BKG"],660,0,300,130)
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X,40,NumberMod(string.format("%.0f",math.floor(Cookie.count))), white)
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X,60,"Cookies", white)
	gpu_drawCenteredtext(810,60,"Store", white)
	--Graphics.debugPrint(0, 0,NumberMod(string.format("%.0f",math.floor(Cookie.count))).." Cookies", white)
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X, 80,"per second: ", white)
	gpu_drawCenteredtext(CENTER_OF_COOKIE_X,100,NumberMod(CpS), white)
	if Touch.x==nil and Touch.y==nil then
		Button.tmp=0
		Panel.tmp=0
	end
	gpu_drawtext(0,524,Version,white)
	gpu_drawCenteredtext(960/2,40,"To#exit#press#Select",white)
	gpu_drawCenteredtext(960/2,60,"Game#will#save",white)
	Graphics.termBlend()
	Screen.flip()
	--System.takeScreenshot("ux0:/data/shot.jpg", true, 255)
	if Controls.check(pad, SCE_CTRL_TRIANGLE) and not Controls.check(oldpad, SCE_CTRL_TRIANGLE) then
		Cookie.add()
		Cookie.tmp=1
	end
	if Controls.check(pad, SCE_CTRL_TRIANGLE) and Controls.check(pad, SCE_CTRL_CIRCLE) and Controls.check(pad, SCE_CTRL_UP) then
		Texture.GarbadgeCollection()
		FTP.SERVER.START()
	end
	if Controls.check(pad, SCE_CTRL_TRIANGLE) and Controls.check(pad, SCE_CTRL_SQUARE) then
		System.deleteFile("ux0:/data/ccsave.sav")
		Texture.GarbadgeCollection()
		System.exit()
	end
	if Controls.check(pad, SCE_CTRL_SELECT) and not Controls.check(oldpad, SCE_CTRL_SELECT) then
		save()
		Texture.GarbadgeCollection()
		System.exit()
	end
	oldpad = pad
	SpdOf.term()
	ScondUpdt.term()
end
