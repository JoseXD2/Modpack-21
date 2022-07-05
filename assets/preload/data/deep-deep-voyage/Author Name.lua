function onCreate()
	if isStoryMode and seenCutscene then
		triggerEvent("Intro","","by KrystalPhantasm")
	elseif not isStoryMode then
		triggerEvent("Intro","","by KrystalPhantasm")
	end
end