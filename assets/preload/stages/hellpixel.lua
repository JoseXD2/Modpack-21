function onCreatePost()

         makeLuaSprite('HELL', 'PixelBOB/HELL', -300, 0)
         scaleObject('HELL', 6, 6); 
         setProperty('HELL.antialiasing', false);

         makeLuaSprite('HELLLL', 'PixelBOB/HELLLL', -300, 100)
         scaleObject('HELLLL', 6, 6); 
         setProperty('HELLLL.antialiasing', false);

         makeLuaSprite('HELLL', 'PixelBOB/HELLL', -300, 0)
         scaleObject('HELLL', 6, 6); 
         setProperty('HELLL.antialiasing', false);

         addLuaSprite('HELL', false) 
         addLuaSprite('HELLLL', false) 
         addLuaSprite('HELLL', false) 
end