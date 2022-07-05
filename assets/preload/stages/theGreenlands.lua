function onCreate()
	-- background shit
	makeLuaSprite('background','DaveandBambi/green_background',-1500,-750)
	addLuaSprite('background',false)
	setLuaSpriteScrollFactor('background',0.1,0.1)
	scaleObject('background', 3, 3)
     if not lowQuality then
	-- makeLuaSprite('background2','DaveandBambi/green_background',-1550,-775)
	-- addLuaSprite('background2',false)
	-- setLuaSpriteScrollFactor('background2',0.1,0.1)
	-- scaleObject('background2', 3.1, 3.1)
	-- setProperty('background2.alpha',0.25)
	-- makeLuaSprite('background3','DaveandBambi/green_background',-1600,-800)
	-- addLuaSprite('background3',false)
	-- setLuaSpriteScrollFactor('background3',0.1,0.1)
	-- scaleObject('background3', 3.2, 3.2)
	-- setProperty('background3.alpha',0.25)
	y=8
	for x=1,y,1 do
		makeLuaSprite('background'..x,'DaveandBambi/green_background',-1500/3*(3+x/10),-750/3*(3+x/10))
		addLuaSprite('background'..x,false)
		scaleObject('background'..x,3+x/20,3+x/20)
		setProperty('background'..x..'.alpha',0.2)
		setLuaSpriteScrollFactor('background'..x,0.1,0.1)
	end
     end
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end