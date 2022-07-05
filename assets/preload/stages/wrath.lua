function onCreate()
   if lowQuality then

    makeLuaSprite('bg', 'Ectospasm/BG', -380,-600)
    addLuaSprite('bg',false)
    setLuaSpriteScrollFactor('bg', 1,1)
    scaleObject('bg', 1.6,1.6)
   end

   if not lowQuality then -- when use bad phone saddddds
    makeLuaSprite('Sky', 'Ectospasm/wrath_sky', -600,-550);
    addLuaSprite("Sky",false);
    setLuaSpriteScrollFactor("Sky", 0.5, 0.5);
    scaleObject('Sky', 3,3);

    makeAnimatedLuaSprite('Vortex', 'Ectospasm/Vortex', -25,-750)
    addAnimationByPrefix("Vortex","Vortex","Vortex",48,true)
    addLuaSprite("Vortex",false)
    objectPlayAnimation("Vortex","Vortex",false)
    setLuaSpriteScrollFactor("Vortex", 0.5, 0.5)
    scaleObject('Vortex', 2, 2)

    makeLuaSprite('Gates', 'Ectospasm/wrath_gates', -800,-750)
    addLuaSprite('Gates',false)
    setLuaSpriteScrollFactor('Gates', 0.3,0.3)
    scaleObject('Gates', 1.5,1.5)

    makeAnimatedLuaSprite('Fire', 'Ectospasm/flames_colorchange', -525,-100);
    addAnimationByPrefix('Fire', 'flames_colorchange','Symbol 1 Instanz 1',24,true)
    addLuaSprite('Fire',false)
    objectPlayAnimation('Fire','Symbol 1 Instanz 1',false)
    setLuaSpriteScrollFactor('Fire', 0.2, 0.2)
    scaleObject('Fire', 4,4)

    makeAnimatedLuaSprite('Saku', 'Ectospasm/SakuBop', 1450,100)
    addAnimationByPrefix('Saku', 'SakuBop', 'SakuBop',24,true)
    addLuaSprite('Saku',false)
    objectPlayAnimation('Saku', 'SakuBop',false)
    setLuaSpriteScrollFactor('SakuBop',1,1)

    makeLuaSprite('Runes1', 'Ectospasm/wrath_runes2', -525,-600);
    addLuaSprite('Runes1',false)
    setLuaSpriteScrollFactor('Runes1', 1,1)
    scaleObject('Runes1', 4,4)

    makeLuaSprite('Runes2', 'Ectospasm/wrath_runes', -1285,-600)
    addLuaSprite('Runes2',false)
    setLuaSpriteScrollFactor('Runes1', 1,1)
    scaleObject('Runes2', 4,4)

    makeAnimatedLuaSprite('Ground', 'Ectospasm/ground', -890,400)
    addAnimationByPrefix('Ground', 'ground','cyan',2.5,true)
    addLuaSprite('Ground',false)
    objectPlayAnimation('Ground','ground',false)
    setLuaSpriteScrollFactor('Ground', 1,1)
    scaleObject('Ground', 2,2)
    end

end
function onStepHit()
    if mustHitSection == false then
        setProperty('defaultCamZoom', 0.55);
end
end