function onCreatePost()

         makeLuaSprite('sky', 'PixelBOB/Skyhap', -300, 0)
         scaleObject('sky', 6, 6); 
         setProperty('sky.antialiasing', false);

         makeLuaSprite('ground', 'PixelBOB/GroundHap', -300, 0)
         scaleObject('ground', 6, 6);
         setProperty('ground.antialiasing', false); 

         addLuaSprite('sky', false) 
         addLuaSprite('ground', false) 
end