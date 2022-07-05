function onCreatePost()

         makeLuaSprite('sky', 'PixelBOB/Skysad', -300, 0)
         scaleObject('sky', 6, 6); 
         setProperty('sky.antialiasing', false);

         makeLuaSprite('ground', 'PixelBOB/GroundSad', -300, 0)
         scaleObject('ground', 6, 6); 
         setProperty('ground.antialiasing', false);

         addLuaSprite('sky', false) 
         addLuaSprite('ground', false) 
end