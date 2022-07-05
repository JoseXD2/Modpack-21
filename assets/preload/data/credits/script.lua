--[[ FRUMS - CREDITS
	modchart by raltyy :D
	
	i stole some of them from vs cheeky and previous modcharts i made, aaaaa i dont wanna rewrite all of them
	
	some of the easing functions are stolen from NotITG Modcharts
	i got inspired making this from notitg
	i really love notitg holy shit especially UKSRT!!
	I LOVE SHAME
	
	thanks to these guys!! without them, this wouldnt be possible!!
	https://github.com/sititou70/frums-credits-cli-nosound
	
	
	
	
	DAMN THESE ARE FUCKING HORRIBLE, i will rewrite them next time when i feel like i wanna make another modchart in psych
	oh yeah join pls
	discord.gg/cheeky
--]]

local down_arrow = "↓"

local face = "☻"
local face_alt = "☺"

local semicircle_1 = 
[[  ░░                    ░░
 ░░                      ░░ 
 ░░                      ░░ 
░░                        ░░  
░░                        ░░  
░░                        ░░  
░░                        ░░  
 ░░                      ░░ 
 ░░                      ░░ 
  ░░                    ░░]]

local semicircle_2 = 
[[  ▒▒                    ▒▒
 ▒▒                      ▒▒ 
 ▒▒                      ▒▒ 
▒▒                        ▒▒  
▒▒                        ▒▒  
▒▒                        ▒▒  
▒▒                        ▒▒  
 ▒▒                      ▒▒ 
 ▒▒                      ▒▒ 
  ▒▒                    ▒▒]]

local semicircle_3 = 
[[  ▓▓                    ▓▓
 ▓▓                      ▓▓ 
 ▓▓                      ▓▓ 
▓▓                        ▓▓  
▓▓                        ▓▓  
▓▓                        ▓▓  
▓▓                        ▓▓  
 ▓▓                      ▓▓ 
 ▓▓                      ▓▓ 
  ▓▓                    ▓▓]]

local DFONT = "dos.ttf"
local width = 480
local height = 480

function getSize(s)
	return s * (720 / height)
end

function getX(x)
	return (x * (1280 / getSize(width))) + ((1280 - getSize(width)) / 2)
end

function getY(y)
	return (y * (720 / getSize(height))) + ((720 - getSize(height)) / 2)
end

local tablecopy
function tablecopy(source,clone)
	if (type(source) == "table") then
		clone = clone and clone or {}
		for i,v in pairs(source) do
			if (type(v) == "table") then clone[i] = {} end
			clone[i] = type(v) == "table" and tablecopy(v,clone[i]) or v
		end
		return clone
	end
	return source
end

function tableinserts(source, cools)
	if (type(source) == "table" and type(cools) == "table") then
		for i,v in pairs(cools) do
			table.insert(source, v)
		end
	end
	return source
end

function mathclamp(x,min,max)return math.max(min,math.min(x,max))end

function mathlerp(from,to,i)return from+(to-from)*i end

function split(pString, pPattern)
	local Table = {}
	local fpat = "(.-)"..pPattern
	local last_end = 1
	local s, e, cap = pString:find(fpat,1)
	while s do
		if s ~= 1 or cap ~= "" then
		table.insert(Table,cap)
		end
		last_end = e+1
		s, e, cap = pString:find(fpat,last_end)
	end
	if last_end <= #pString then
		cap = pString:sub(last_end)
		table.insert(Table,cap)
	end
	return Table
end

function tablefind(table,v)
	if #table > 0 then
		for i,v2 in next,table do
			if v2 == v then
				return i
			end
		end
	end
end

function strthing(s,COOLCOOLCOOL)
	local str = ""
	for _ = 1,COOLCOOLCOOL do
		str = str..s
	end
	return str
end

