function onCreate()
  --background
  makeLuaSprite('bg','spookystuff/buildings',-450,0)
  scaleObject('bg',2,2)
  makeLuaSprite('floor','spookystuff/neonsigns',-475,50)
  scaleObject('floor',1.05,1)
  addLuaSprite('bg',false)
  addLuaSprite('floor',false)

 if not lowQuality then
  makeLuaSprite('top','spookystuff/scaffolding',-500,0)
  scaleObject('top',2.2,2)
  makeAnimatedLuaSprite('speaker1','spookystuff/SpookySpeakersB',-700,0)
  addAnimationByPrefix('speaker1','idle','BG SPEAKERS',24,true)
  objectPlayAnimation('speaker1','idle',true)
  scaleObject('speaker1',2,2)
  makeAnimatedLuaSprite('speaker2','spookystuff/SpookySpeakersP',1200,0)
  addAnimationByPrefix('speaker2','idle','BG SPEAKERS PINK',24,true)
  objectPlayAnimation('speaker2','idle',true)
  scaleObject('speaker2',2,2)
  addLuaSprite('top',false)
  addLuaSprite('speaker1',false)
  addLuaSprite('speaker2',false)
 end
  close(true);
  end
  