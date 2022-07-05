--script by SirTopHat
--tweaked for SMB Funk Mix Advance by KirbyKid Johnson

--easy script configs
IntroTextSize = 8	--Size of the text for the Now Playing thing.
IntroSubTextSize = 16 --size of the text for the Song Name.
IntroTagColor = 'e69c21'	--Color of the tag at the end of the box.
IntroBoxColor = '000000'	--Color of the box.
IntroTagWidth = 8	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', '', -305-91-IntroTagWidth, 15)
	makeGraphic('JukeBoxTag', 396+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'songIntro/null', -305-91-IntroTagWidth, 15)
	-- makeGraphic('JukeBox', 300, 100, IntroBoxColor)
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-91-IntroTagWidth, 60)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 300, -305-91-IntroTagWidth, 30)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')

	--turns off antialiasing
	setProperty('JukeBoxTag.antialiasing', false)
	setProperty('JukeBox.antialiasing', false)

	if isStoryMode and seenCutscene then
		triggerEvent('Intro','','')
	elseif not isStoryMode then
		triggerEvent('Intro','','')
	end
end

function onCreatePost()
	loadGraphic('JukeBox', 'songIntro/'..songName)
end

--motion functions
function onEvent(n,v,b)
	if n == 'Intro' then
		if v ~= '' then
			setTextString('JukeBoxSubText',v)
		end
		if b ~= '' then
			setTextString('JukeBoxText',b)
		end
		-- Inst and Vocals start playing, songPosition = 0
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
	end
end