function onCreate()

          setProperty('skipCountdown', true)
          setProperty('iconP2.visible', false)

       if difficulty == 0 then
          setPropertyFromClass('ClientPrefs', 'lowQuality', true)
       end

       if difficulty == 1 then
          setPropertyFromClass('ClientPrefs', 'lowQuality', false)
       end

       if difficulty == 2 then
          setPropertyFromClass('ClientPrefs', 'downScroll', true)
       end

       if difficulty == 3 then
          setPropertyFromClass('ClientPrefs', 'downScroll', false)
       end

       if difficulty == 4 then
          setPropertyFromClass('ClientPrefs', 'middleScroll', true)
       end

       if difficulty == 5 then
          setPropertyFromClass('ClientPrefs', 'middleScroll', false)
       end

       if difficulty == 6 then
          setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
       end

       if difficulty == 7 then
          setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
       end

       if difficulty == 8 then
          setPropertyFromClass('ClientPrefs', 'hideHud', true)
       end

       if difficulty == 9 then
          setPropertyFromClass('ClientPrefs', 'hideHud', false)
       end

       if difficulty == 10 then
          setPropertyFromClass('ClientPrefs', 'noteSplashes', false)
       end

       if difficulty == 11 then
          setPropertyFromClass('ClientPrefs', 'noteSplashes', true)
       end
end

function onUpdate()

        if CurStep == 16 then
           endSong()
        end
end