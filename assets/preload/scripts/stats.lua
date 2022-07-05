-- script by andrewidot

-- please note, I have no fucking clue what im doing here savefile wise because of no wiki documentation of the save data functions, im just going off some code I saw
-- enjoy my spaghetii code
-- ps ignore most comments, I used them to just look through my code easier

-- bullshit to not memory leak
local antibotplaylooplol = 0
local antipracticemodelooplol = 0
-- a

local allowCountdown = false

-- values for the actual menu
local song = 0
local misses = 0
local sicks = 0
local goods = 0
local bads = 0
local shits = 0
local accuracy = 0
local songscore = 0
local died = 0
local botplay = 0
local practice = 0
local color = 0
local noteshit = 0
-- s

function onCreate()
	initSaveData('songInfo')
	if songName == 'Last Song Stats' then -- loading the actual values into the song stat bullshit
	
		precacheImage('characters/BOYFRIEND')
		precacheMusic('offsetSong')

		color = getRandomColor()

		function onStartCountdown()
			if not allowCountdown then --Block the countdown
				return Function_Stop;
			end
			return Function_Continue;
		end
		-- spaghetii start
		if getDataFromSave('songInfo', 'score') == 'score' then
			local default = 1
			setDataFromSave('songInfo', 'score', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'accuracy') == 'accuracy' then
			local default = 1
			setDataFromSave('songInfo', 'accuracy', default)
			flushSaveData('songInfo')
		end
	
		if getDataFromSave('songInfo', 'misses') == 'misses' then
			local default = 1
			setDataFromSave('songInfo', 'misses', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'sicks') == 'sicks' then
			local default = 1
			setDataFromSave('songInfo', 'sicks', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'goods') == 'goods' then
			local default = 1
			setDataFromSave('songInfo', 'goods', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'bads') == 'bads' then
			local default = 1
			setDataFromSave('songInfo', 'bads', default)
			flushSaveData('songInfo')
		end

		if getDataFromSave('songInfo', 'shits') == 'shits' then
			local default = 1
			setDataFromSave('songInfo', 'shits', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'died') == 'died' then
			local default = 1
			setDataFromSave('songInfo', 'died', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'botplay') == 'botplay' then
			local default = 1
			setDataFromSave('songInfo', 'botplay', default)
			flushSaveData('songInfo')
		end	
		
		if getDataFromSave('songInfo', 'songPlayed') == 'songPlayed' then
			local default = 1
			setDataFromSave('songInfo', 'songPlayed', default)
			flushSaveData('songInfo')
		end
		
		if getDataFromSave('songInfo', 'practice') == 'practice' then
			local default = 1
			setDataFromSave('songInfo', 'practice', default)
			flushSaveData('songInfo')
		end
		
		playMusic('offsetSong', 1, true)
		
		-- spaghetii over
		
		-- value setting for the menu
		
		sicks = getDataFromSave('songInfo', 'sicks')
		goods = getDataFromSave('songInfo', 'goods')
		bads = getDataFromSave('songInfo', 'bads')
		shits = getDataFromSave('songInfo', 'shits')
		botplay = getDataFromSave('songInfo', 'botplay')
		died = getDataFromSave('songInfo', 'died')
		song = getDataFromSave('songInfo', 'songPlayed')
		practice = getDataFromSave('songInfo', 'practice')
		songscore = getDataFromSave('songInfo', 'score')
		accuracy = getDataFromSave('songInfo', 'accuracy')
		misses = getDataFromSave('songInfo', 'misses')
		noteshit = getDataFromSave('songInfo', 'noteshit')
		
		-- value setting over
		
		-- sprites n shit
		
			-- generic bullshit
		
		makeLuaSprite('epicbg', 'menuDesat', 0, 0)
		screenCenter('epicbg', 'xy')
		setObjectCamera('epicbg', 'other')
		
		makeLuaText('esctoleave', 'Press Escape to leave this menu.', 400, 875, 600)
		setTextSize('esctoleave', 30)	
		setObjectCamera('esctoleave', 'other')
	
		doTweenColor('bgcolor', 'epicbg', color, 0.00001, 'linear')

			-- ratings n bull
			
		-- sick
			
		makeLuaSprite('sick', 'sick', 75, 100)
		scaleObject('sick', 0.5, 0.5)
		updateHitbox('sick')
		setObjectCamera('sick', 'other')
		
		makeLuaText('sicks', 'x'..sicks, 100, 110, 200)
		setTextSize('sicks', 25)	
		setObjectCamera('sicks', 'other')
		
		-- good
		
		makeLuaSprite('good', 'good', 425, 90)
		scaleObject('good', 0.6, 0.6)
		updateHitbox('good')
		setObjectCamera('good', 'other')
		
		makeLuaText('goods', 'x'..goods, 100, 460, 200)
		setTextSize('goods', 25)	
		setObjectCamera('goods', 'other')
		
		-- bad
		
		makeLuaSprite('bad', 'bad', 75, 300)
		scaleObject('bad', 0.7, 0.7)
		updateHitbox('bad')
		setObjectCamera('bad', 'other')
		
		makeLuaText('bads', 'x'..bads, 100, 110, 400)
		setTextSize('bads', 25)	
		setObjectCamera('bads', 'other')
	
		-- shit		
	
		makeLuaSprite('shit', 'shit', 435, 290)
		scaleObject('shit', 0.6, 0.6)
		updateHitbox('shit')
		setObjectCamera('shit', 'other')
		
		makeLuaText('shits', 'x'..shits, 100, 460, 400)
		setTextSize('shits', 25)	
		setObjectCamera('shits', 'other')
		
			-- practice mode, botplay, if you died n some other shit
		
		makeLuaText('song', 'Song Played:\n'..song, 400, 875, 80)
		setTextSize('song', 30)	
		setObjectCamera('song', 'other')
		
		makeLuaText('botplay', 'Was Botplay used?: '..botplay, 400, 875, 225)
		setTextSize('botplay', 30)	
		setObjectCamera('botplay', 'other')
		
		makeLuaText('practice', 'Was Practice Mode used?: '..practice, 400, 875, 150)
		setTextSize('practice', 30)	
		setObjectCamera('practice', 'other')
		
		makeLuaText('dieded', 'Did you die?: '..died, 400, 875, 275)
		setTextSize('dieded', 30)	
		setObjectCamera('dieded', 'other')
		
			-- score n stuff
		
		makeLuaText('score', 'Score: '..songscore, 400, -50, 550)
		setTextSize('score', 30)	
		setObjectCamera('score', 'other')
		
		makeLuaText('accu', 'Accuracy: %'..round((accuracy), 2), 400, 295, 550)
		setTextSize('accu', 30)	
		setObjectCamera('accu', 'other')
		
		makeLuaText('misses', 'Misses: '..misses, 400, 110, 500)
		setTextSize('misses', 30)	
		setObjectCamera('misses', 'other')
		
		makeLuaText('noteshit', 'Notes hit: '..noteshit, 400, 110, 600)
		setTextSize('noteshit', 30)	
		setObjectCamera('noteshit', 'other')
		
		-- boyfriend for spice
		
		makeAnimatedLuaSprite('boyfriendbitchass', 'characters/BOYFRIEND', 950, 340)
		addAnimationByPrefix('boyfriendbitchass', 'idle', 'BF idle dance', 24)
		addAnimationByPrefix('boyfriendbitchass', 'miss', 'BF NOTE LEFT MISS', 24, false)
		addAnimationByPrefix('boyfriendbitchass', 'hey', 'BF HEY!!', 24)
		addAnimationByPrefix('boyfriendbitchass', 'ripbozo', 'BF Dead Loop', 24)
		addAnimationByPrefix('boyfriendbitchass', 'thisismewhenperfectfc', 'boyfriend attack', 12)
		objectPlayAnimation('boyfriendbitchass', 'hey', true)
		scaleObject('boyfriendbitchass', 0.6, 0.6)
		updateHitbox('boyfriendbitchass')
		setObjectCamera('boyfriendbitchass', 'other')
		
		-- actually adding this shit
		
		addLuaSprite('epicbg', true)
		
		addLuaSprite('sick', true)
		addLuaText('sicks', true)
		
		addLuaSprite('good', true)
		addLuaText('goods', true)
		
		addLuaSprite('bad', true)
		addLuaText('bads', true)
		
		addLuaSprite('shit', true)
		addLuaText('shits', true)
		
		addLuaText('song', true)
		addLuaText('botplay', true)
		addLuaText('dieded', true)
		addLuaText('practice', true)
		
		addLuaText('score', true)
		addLuaText('accu', true)
		addLuaText('misses', true)
		addLuaText('noteshit', true)
		
		addLuaText('esctoleave', true)
		
		addLuaSprite('boyfriendbitchass', true)

	        addLuaSprite('e', true);
		
		if misses > 0 then
			objectPlayAnimation('boyfriendbitchass', 'idle', true)
		end
		if misses > 49 then
			objectPlayAnimation('boyfriendbitchass', 'miss', true) 
		end
		if died == 'Yes' then
			objectPlayAnimation('boyfriendbitchass', 'ripbozo', true) 
		end
		if accuracy == 100 then
			doTweenX('bffixposX', 'boyfriendbitchass', 790, 0.0001, 'linear')
			doTweenY('bffixposY', 'boyfriendbitchass', 190, 0.0001, 'linear')
			objectPlayAnimation('boyfriendbitchass', 'thisismewhenperfectfc', true) 
		end
	
	else
		setDataFromSave('songInfo', 'misses', 0)
		setDataFromSave('songInfo', 'sicks', 0)
		setDataFromSave('songInfo', 'goods', 0)
		setDataFromSave('songInfo', 'bads', 0)
		setDataFromSave('songInfo', 'shits', 0)
		setDataFromSave('songInfo', 'died', 'No')
		setDataFromSave('songInfo', 'botplay', 'No')
		setDataFromSave('songInfo', 'practice', 'No')
		setDataFromSave('songInfo', 'songPlayed', songName)
		setDataFromSave('songInfo', 'accuracy', 0)
		setDataFromSave('songInfo', 'noteshit', 0)
	end
