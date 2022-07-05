function onCreate()

              addCharacterToList(banduT, dad)
              addCharacterToList(DisBambi, dad)
              addCharacterToList(cheating, dad)
              addCharacterToList(unfairT, dad)

	-- background shit
                makeLuaSprite('popoback', 'DaveandBambi/popoback', -600, -250)
                scaleObject('popoback', 2, 2)
                addLuaSprite('popoback', false)

    if not lowQuality then
         
	for x=1,y,1 do
		makeLuaSprite('background'..x,'popoback',-1500/3*(3+x/10),-750/3*(3+x/10))
		addLuaSprite('background'..x,false)
		scaleObject('background'..x,3+x/20,3+x/20)
		setProperty('background'..x..'.alpha',0.2)
		setLuaSpriteScrollFactor('background'..x,0.1,0.1)
	end
     end
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onUpdate()
   if not lowQuality then    

	setProperty("popoback.angle",math.cos(getSongPosition()/1000+0.1)*2)
   end
end