-- ty lexicord for the function :DDD
function truncate(x, precision, round)
	if (precision == 0) then return math.floor(x) end
	
	precision = type(precision) == "number" and precision or 2
	
	x = x * math.pow(10, precision);
	return (round and math.floor(x + .5) or math.floor(x)) / math.pow(10, precision)
	
	--[[v = mathclamp(v,1,256)
	local a = split(tostring(n),".")
	local n = #a > 1 and tonumber(#a>1 and a[1].."."..string.sub(a[2],1,#a[2]>=v and v or a[2]) or v) or n
	return (type(b) == "boolean" and 
		b and (#a[2]>v and (tonumber(tostring(a[2]):sub(v,#a[2])) > 0 and n+tonumber("0."..strthing("0",v-1).."1") or n) or
			not b and n
		) or (type(a[2]) == "number" and tonumber(tostring(a[2]):sub(v,#a[2])) >= 5) and n+tonumber("0."..strthing("0",v-1).."1") or n)
	]]
end

-- THINGS I STOLE FROM MY OWN ROBLOX MODULE
function approriateStr(str,isIndex)
	if isIndex then
		local wrap = false
		
		if str:find(' ') or str:find('	') or str:find('"') or str:find("'") then wrap = true end
		local c = approriateStr(str)
		
		return wrap and "["..c..(string.sub(c,#c,#c) == "]" and " ]" or "]") or str
	else
		local v = '"'

		if str:find(v) then
			v = "'"
			if str:find(v) then
				v = "[["
				if str:find("]]") then
					v = nil
				end
			end
		end

		if v ~= nil then
			return v..str..(v == "[[" and "]]" or v)
		end
	end
end

tableToStr = nil
tableToStrLIMITTABLES = 4
function tableToStr(t,cln,x)
	if type(x) == "number" and (x or 0) >= tableToStrLIMITTABLES then return "Limited" end
	local count,indexNumber = 0,true
	for i,v in pairs(t) do
		count = count + 1
		if type(i) ~= "number" or type(v) == "table" then indexNumber = false end
	end
	if count < 8 and indexNumber then cln = false end
	
	local a = 1+(type(x) == "number" and x or 0)
	local str = --[[(cln and strthing("	",a-1) or "")..]]"{"..(cln and "\n" or "")
	
	for i,v in pairs(t) do
		if cln then str = str..strthing("	",a) end
		if type(i) == "string" then
			str = str..approriateStr(i,true)..' = '
		end
		if type(v) == "table" then
			str = str..tableToStr(v,cln,a)
		else
			str = str..(type(v) == "string" and (approriateStr(v) or "") or tostring(v))
		end
		
		str = str..(cln and ",\n" or ",")
	end
	if count > 0 then str = str:sub(1,#str-(cln and 2 or 1)) else if cln then str = str:sub(1,#str-1) end end

	str = str..((cln and count and "\n" or "")..(cln and strthing("	",a-1) or "").."}")
	return str
end
--]]

-- Change Property
function cgProperty(prop,v)
	setProperty(prop,getProperty(prop)+v)
end

function cgPropertyFromClass(class,prop,v)
	setPropertyFromClass(class,prop,getPropertyFromClass(class,prop)+v)
end
--]]

ogprint = print

local printLuaText = true
local prints = 0
local trackedPrints = {}
function print(...)
	--[[
	local rst = ""
	for i,v in pairs({...}) do
		if i > 1 then rst = rst..", " end
		if type(v) == "table" then
			rst = rst..tableToStr(v,true)
		else
			rst = rst..tostring(v)
		end
	end
	ogprint((type(songName) == "string" and songName.." " or "").."Modchart: "..rst)
	]]
	
	--[[
	if (printLuaText) then
		ogprint("hi")
		local removes = {}
		for i,v in pairs(trackedPrints) do
			v[1] = v[1] + 1
			cgProperty(v[2] .. ".y", 18)
			
			if (v[1] >= 24) then
				for i,v in pairs(trackedPrints) do
					setProperty(v[2] .. ".y", v[1] * 18)
				end
				
				table.insert(remove, i)
				removeLuaText(v[2])
			end
		end
		ogprint("hi")
		if (#removes > 0) then
			for i = #removes, 1, -1 do
				table.remove(trackedPrints, removes[i])
			end
		end
		removes = nil
		ogprint("hi")
		local str = "print" .. tostring(prints)
		local nice = {0, str}
		ogprint("hi")
		makeLuaText(str, rst, 1280, getX(0))
		setTextSize(str, 16)
		ogprint("hi")
		table.insert(trackedPrints, nice)
		addLuaText(str, true)
		setObjectCamera(str, "camOther")
		setObjectOrder(str, math.huge)
		ogprint("hi")
		tweenNumber(nil, "timerPrint" .. tostring(prints), 0, 0, 3, nil, nil, function()
			getfenv()["timerPrint" .. tostring(prints)] = nil
			ogprint("hi")
			if (not tablefind(trackedPrints, nice)) then return end
			ogprint("hi")
			for i,v in pairs(trackedPrints) do
				if (v[1] > nice[1]) then v[1] = v[1] - 1 end
				
				setProperty(v[2] .. ".y", v[1] * 18)
			end
			ogprint("hi")
			table.remove(trackedPrints, tablefind(nice))
			removeLuaText(str)
		end)
	end
	-]]
	
	prints = prints + 1
end

---------------------------------------------------------------------------------------------

local varsReady = false
dSongSpeed = 1
songSpeed = 1

local templateNote = {
	visualID = 0,
	
	alpha = 1,
	visible = true,
	
	scale = {
		x = .7,
		y = .7
	},
	x = 0,
	y = 0,
	
	width = 0,
	height = 0,
	
	angle = 0
}

local templateStrum = {
	downscroll = false,
	
	pooshseed = 0,
	poosh = 0,
	drunk = 0,
	tipsy = 0,
	shear = 0,
	
	notesOffsetMS = 0,
	
	alpha = 1,
	visible = true,
	
	scale = {
		x = 1,
		y = 1
	},
	notesScale = {
		x = 1,
		y = 1
	},
	padding = 0,
	
	x = 0,
	y = 0,
	--z = 0,
	
	width = 0,
	height = 0,
	
	angle = 0,
	notesAngle = 0,
	
	--[[rotation = {
		x = 0,
		y = 0,
		z = 0
	},
	
	fov = 70,]]
		
	notes = {}
}

local defaultStrums

local strums = {
	isReady = false,
	
	dad = tablecopy(templateStrum),
	
	bf = tablecopy(templateStrum)
}

local function switchStrumNote(note, to, visual)
	strums.bf.notes[note].x = defaultStrums.bf.notes[to].x
	strums.bf.notes[note].y = defaultStrums.bf.notes[to].y
	if (visual or (visual == nil)) then strums.bf.notes[note].visualID = to end
end

local function tweenSwitchStrumNote(note, to, time, startTime, easeF, visual, onComplete)
	local noteI = note
	local toI = to
	
	local note = strums.bf.notes[note]
	local to = defaultStrums.bf.notes[to]
	
	tweenNumber(note, "x", note.x, to.x, time, startTime, easeF, onComplete)
	tweenNumber(note, "y", note.y, to.y, time, startTime, easeF, onComplete)
	if (visual or (visual == nil)) then note.visualID = toI end
end

-- Easing
function linear(t,b,c,d)
	return c * t / d + b
end
function outCubic(t,b,c,d)
	t = t / d - 1
	return c * (math.pow(t, 3) + 1) + b
end
function inCubic(t, b, c, d)
	t = t / d
	return c * math.pow(t, 3) + b
end
function outElastic(t, b, c, d, a, p)
	if t == 0 then return b end
	t = t / d
	if t == 1 then return b + c end
	if not p then p = d * 0.3 end
	local s
	if not a or a < math.abs(c) then
		a = c
		s = p / 4
	else
		s = p / (2 * pi) * math.asin(c/a)
	end
	return a * math.pow(2, -10 * t) * math.sin((t * d - s) * (2 * math.pi) / p) + c + b
end
--]]

-- TweenNumber

tweenReqs = {}

function tnTick()
	local clock = songPos
	--print(songPos, #tweenReqs)
	if #tweenReqs > 0 then
		for i,v in next,tweenReqs do
			if clock>v[5]+v[6] then
				v[1][v[2]] =  v[7](v[6],v[3],v[4]-v[3],v[6])
				table.remove(tweenReqs,i)
				if v[9] then
					v[9]()
				end
			else
				v[1][v[2]] = v[7](clock-v[5],v[3],v[4]-v[3],v[6])
				--if (v[8]) then
				--	v[8] = false
				--	v[1][v[2]] = v[7](0,v[3],v[4]-v[3],v[6])
				--end
			end
		end
	end
end

function tweenNumber(maps, varName, startVar, endVar, time, startTime, easeF, onComplete)
	local clock = songPos
	maps = maps or getfenv()
	
	if #tweenReqs > 0 then
		for i2,v2 in next,tweenReqs do
			if v2[2] == varName and v2[1] == maps then
				v2[1][v2[2]] =  v2[7](v2[6],v2[3],v2[4]-v2[3],v2[6])
				table.remove(tweenReqs,i2)
				if v2[9] then
					v2[9]()
				end
				break
			end
		end
	end
	
	--print("Created TweenNumber: "..tostring(varName), startVar, endVar, time, startTime, type(onComplete) == "function")
	local t = {
		maps,
		varName,
		startVar,
		endVar,
		startTime or clock,
		time,
		easeF or linear,
		true,
		onComplete
	}
	
	table.insert(tweenReqs,t)
	t[1][t[2]] = t[7](0,t[3],t[4]-t[3],t[6])
	
	return function()
		maps[varName] = t[7](v[6],t[3],t[4]-t[3],t[6])
		table.remove(tweenReqs,tablefind(tweenReqs,t))
		if onComplete then
			onComplete()
		end
		return nil
	end
end
--]]

onUpdates = {}
onSteps = {}

function newUpdateF(f)
	--print("Created New UpdateF: "..tostring(f))
	table.insert(onUpdates,f)
	return function()
		table.remove(onUpdates,tablefind(onUpdates,f))
		return nil
	end
end

function newStepF(f)
	--print("Created New StepF: "..tostring(f))
	table.insert(onSteps,f)
	return function()
		table.remove(onSteps,tablefind(onSteps,f))
		return nil
	end
end

songPos = 0
curEventsStep = 0

updateF1 = nil

stepF1,
stepF2,
stepF3,
stepF4 = nil

events = {
	{0,function()
		makeLuaText("nice", (" THE BMS OF FIGHTERS ULTIMATE\n\n\n\n"), getSize(width), getX(0), getSize(30))
		setTextAlignment("nice", "left")
		setTextBorder("nice", 0)
		setTextSize("nice", getSize(30))
		setTextFont("nice", DFONT)
		
		makeLuaText("nice2", "\n\n" .. ("Smith au Lait \n\n\n\n"), getSize(width), getX(0), getSize(30))
		setTextAlignment("nice2", "right")
		setTextBorder("nice2", 0)
		setTextSize("nice2", getSize(30))
		setTextFont("nice2", DFONT)
		
		addLuaText("nice", true)
		addLuaText("nice2", true)
		
		stepF1 = newStepF(function()
			if (math.fmod(curStep, 32) >= 22) then
				tweenNumber(strums.bf.notesScale, "x", 1.2, 1.1, .06, nil, outCubic)
				tweenNumber(strums.bf.notesScale, "y", 1.6, 1.1, .06, nil, outCubic)
				tweenNumber(strums.bf, "padding", -21, 0, .06, nil, outCubic)
				setProperty("blackScreen.visible",true)
				setProperty("000.visible",true)
				setProperty("nice.visible",false)
				setProperty("nice2.visible",false)
				strums.bf.drunk = 0
				strums.bf.tipsy = 0
			elseif (math.fmod(curStep, 2) == 0) then
				tweenNumber(strums.bf, "padding", 13, 0, .13, nil, outCubic)
				strums.bf.notesScale.x, strums.bf.notesScale.y = 1, 1
				setProperty("blackScreen.visible",false)
				setProperty("000.visible",false)
				setProperty("nice.visible",true)
				setProperty("nice2.visible",true)
				strums.bf.drunk = 9
				strums.bf.tipsy = 9
			end
		end)
	end},
	{"s32",function()
		setTextString("nice", (" THE BMS OF FIGHTERS ULTIMATE\n\n\n\n") .. (" Music: Frums\n\n\n\n"))
		setTextString("nice2", "\n\n" .. ("Smith au Lait \n\n\n\n") .. ("Modchart: Raltyro \n\n\n\n"))
	end},
	{"s64",function()
		setTextString("nice", (" THE BMS OF FIGHTERS ULTIMATE\n\n\n\n") .. (" Music: Frums\n\n\n\n") .. (" Genre: OTHER TIME\n\n\n\n"))
		setTextString("nice2", "\n\n" .. ("Smith au Lait \n\n\n\n") .. ("Modchart: Raltyro \n\n\n\n") .. (" BPM: 179 \n\n\n\n"))
	end},
	{"s96",function()
		setProperty("blackScreen.alpha",.75)
		setProperty("000.alpha",.75)
		tweenNumber(strums.bf, "alpha", .1, 1, 1.38)
		
		setTextString("nice", (" THE BMS OF FIGHTERS ULTIMATE\n\n\n\n") .. (" Music: Frums\n\n\n\n") .. (" Genre: OTHER TIME\n\n\n\n")
			.. (" Credits\n\n\n")
		)
		setTextString("nice2", "\n\n" .. ("Smith au Lait \n\n\n\n") .. ("Modchart: Raltyro \n\n\n\n") .. (" BPM: 179 \n\n\n\n")
			.. (" help \n\n\n\n")
		)
	end},
	{"s128",function()
		stepF1()
		
		setProperty("botplayTxt.visible", getProperty("cpuControlled"))
		setTextString("botplayTxt", "[" .. face_alt .. " BOTPLAY]")
		
		strums.bf.notesScale.x, strums.bf.notesScale.y = 1, 1
		strums.bf.drunk = 9
		strums.bf.tipsy = 9
		
		setProperty("blackScreen.visible",false)
		setProperty("000.visible",false)
		setProperty("blackScreen.alpha",1)
		setProperty("000.alpha",1)
		
		removeLuaText("nice")
		removeLuaText("nice2")
		
		makeLuaText("title", " Credits", getSize(width), getX(0), getSize(30))
		setTextAlignment("title", "left")
		setTextBorder("title", 0)
		setTextSize("title", getSize(30))
		setTextFont("title", DFONT)
		
		makeLuaText("artist", "Frums ", getSize(width), getX(0), (720 - getSize(30)) - ((getSize(30 * 3) - getSize(30)) / 2))
		setTextAlignment("artist", "right")
		setTextBorder("artist", 0)
		setTextSize("artist", getSize(30))
		setTextFont("artist", DFONT)
		
		local cools1 = {
			0,
			140 - 128,
			150 - 128
		}
		local cools2 = {
			134 - 128,
			144 - 128,
		}
		local cools3 = {
			152 - 128
		}
		local cools4 = {
			132 - 128,
			138 - 128,
			148 - 128
		}
		local cools5 = {
			0,
			264 - 256,
			272 - 256,
			280 - 256
		}
		local cools6 = {
			257 - 256,
			265 - 256,
			273 - 256,
			281 - 256
		}
		local sXTween,sYTween
		
		stepF2 = newStepF(function()
			local lol = math.fmod(curStep - 128, 160 - 128)
			local lol2 = math.fmod(curStep - 128, (160 - 128) * 2)
			
			if (tablefind(cools1, lol)) then
				tweenNumber(strums.bf, "shear", 45, 0, .2, nil, outCubic)
				sXTween()
				sYTween()
			elseif (tablefind(cools2, lol)) then
				tweenNumber(strums.bf, "shear", -45, 0, .2, nil, outCubic)
				sXTween()
				sYTween()
			elseif (tablefind(cools3, lol)) then
				tweenNumber(strums.bf, "notesAngle", (lol2 == 152 - 128) and -350 or 350, 0, .74, nil, outCubic)
				tweenNumber(strums.bf, "padding", 34, 0, .8, nil, function(t, b, c, d)
					return outElastic(t, b, c, d, 2, .2)
				end)
				--tweenNumber(strums.bf.notesScale, "x", 1.4, 1, .8, nil, function(t, b, c, d)
				--	return outElastic(t, b, c, d, 2, .2)
				--end)
			elseif (tablefind(cools4, lol)) then
				sXTween = tweenNumber(strums.bf.notesScale, "x", 1, 1.4, (stepCrochet/1000) * 2, nil, inCubic, function()
					strums.bf.notesScale.x = 1
				end)
				sYTween = tweenNumber(strums.bf.notesScale, "y", 1, 1.8, (stepCrochet/1000) * 2, nil, inCubic, function()
					strums.bf.notesScale.y = 1
				end)
			end
			
			if (curStep < 384 - (152 - 128) or curStep >= 896) then
				if (lol2 == 152 - 128) then
					tweenSwitchStrumNote(1,4,.74,nil,outCubic)tweenSwitchStrumNote(2,3,.74,nil,outCubic)
					tweenSwitchStrumNote(3,2,.74,nil,outCubic)tweenSwitchStrumNote(4,1,.74,nil,outCubic)
				elseif (lol2 == 184 - 128) then
					tweenSwitchStrumNote(1,1,.74,nil,outCubic)tweenSwitchStrumNote(2,2,.74,nil,outCubic)
					tweenSwitchStrumNote(3,3,.74,nil,outCubic)tweenSwitchStrumNote(4,4,.74,nil,outCubic)
				end
			end
			
			-- i am lazy
			if (curStep < 1144) then
				if (curStep >= 256 and ((curStep < 634 or curStep >= 640) and (curStep < 764 or curStep >= 768)
				and (curStep < 892 or curStep >= 896))) then
					if (tablefind(cools5, lol)) then
						setProperty("semicircle_3.visible", true)
						setProperty("semicircle_2.visible", false)
						setProperty("semicircle_1.visible", false)
					elseif (tablefind(cools6, lol)) then
						setProperty("semicircle_3.visible", false)
						setProperty("semicircle_2.visible", true)
						setProperty("semicircle_1.visible", false)
					else
						setProperty("semicircle_3.visible", false)
						setProperty("semicircle_2.visible", false)
						setProperty("semicircle_1.visible", true)
					end
				else
					setProperty("semicircle_3.visible", false)
					setProperty("semicircle_2.visible", false)
					setProperty("semicircle_1.visible", false)
				end
			else
				setProperty("semicircle_3.visible", false)
				setProperty("semicircle_2.visible", false)
				setProperty("semicircle_1.visible", false)
			end
		end)
		
		makeLuaText("faceB", "", getSize(width), getX(0), (720 - getSize(30)) - ((getSize(30 * 3) - getSize(30)) / 2))
		setTextAlignment("faceB", "left")
		setTextBorder("faceB", 0)
		setTextSize("faceB", getSize(30))
		setTextFont("faceB", DFONT)
		
		makeLuaText("faceT", "", getSize(width), getX(0), getSize(30))
		setTextAlignment("faceT", "left")
		setTextBorder("faceT", 0)
		setTextSize("faceT", getSize(30))
		setTextFont("faceT", DFONT)
		setProperty("faceT.angle", 180)
		setProperty("faceT.visible", false)
		
		addLuaText("title", true)
		addLuaText("artist", true)
		addLuaText("faceB", true)
		addLuaText("faceT", true)
		
		local coolsFace = {}
		local curFaceStep = 0
		
		updateF1 = newUpdateF(function()
			local stepCrochet = type(stepCrochet) == "number" and stepCrochet/1000 or .5
			if curFaceStep+1 <= #coolsFace then
				for i = curFaceStep+1,#coolsFace do
					local t = coolsFace[curFaceStep+1][1]
					t = stepCrochet*t
					if songPos < t then break else
						curFaceStep = curFaceStep + 1
						
						setTextString("faceB", " " .. coolsFace[curFaceStep][2])
					end
				end
			end
			
			if (curStep >= 896) then
				if (math.fmod(songPos, stepCrochet / 4) <= stepCrochet / 2) then
					setProperty("faceT.visible", true)
					setProperty("faceB.visible", true)
				else
					setProperty("faceT.visible", false)
					setProperty("faceB.visible", false)
				end
			end
			
			if (getProperty("faceT.visible")) then setTextString("faceT", getProperty("faceB.text")) end
		end)
		
		for i = 376, 383.75, .25 do
			if (math.fmod(i, .5) == 0) then
				table.insert(coolsFace, {i, face .. " F"})
			else
				table.insert(coolsFace, {i, ""})
			end
		end
		
		local last = #coolsFace + 1
		
		tableinserts(coolsFace, {
			{384, face .. " Fun"}, {386, face .. " Funding"},
			{388, face .. " Funding for"}, {390, face .. " Funding for this"},
			{392, face .. " pro"}, {394, face .. " program"},
			{396, face .. " program was"}, {398, face .. " program was made"},
			{400, face .. " po"}, {402, face .. " possi"},
			{404, face .. " possible"}, {406, face .. " possible by"}
		})
		
		local coolI = 1
		for i = 408, 414, 2 do
			coolI = coolI + 1
			table.insert(coolsFace, {i, face .. " possible by (x" .. coolI .. ")"})
		end
		
		tableinserts(coolsFace, {
			{416, face .. " Fun"}, {418, face .. " possible by"},
		})
		
		coolI = 1
		for i = 419, 421, 1 do
			coolI = coolI + 1
			table.insert(coolsFace, {i, face .. " possible by (x" .. coolI .. ")"})
		end
		
		tableinserts(coolsFace, {
			{422, face .. " Funding"},
			{424, face .. " possible by"}
		})
		
		coolI = 1
		for i = 425, 427, 1 do
			coolI = coolI + 1
			table.insert(coolsFace, {i, face .. " possible by" .. strthing(down_arrow, coolI) .. " (x" .. coolI .. ")"})
		end
		
		tableinserts(coolsFace, {
			{428, face .. " Funding for"},
			{430, face .. " Funding for this"},
		})
		
		coolI = 1
		for i = 430.25, 431.75, .25 do
			coolI = coolI + 1
			table.insert(coolsFace, {i, face .. " Funding for thi" .. strthing("i", coolI)})
		end
		
		tableinserts(coolsFace, {
			{432, face .. " pro"},{434, face .. " program"},
			{436, face .. " pro"},{438, face .. " program"},
			{440, face .. " pro"},{441, face .. " pro (x2)"},{442, face .. " pro (x3)"},{443, face .. " pro (x4)"},
			{444, face .. " prog"},{445, face .. " progr"},{446, face .. " program"},
			{448, face .. " Fun"},{450, face .. " Funding"},{452, face .. " Funding for"},
			{454, face .. " possible by"},{456, face .. " possible by (x2)"},{458, face .. " program was made"},
			{460, face .. " po"},{462, face .. " possi"},
			{464, face .. " possible"},{465, face .. " possible by"},
			{466, face .. " view"},{468, face .. " viewers"}
		})
		
		for i = 470, 506, 6 do
			tableinserts(coolsFace, {
				{i, face .. " viewers like"},
				{i + 2, face .. " viewers like you."}
			})
		end
		
		tableinserts(coolsFace, {
			{510, face .. " Fu"},{511, face .. " Fu (x2)"}
		})
		
		for i = last, #coolsFace - 4 do
			table.insert(coolsFace, {coolsFace[i][1] + (512 - 384), coolsFace[i][2]})
		end
		
		tableinserts(coolsFace, {
			{636, face .. " Broad"},{638, face .. " Broadcast"},
		})
		
		for i = 640, 736, 672 - 640 do
			local cool = 0
			for _ = 1, i == 704 and 4 or (i == 736 and 2 or 3) do
				tableinserts(coolsFace, {
					{i + cool, face_alt .. (((i == 672 and cool == 0) or ((i == 704 and cool ~= 0) or (i == 736 and cool ~= 0))) and " Cor" .. ((i == 704 and cool == 8) and down_arrow or "") .. " (x3)" or " Cor")},
					{i + cool + 2, face_alt .. " Corpo" .. ((i == 704 and cool == 8) and down_arrow or "")},
					{i + cool + 3, face_alt .. " Corpora" .. ((i == 704 and cool == 8) and down_arrow or "")},
					{i + cool + 5, face_alt .. " Corporation" .. ((i == 704 and cool == 8) and down_arrow or "")}
				})
				
				if (i >= 704) then
					tableinserts(coolsFace, {
						{i + cool + 6, face_alt .. " Cor" .. (cool == 8 and down_arrow or "")},
						{i + cool + 7, face_alt .. " Cor" .. (cool == 8 and down_arrow or "") .. " (x2)"},
					})
				end
				
				cool = cool + 8
			end
			
			if (i == 640) then
				tableinserts(coolsFace, {
					{i + (664 - 640), face_alt .. " Cor"},
					{i + (666 - 640), face_alt .. " Corpo"},
					{i + (667 - 640), face_alt .. " Cor"},
					{i + (669 - 640), face_alt .. " Corpo"},
					{i + (670 - 640), face_alt .. " Cor"},
					{i + (671 - 640), face_alt .. " Cor (x2)"}
				})
			elseif (i == 672) then
				tableinserts(coolsFace, {
					{i + (696 - 672), face_alt .. " Cor"},
					{i + (698 - 672), face_alt .. " Corpo"},
					{i + (699 - 672), face_alt .. " Corpo (x2)"},
					{i + (700 - 672), face_alt .. " Cor"},
					{i + (701 - 672), face_alt .. " Corpo"},
					{i + (702 - 672), face_alt .. " Corpo (x2)"},
					{i + (703 - 672), face_alt .. " Cor"},
					{i + (703.5 - 672), face_alt .. " Corpo"}
				})
			elseif (i == 736) then
				tableinserts(coolsFace, {
					{i + (752 - 736), face_alt .. " Cor (x3)"},
					{i + (753 - 736), face_alt .. " Corpo"},
					{i + (754 - 736), face_alt .. " Corpora"},
					{i + (755 - 736), face_alt .. " Cor"},
					{i + (756 - 736), face_alt .. " Corpo"},
					{i + (757 - 736), face_alt .. " Corpora"},
					{i + (758 - 736), face_alt .. " Cor"},
					{i + (759 - 736), face_alt .. " Corpo"},
					{i + (760 - 736), face_alt .. " Corpora"},
					{i + (761 - 736), face_alt .. " Cor"},
					{i + (762 - 736), face_alt .. " Corpo"},
					{i + (763 - 736), face_alt .. " Corpora"},
				})
			end
		end
		
		tableinserts(coolsFace, {
			{764, face_alt .. " Corporat"},{765, face_alt .. " Corporati"},
			{766, face_alt .. " Corporatio"},{767, face_alt .. " Corporation"},
		})
		
		for i = 768, 864, 800 - 768 do
			local cool = (math.fmod(i - 768, (800 - 768) * 2) == 0)
			tableinserts(coolsFace, {
				{i + 0, face_alt .. (i >= 800 and " Cor (x3)" or " Cor")},{i + (769 - 768), face_alt .. " Corpo"},{i + (770 - 768), face_alt .. " Corpora"},
				{i + (771 - 768), face_alt .. " Cor"},{i + (772 - 768), face_alt .. " Corpo"},
				{i + (773 - 768), face_alt .. " Cor"},{i + (774 - 768), face_alt .. " Corpo"},{i + (775 - 768), face_alt .. " Corpora"},
				{i + (776 - 768), face_alt .. " Cor"},{i + (777 - 768), face_alt .. " Corpo"},{i + (778 - 768), face_alt .. " Corpora"},
				{i + (779 - 768), face_alt .. " Cor"},{i + (780 - 768), face_alt .. " Corpo"},
				{i + (781 - 768), face_alt .. " Cor"},{i + (782 - 768), face_alt .. " Corpo"},{i + (783 - 768), face_alt .. " Corpora"},
				{i + (784 - 768), face_alt .. " Cor"},{i + (785 - 768), face_alt .. " Corpo"},{i + (786 - 768), face_alt .. " Corpora"},
				{i + (787 - 768), face_alt .. " Cor"},{i + (788 - 768), face_alt .. " Corpo"},
				{i + (789 - 768), face_alt .. " Cor"},{i + (790 - 768), face_alt .. " Corpo"},{i + (791 - 768), face_alt .. " Corpora"},
			})
			
			if (cool) then
				tableinserts(coolsFace, {
					{i + (792 - 768), face_alt .. " Cor"},{i + (793 - 768), face_alt .. " Corpo"},
					{i + (794 - 768), face_alt .. " Cor"},{i + (795 - 768), face_alt .. " Corpo"},
					{i + (796 - 768), face_alt .. " Cor"},{i + (797 - 768), face_alt .. " Corpo"},
					{i + (798 - 768), face_alt .. " Cor"},{i + (799 - 768), face_alt .. " Cor (x2)"},
				})
			elseif (i >= 864) then
				tableinserts(coolsFace, {
					{i + (792 - 768), face_alt .. " Cor"},{i + (793 - 768), face_alt .. " Corpo"},
					{i + (794 - 768), face_alt .. " Cor"},{i + (795 - 768), face_alt .. " Corpo"}
				})
				
				coolI = 1
				for i = 892, 896, 1 / 3 do
					table.insert(coolsFace, {i, face_alt .. " Corpora" .. strthing("t", coolI)})
					coolI = coolI + 1
				end
			else
				tableinserts(coolsFace, {
					{i + (824 - 800), face_alt .. " Cor"},{i + (825 - 800), face_alt .. " Corpo"},
					{i + (826 - 800), face_alt .. " Cor"},{i + (827 - 800), face_alt .. " Corpo"},
					{i + (828 - 800), face_alt .. " Corporat"},{i + (828.5 - 800), face_alt .. " Corporati"},
					{i + (829 - 800), face_alt .. " Corporatio"},{i + (829.5 - 800), face_alt .. " Corporation"},
					{i + (830 - 800), face_alt .. " Cor"},{i + (831 - 800), face_alt .. " Cor (x2)"}
				})
			end
		end
		
		tableinserts(coolsFace, {
			{896, face_alt .. "        tion"},
			{912, face_alt .. "         ion"},
			{928, face_alt .. "          on"},
			{944, face_alt .. "           n"},
			{960, ""}
		})
	end},
	{"s374",function()
		-- column swaps >:3
		local nice = 1
		local cools = {
			{376,{2,3,4,1}},
			{378,{3,4,1,2}},
			{380,{4,1,2,3}},
			{382,{1,2,4,3}},
			{384,{1,2,3,4}}
		}
		
		stepF3 = newStepF(function()
			if (nice > #cools) then return stepF3() end
			
			while nice <= #cools and curStep > cools[nice][1] do
				local cool = cools[nice][2]
				
				for i,v in pairs(strums.bf.notes) do
					switchStrumNote(i,cool[i])
				end
				
				nice = nice + 1
			end
		end)
	end},
	{"s408",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s410",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s412",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s414",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s416",function()tweenNumber(strums.bf.notesScale, "x", 2, 1, .2, nil, outCubic)end},
	
	{"s418",function()switchStrumNote(2,1)switchStrumNote(1,2)end},
	{"s419",function()switchStrumNote(2,2)switchStrumNote(1,1)end},
	{"s420",function()switchStrumNote(2,1)switchStrumNote(1,2)end},
	{"s421",function()switchStrumNote(2,2)switchStrumNote(1,1)end},
	
	{"s424",function()strums.bf.notes[4].y = strums.bf.notes[4].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s425",function()strums.bf.notes[3].y = strums.bf.notes[3].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s426",function()strums.bf.notes[2].y = strums.bf.notes[2].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s427",function()strums.bf.notes[3].y = strums.bf.notes[3].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s428",function()switchStrumNote(2,2)switchStrumNote(3,3)switchStrumNote(4,4)songSpeed = dSongSpeed end},
	{"s430",function()stepF4 = newUpdateF(function()switchStrumNote(2,2) strums.bf.notes[2].y = strums.bf.notes[2].y + math.random(-64,64)end)end},
	{"s432",function()stepF4()switchStrumNote(2,2)
		tweenNumber(strums.bf, "padding", 0, -32, (stepCrochet / 1000) * (447 - 432), nil, nil, function()
			tweenNumber(strums.bf, "padding", -32, 0, .7, nil, function(t, b, c, d)
				return outElastic(t, b, c, d, 2, .2)
			end)
		end)
	end},
	
	{"s472",function()tweenSwitchStrumNote(1,2,.6,nil,outCubic)tweenSwitchStrumNote(2,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s478",function()tweenSwitchStrumNote(4,2,.6,nil,outCubic)tweenSwitchStrumNote(1,4,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s484",function()tweenSwitchStrumNote(2,2,.6,nil,outCubic)tweenSwitchStrumNote(4,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s490",function()tweenSwitchStrumNote(4,2,.6,nil,outCubic)tweenSwitchStrumNote(2,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s496",function()tweenSwitchStrumNote(2,2,.6,nil,outCubic)tweenSwitchStrumNote(4,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s502",function()tweenSwitchStrumNote(1,1,.6,nil,outCubic)tweenSwitchStrumNote(2,2,.6,nil,outCubic)
	tweenSwitchStrumNote(3,3,.6,nil,outCubic)tweenSwitchStrumNote(4,4,.6,nil,outCubic)
	tweenNumber(nil, "songSpeed", songSpeed, dSongSpeed, .6, nil, outCubic)end},
	
	{"s536",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s538",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s540",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s542",function()tweenNumber(strums.bf.notesScale, "y", 2, 1, .2, nil, outCubic)end},
	{"s544",function()tweenNumber(strums.bf.notesScale, "x", 2, 1, .2, nil, outCubic)end},
	
	{"s546",function()switchStrumNote(2,1)switchStrumNote(1,2)end},
	{"s547",function()switchStrumNote(2,2)switchStrumNote(1,1)end},
	{"s548",function()switchStrumNote(2,1)switchStrumNote(1,2)end},
	{"s549",function()switchStrumNote(2,2)switchStrumNote(1,1)end},
	
	{"s552",function()strums.bf.notes[4].y = strums.bf.notes[4].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s553",function()strums.bf.notes[3].y = strums.bf.notes[3].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s554",function()strums.bf.notes[2].y = strums.bf.notes[2].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s555",function()strums.bf.notes[3].y = strums.bf.notes[3].y + 64 songSpeed = songSpeed / 1.25 end},
	{"s556",function()switchStrumNote(2,2)switchStrumNote(3,3)switchStrumNote(4,4)songSpeed = dSongSpeed end},
	{"s558",function()stepF4 = newUpdateF(function()switchStrumNote(2,2) strums.bf.notes[2].y = strums.bf.notes[2].y + math.random(-64,64)end)end},
	{"s560",function()stepF4()switchStrumNote(2,2)
		tweenNumber(strums.bf, "padding", 0, -32, (stepCrochet / 1000) * (447 - 432), nil, nil, function()
			tweenNumber(strums.bf, "padding", -32, 0, .7, nil, function(t, b, c, d)
				return outElastic(t, b, c, d, 2, .2)
			end)
		end)
	end},
	
	{"s600",function()tweenSwitchStrumNote(1,2,.6,nil,outCubic)tweenSwitchStrumNote(2,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s606",function()tweenSwitchStrumNote(4,2,.6,nil,outCubic)tweenSwitchStrumNote(1,4,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s612",function()tweenSwitchStrumNote(2,2,.6,nil,outCubic)tweenSwitchStrumNote(4,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s618",function()tweenSwitchStrumNote(4,2,.6,nil,outCubic)tweenSwitchStrumNote(2,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s624",function()tweenSwitchStrumNote(2,2,.6,nil,outCubic)tweenSwitchStrumNote(4,1,.6,nil,outCubic)songSpeed = songSpeed / 1.1 end},
	{"s630",function()tweenSwitchStrumNote(1,1,.6,nil,outCubic)tweenSwitchStrumNote(2,2,.6,nil,outCubic)
	tweenSwitchStrumNote(3,3,.6,nil,outCubic)tweenSwitchStrumNote(4,4,.6,nil,outCubic)
	songSpeed = songSpeed / 1.1 end},
	
	{"s632",function()tweenNumber(strums.bf.notesScale, "x", 1, 0, .2, nil, linear)
	tweenNumber(strums.bf.notesScale, "y", 1, 0, .2, nil, linear)
	tweenNumber(strums.bf, "notesOffsetMS", 0, stepCrochet * 8, .2, nil, inCubic)
	tweenNumber(nil, "songSpeed", songSpeed, 2, .2, nil, inCubic)end},
	
	{"s640",function()
		strums.bf.notesScale.x = 1
		strums.bf.notesScale.y = 1
		strums.bf.notesOffsetMS = 0
		songSpeed = dSongSpeed
	end},
	
	{"s764",function()
		tweenNumber(nil, "songSpeed", songSpeed, 2.7, .2, nil, outCubic)
	end},
	{"s768",function()
		setProperty("faceT.visible", true)
	end},
	
	{"s892",function()
		tweenNumber(nil, "songSpeed", songSpeed, 20, (stepCrochet / 1000) * 4, nil, outCubic)
		veryCool = strums.bf.y
		tweenNumber(strums.bf, "y", veryCool, veryCool - (downscroll and -500 or 500), (stepCrochet / 1000) * 4, nil, outCubic)
	end},
	
	{"s896",function()
		tweenNumber(nil, "songSpeed", songSpeed, dSongSpeed, .01)
		tweenNumber(strums.bf, "y", strums.bf.y, veryCool, .01)
	end},
	
	{"s1144",function()
		tweenNumber(strums.bf, "poosh", 0, 24, 1.2, nil, outCubic)
		setProperty("artist.visible", false)setProperty("title.visible", false)
		setProperty("topBar.visible", false)setProperty("bottomBar.visible", false)
		setProperty("botplayTxt.visible", false)setProperty("accuracyPercent.visible", false)
		removeLuaText("semicircle_1", false)
		removeLuaText("semicircle_2", false)
		removeLuaText("semicircle_3", false)
		stepF2()
	end}
}

function eventsTick()
	if (not getProperty("startingSong") and not getProperty("endingSong")) then
		local stepCrochet = type(stepCrochet) == "number" and stepCrochet/1000 or .5
		if curEventsStep+1 <= #events then
			for i = curEventsStep+1,#events do
				local t = events[curEventsStep+1][1]
				t = type(t) == "string" and t:sub(1,1) == "s" and (stepCrochet*tonumber(t:sub(2,256))) or t
				if songPos < t then break else
					curEventsStep = curEventsStep + 1
					print("Passed Event #"..curEventsStep)
					events[curEventsStep][2]()
				end
			end
		end
	end
end

function updates()
	if (not getProperty("startingSong") and not getProperty("endingSong")) then
		for i,v in pairs(onUpdates) do
			coroutine.wrap(v)()
		end
	end
end

function steps()
	if (not getProperty("startingSong") and not getProperty("endingSong")) then
		for i,v in pairs(onSteps) do
			coroutine.wrap(v)()
		end
	end
end

function initializeStrums()
	strums.dad.width = 0
	strums.dad.height = 0
	
	strums.bf.width = 0
	strums.bf.height = 0
	
	local x0,x1,y0,y1
	local x2,y2,x3,y3
	x0, x1 = math.huge, -math.huge
	y0, y1 = math.huge, -math.huge
	for i = 0, getProperty("opponentStrums.members.length") - 1 do
		x2 = getPropertyFromGroup("opponentStrums", i, "x")
		y2 = getPropertyFromGroup("opponentStrums", i, "y")
		
		x3 = getPropertyFromGroup("opponentStrums", i, "width")
		y3 = getPropertyFromGroup("opponentStrums", i, "height")
		
		local note = tablecopy(templateNote)
		note.visualID = i + 1
		
		note.x = x2 + (x3 / 2)
		note.y = y2 + (y3 / 2) + 23
		
		note.width = x3
		note.height = y3
		
		strums.dad.notes[note.visualID] = note
		
		x0 = x2 < x0 and x2 or x0
		y0 = y2 < y0 and y2 or y0
		
		x3 = x3 + x2; x1 = x3 > x1 and x3 or x1
		y3 = y3 + y2; y1 = y3 > y1 and y3 or y1
	end
	
	strums.dad.width = math.abs(x1 - x0)
	strums.dad.height = 720--math.abs(y1 - y0)
	
	strums.dad.x = x0 + (strums.dad.width / 2)
	strums.dad.y = y0 + (strums.dad.height / 2)
	
	for _,note in pairs(strums.dad.notes) do
		note.x = note.x - x0
		note.y = note.y - y0
	end
	
	x0, x1 = math.huge, -math.huge
	y0, y1 = math.huge, -math.huge
	for i = 0, getProperty("playerStrums.members.length") - 1 do
		x2 = getPropertyFromGroup("playerStrums", i, "x")
		y2 = getPropertyFromGroup("playerStrums", i, "y")
		
		x3 = getPropertyFromGroup("playerStrums", i, "width")
		y3 = getPropertyFromGroup("playerStrums", i, "height")
		
		local note = tablecopy(templateNote)
		note.visualID = i + 1
		
		note.x = x2 + (x3 / 2)
		note.y = y2 + (y3 / 2) + 23
		
		note.width = x3
		note.height = y3
		
		strums.bf.notes[note.visualID] = note
		
		x0 = x2 < x0 and x2 or x0
		y0 = y2 < y0 and y2 or y0
		
		x3 = x3 + x2; x1 = x3 > x1 and x3 or x1
		y3 = y3 + y2; y1 = y3 > y1 and y3 or y1
	end
	
	strums.bf.width = math.abs(x1 - x0)
	strums.bf.height = 720--math.abs(y1 - y0)
	
	strums.bf.x = x0 + (strums.bf.width / 2)
	strums.bf.y = y0 + (strums.bf.height / 2)
	
	for _,note in pairs(strums.bf.notes) do
		note.x = note.x - x0
		note.y = note.y - y0
	end
	
	strums.isReady = true
	
	defaultStrums = tablecopy(strums)
end

function initializeVars()
	dSongSpeed = getProperty("songSpeed")
	songSpeed = dSongSpeed
	
	varsReady = true
end

function updateStrums()
	if (not strums.isReady) then return end
	
	if (varsReady) then setProperty("songSpeed", songSpeed) end
	
	if (strums.dad.visible) then
		local strum = strums.dad
		
		local dadStrumX = strum.x - (strum.width / 2)
		local dadStrumY = strum.y - (strum.height / 2)
		
		for i = 0, getProperty("opponentStrums.members.length") - 1 do
			local fixedI = i + 1
			local note = strum.notes[fixedI]
			local visualI = note.visualID
			
			local x = note.x
				+ (math.cos((songPos + (visualI * .4)) * 3) * strum.drunk)
				+ (strum.padding * (visualI - 2.5))
				+ (math.sin((strum.pooshseed + strum.poosh + (i * 12)) * 2.3) * strum.poosh * 8)
			
			local y = note.y
				+ (math.cos((songPos + (visualI * .4) + 1) * 3.2) * strum.tipsy)
				+ (strum.shear * (visualI - 2.5))
				+ (math.cos((strum.pooshseed + strum.poosh + (i * 12)) * 2.3) * strum.poosh * 4)
			
			local angle = note.angle
				+ (strum.poosh + (math.cos((strum.poosh + strum.pooshseed) * .02) * 1000 * mathclamp(strum.poosh / 1000, 0, 1)))
			
			setPropertyFromGroup("opponentStrums", i, "visible", note.visible)
			setPropertyFromGroup("opponentStrums", i, "alpha", note.alpha * strum.alpha)
			setPropertyFromGroup("opponentStrums", i, "x", (x - (note.width / 2)) + dadStrumX)
			setPropertyFromGroup("opponentStrums", i, "y", (y - (note.height / 2)) + dadStrumY)
			setPropertyFromGroup("opponentStrums", i, "angle", note.angle + strum.notesAngle)
			setPropertyFromGroup("opponentStrums", i, "scale.x", note.scale.x * strum.notesScale.x)
			setPropertyFromGroup("opponentStrums", i, "scale.y", note.scale.y * strum.notesScale.y)
		end
	else
		for i = 0, getProperty("opponentStrums.members.length") - 1 do
			setPropertyFromGroup("opponentStrums", i, "visible", false)
		end
	end
	
	if (strums.bf.visible) then
		local strum = strums.bf
		
		local bfStrumX = strum.x - ((strum.width / 2) * strum.scale.x)
		local bfStrumY = strum.y - ((strum.height / 2) * strum.scale.y)
		
		for i = 0, getProperty("playerStrums.members.length") - 1 do
			local fixedI = i + 1
			local note = strum.notes[fixedI]
			local visualI = note.visualID
			
			local x = note.x
				+ (math.cos((songPos + (visualI * .4)) * 3) * strum.drunk)
				+ (strum.padding * (visualI - 2.5))
				+ (math.sin((strum.pooshseed + strum.poosh + (i * 12)) * 2.3) * strum.poosh * 8)
			
			local y = note.y
				+ (math.cos((songPos + (visualI * .4) + 1) * 3.2) * strum.tipsy)
				+ (strum.shear * (visualI - 2.5))
				+ (math.cos((strum.pooshseed + strum.poosh + (i * 12)) * 2.3) * strum.poosh * 4)
			
			local angle = note.angle
				+ (strum.poosh + (math.cos((strum.poosh + strum.pooshseed) * .02) * 1000 * mathclamp(strum.poosh / 1000, 0, 1)))
			
			setPropertyFromGroup("playerStrums", i, "visible", note.visible)
			setPropertyFromGroup("playerStrums", i, "alpha", note.alpha * strum.alpha)
			setPropertyFromGroup("playerStrums", i, "x", ((x - (note.width / 2)) * strum.scale.x) + bfStrumX)
			setPropertyFromGroup("playerStrums", i, "y", ((y - (note.height / 2)) * strum.scale.y) + bfStrumY)
			setPropertyFromGroup("playerStrums", i, "angle", angle + strum.notesAngle)
			setPropertyFromGroup("playerStrums", i, "scale.x", note.scale.x * strum.scale.x * strum.notesScale.x)
			setPropertyFromGroup("playerStrums", i, "scale.y", note.scale.y * strum.scale.y * strum.notesScale.y)
		end
		
		if (not getProperty("startingSong")) then
			for i = 0, getProperty("notes.length") - 1 do
				setPropertyFromGroup('notes', i, 'offsetY', math.sin(90 * math.pi / 180) * (0.45 * (downscroll and -strum.notesOffsetMS or strum.notesOffsetMS) * getProperty("songSpeed")))
			end
		end
	else
		for i = 0, getProperty("playerStrums.members.length") - 1 do
			setPropertyFromGroup("playerStrums", i, "visible", false)
		end
	end
end

function onCreatePost()
	initializeStrums()
	initializeVars()
	
	makeLuaSprite("leftBlack")
	makeGraphic("leftBlack", (1280 - (width * (720 / height))) / 2, 720, "050505")
	setScrollFactor("leftBlack", 0, 0)
	setObjectCamera("leftBlack", "camOther")
	
	makeLuaSprite("rightBlack")
	makeGraphic("rightBlack", (1280 - (width * (720 / height))) / 2, 720, "050505")
	setScrollFactor("rightBlack", 0, 0)
	setObjectCamera("rightBlack", "camOther")
	setProperty("rightBlack.x", ((1280 - (width * (720 / height))) / 2) + (width * (720 / height)))
	
	makeLuaSprite("blackScreen")
	makeGraphic("blackScreen", 1280, 720, "000000")
	setScrollFactor("blackScreen", 0, 0)
	setObjectCamera("blackScreen", "camHud")
	scaleObject("blackScreen", 10, 10)
	updateHitbox("blackScreen")
	screenCenter("blackScreen")
	
	makeLuaSprite("bg")
	makeGraphic("bg", 1280, 720, "000000")
	setScrollFactor("bg", 0, 0)
	scaleObject("bg", 10, 10)
	updateHitbox("bg")
	screenCenter("bg")
	
	addLuaSprite("leftBlack", true)
	addLuaSprite("rightBlack", true)
	addLuaSprite("bg", true)
	addLuaSprite("blackScreen", true)
	
	
	
	
	--letsgo
	makeLuaSprite("topBar")
	makeGraphic("topBar", 1280, getSize(30 * 3), "000000")
	setScrollFactor("topBar", 0, 0)
	setObjectCamera("topBar", "camHud")
	setProperty("topBar.alpha", .5)
	
	makeLuaSprite("bottomBar")
	makeGraphic("bottomBar", 1280, getSize(30 * 3), "000000")
	setScrollFactor("bottomBar", 0, 0)
	setObjectCamera("bottomBar", "camHud")
	setProperty("bottomBar.y", 720 - getSize(30 * 3))
	setProperty("bottomBar.alpha", .5)
	
	makeLuaText("000", strthing("0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n", 9), getSize(width), getX(0), 0)
	setTextBorder("000", 0)
	setTextSize("000", getSize(30))
	setTextFont("000", DFONT)
	setProperty("000.visible",false)
	
	newUpdateF(function()
		if (getProperty("000.visible")) then
			setObjectOrder("000",999999999)
			if (math.fmod(curStep, 2) == 0) then
				setTextString("000", strthing("0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n", 9))
			else
				setTextString("000", strthing(" 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n", 9))
			end
		end
	end)
	
	makeLuaText("semicircle_1", semicircle_1, getSize(width), getX(30 / 1.5), getY(30 * 4.625))
	setTextAlignment("semicircle_1", "left")
	setTextBorder("semicircle_1", 0)
	setTextSize("semicircle_1", getSize(30))
	setTextFont("semicircle_1", DFONT)
	setProperty("semicircle_1.visible", false)
	
	makeLuaText("semicircle_2", semicircle_2, getSize(width), getX(30 / 1.5), getY(30 * 4.625))
	setTextAlignment("semicircle_2", "left")
	setTextBorder("semicircle_2", 0)
	setTextSize("semicircle_2", getSize(30))
	setTextFont("semicircle_2", DFONT)
	setProperty("semicircle_2.visible", false)
	
	makeLuaText("semicircle_3", semicircle_3, getSize(width), getX(30 / 1.5), getY(30 * 4.625))
	setTextAlignment("semicircle_3", "left")
	setTextBorder("semicircle_3", 0)
	setTextSize("semicircle_3", getSize(30))
	setTextFont("semicircle_3", DFONT)
	setProperty("semicircle_3.visible", false)
	
	addLuaSprite("topBar", true)
	addLuaSprite("bottomBar", true)
	addLuaText("000", true)
	addLuaText("semicircle_1", true)
	addLuaText("semicircle_2", true)
	addLuaText("semicircle_3", true)
end

function onStepHit()
	updates()
	tnTick()
	eventsTick()
	steps()
end

function onUpdate(dt)
	songPos = getPropertyFromClass("Conductor","songPosition")/1000
	
	if (curStep >= 128) then
		setTextString("accuracyPercent", tostring(truncate(getProperty("ratingPercent") * 100)) .. "%")
		setProperty("accuracyPercent.visible", not getProperty("cpuControlled"))
	end
	
	updates()
	tnTick()
	updateStrums()
	eventsTick()
end

function onSongStart()
	strums.dad.visible = false
	
	strums.bf.y = downscroll and strums.bf.y - 108 or strums.bf.y + 64
	strums.bf.alpha = .1
	strums.bf.x = 1280 / 2
	strums.bf.drunk = 9
	strums.bf.tipsy = 9
	
	updateStrums()
	
	setProperty("healthBarBG.visible",false)
	setProperty("healthBar.visible",false)
	setProperty("iconP1.visible",false)
	setProperty("iconP2.visible",false)
	setProperty("scoreTxt.visible",false)
	setProperty("timeBarBG.visible",false)
	setProperty("timeBar.visible",false)
	
	setObjectOrder("timeTxt",999999999)
	setObjectCamera("timeTxt","camHud")
	setTextFont("timeTxt",DFONT)
	setTextSize("timeTxt",getSize(28))
	setProperty("timeTxt.x",0)
	setProperty("timeTxt.y",getSize(1))
	setProperty("timeTxt.fieldWidth", 1280)
	
	-- I DONT LIKE HOW TIMETXT IS NOT CNETERED 🤮🤮🤮🤮🤮🤮🤮
	
	setObjectOrder("botplayTxt",999999999)
	setObjectCamera("botplayTxt","camHud")
	setTextFont("botplayTxt",DFONT)
	setTextSize("botplayTxt",getSize(28))
	setTextString("botplayTxt", "")
	setProperty("botplayTxt.x", 0)
	setProperty("botplayTxt.y", downscroll and getSize(96) or 720 - getSize(96 + 28))
	setProperty("botplayTxt.fieldWidth", 1280)
	
	makeLuaText("accuracyPercent", "100%", 1280, 0, downscroll and getSize(96) or 720 - getSize(96 + 28))
	setTextSize("accuracyPercent", getSize(28))
	setTextBorder("accuracyPercent", 0)
	setTextFont("accuracyPercent", DFONT)
	
	addLuaText("accuracyPercent")
	setObjectOrder("accuracyPercent",999999999)
	setObjectCamera("accuracyPercent","camHud")
	
	setProperty("timeTxt.visible", false)
	setProperty("accuracyPercent.visible", false)
	setProperty("botplayTxt.visible", false)
	
	setProperty("blackScreen.visible",false)
end