end

function onUpdate()
    if botPlay and antibotplaylooplol == 0 then
		setDataFromSave('songInfo', 'botplay', 'Yes')
		flushSaveData('songInfo')
		antibotplaylooplol = 1
	end

    if practice and antipracticemodelooplol == 0 then
		antipracticemodelooplol = 1
		setDataFromSave('songInfo', 'practice', 'Yes')
		flushSaveData('songInfo')
	end

	if songName == 'Last Song Stats' then
		-- bullshit
	else
		setDataFromSave('songInfo', 'score', getProperty('songScore'))
		setDataFromSave('songInfo', 'accuracy', getProperty('ratingPercent')*100)
		flushSaveData('songInfo')
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
    misses = misses + 1
    setDataFromSave('songInfo', 'misses', getDataFromSave('songInfo', 'misses') + 1)
    flushSaveData('songInfo')
	
	if not sus then
		setDataFromSave('songInfo', 'noteshit', getDataFromSave('songInfo', 'noteshit') - 1)
		flushSaveData('songInfo')
	end
end

function goodNoteHit(id, dir, nt, sus)
	if getPropertyFromGroup('notes', id, 'rating') == 'sick' then
		setDataFromSave('songInfo', 'sicks', getDataFromSave('songInfo', 'sicks') + 1)
		flushSaveData('songInfo')
	end
	if getPropertyFromGroup('notes', id, 'rating') == 'good' then
		setDataFromSave('songInfo', 'goods', getDataFromSave('songInfo', 'goods') + 1)
		flushSaveData('songInfo')
	end
	if getPropertyFromGroup('notes', id, 'rating') == 'bad' then
		setDataFromSave('songInfo', 'bads', getDataFromSave('songInfo', 'bads') + 1)
		flushSaveData('songInfo')
	end
	if getPropertyFromGroup('notes', id, 'rating') == 'shit' then
		setDataFromSave('songInfo', 'shits', getDataFromSave('songInfo', 'shits') + 1)
		flushSaveData('songInfo')
	end
	
	if not sus then
		setDataFromSave('songInfo', 'noteshit', getDataFromSave('songInfo', 'noteshit') + 1)
		flushSaveData('songInfo')
	end
