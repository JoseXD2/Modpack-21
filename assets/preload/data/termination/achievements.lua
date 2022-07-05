-- please credit me or dont delete this text!
-- script by Misha21220[GD]

local taunt = 0
local allowend = false
function onCreate()
         makeLuaSprite('win', 'achievements/HEYa', 0, 0)  --your achiviement image
         scaleObject('win', 0.75, 0.75)
         setObjectCamera('win', 'other')
         setProperty('win.alpha', 0) -- visible ooooooo dont change
         addLuaSprite('win',  true)

         makeLuaText('text', 'HEY!!', 200, 120, 10) -- change your title text
         setTextSize('text', '25') --text size 
         setTextColor('text', 'ffffff') --change color in hex
         setObjectCamera('text', 'other')
         setProperty('text.alpha', 0)
         addLuaText('text', true)

         makeLuaText('text2', 'You beat Termination with 100 hey', 200, 120, 40) -- change your description text
         setTextSize('text2', '20') --text size 
         setTextColor('text2', 'ffffff') --change color in hex
         setObjectCamera('text2', 'other')
         setProperty('text2.alpha', 0)
         addLuaText('text2', true)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'gg' then
	allowend = true
	endSong() --  timer will end song lol
	end
end

function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') or (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mouseReleased('left')) then
           taunt = taunt + 1
        end
end

function onEndSong()
     if not allowend and taunt > 100 then 
         playSound('award', 0.75) --play sounds augh
         doTweenAlpha('winAlpha', 'win', 1, 2.4, 'cubeInOut') --shows text and image yaya
         doTweenAlpha('textAlpha', 'text', 1, 2.4, 'cubeInOut')
         doTweenAlpha('text2Alpha', 'text2', 1, 2.4, 'cubeInOut')
		 runTimer('gg', 5, 1) -- 5 is 5 second before it ends song
         return Function_Stop
     end
   return Function_Continue
end --Script is done :3