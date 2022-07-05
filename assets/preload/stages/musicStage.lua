local modchart = true
local charsloaded = 6;
local xx = 550
local yy = -50
local xx2 = 550
local yy2 = 500
local xx3 = 400
local yy3 = -50
local ofs = 40
local followchars = true
local camSpeed = 4;
local camInt = 1;
function onCreate()

	makeLuaSprite('theStagemusic','Bunzo/stagemusic',-1200,-1100)
        scaleObject('theStagemusic', 2, 2)
	addLuaSprite('theStagemusic',false)
	setLuaSpriteScrollFactor('theStagemusic', 1.0, 1.0)

	makeAnimatedLuaSprite('a','Bunzo/colors',-1100,-200)
	addAnimationByPrefix('a','tutorial','atutorial',24,true)
	addAnimationByPrefix('a','pink','apink',24,true)
	addAnimationByPrefix('a','cyan','acyan',24,true)
	addAnimationByPrefix('a','green','agreen',24,true)
	addAnimationByPrefix('a','red','ared',24,true)
        scaleObject('a', 2, 2)
	addLuaSprite('a',false)

	makeLuaSprite('theShadow2','Bunzo/shadow',-1200,-1700)
        scaleObject('theShadow2', 4, 4)
	addLuaSprite('theShadow2',false)
	setLuaSpriteScrollFactor('theShadow2', 1.0, 0.5)

	makeLuaSprite('theTube','Bunzo/tube',60,-1500)
        scaleObject('theTube', 2, 2)
	addLuaSprite('theTube',false)
	setLuaSpriteScrollFactor('theTube', 1.0, 1.0)

	makeLuaSprite('thePads','Bunzo/pads',-350,650)
        scaleObject('thePads', 2, 2)
	addLuaSprite('thePads',true)
	setLuaSpriteScrollFactor('thePads', 1.0, 1.0)

	makeLuaSprite('theShadow','Bunzo/shadow',-1200,-1700)
        scaleObject('theShadow', 4, 4)
	addLuaSprite('theShadow',true)
	setLuaSpriteScrollFactor('theShadow', 1.0, 1.0)

	makeLuaSprite('theScreenshadow','Bunzo/screenshadow',-1200,-900)
	addLuaSprite('theScreenshadow',true)
	scaleObject('theScreenshadow',4,4);
	setLuaSpriteScrollFactor('theScreenshadow',0,0)

end

local colorArray = {'pink','cyan', 'green', 'red'}
function opponentNoteHit(id,dir,notetype,sus)
	if curBeat >= 24 then
    objectPlayAnimation('a',colorArray[dir + 1],true)
	end
end

function onUpdatePost(elapsed)
	if curBeat <= 316 then
	if mustHitSection then
		setProperty('defaultCamZoom',0.7);
	else
		setProperty('defaultCamZoom',0.4);
	end
else
	setProperty('defaultCamZoom',0.4);
	triggerEvent('Camera Follow Pos',xx,yy)
end	

	if modchart == true then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end

	if followchars == true and curBeat <= 316 then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
		else
	
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
		end
	end
end

function onGameOver()
	modchart = false
	return Function_Continue;
end