end

function onGameOver()
	setDataFromSave('songInfo', 'died', 'Yes')
	flushSaveData('songInfo')
end

function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function getRandomColor() -- taken from cherif in the psych discord
  local  randomRGBColor1 = getRandomInt(0, 255)
  local  randomRGBColor2 = getRandomInt(0, 255)
  local  randomRGBColor3 = getRandomInt(0, 255)

  local  rgbColor = {randomRGBColor1, randomRGBColor2, randomRGBColor3}
  local  hexColor = rgbToHex(rgbColor)

  rgbColorToString = rgbColor[1]..",".. rgbColor[2]..",".. rgbColor[3]

  -- debugPrint("RGB: ".. rgbColorToString)

  return hexColor

end


function rgbToHex(rgb)
	local hexadecimal = '' -- yeah ignore

	for key, value in pairs(rgb) do
		local hex = ''

		while(value > 0)do
			local index = math.fmod(value, 16) + 1
			value = math.floor(value / 16)
			hex = string.sub('0123456789ABCDEF', index, index) .. hex			
		end

		if(string.len(hex) == 0)then
			hex = '00'

		elseif(string.len(hex) == 1)then
			hex = '0' .. hex
		end

		hexadecimal = hexadecimal .. hex
	end

	return hexadecimal
end