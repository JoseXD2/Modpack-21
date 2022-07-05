function onCreate()
  --background
  makeLuaSprite('bg','spookystuff/buildingsevil',-400,-300)
  makeLuaSprite('floor','spookystuff/floorevil',-500,-250)
  scaleObject('floor',2.4,2.8)
  addLuaSprite('bg',false)
  addLuaSprite('floor',false)

 if not lowQuality then
  makeAnimatedLuaSprite('screen1','spookystuff/XO_TV_L',-400,250)
  addAnimationByPrefix('screen1','idle','BG SPEAKERS TVS',24,true)
  objectPlayAnimation('screen1','idle',true)
  scaleObject('screen1',2,2)
  addLuaSprite('screen1',false)
 end
  close(true);
  end
  