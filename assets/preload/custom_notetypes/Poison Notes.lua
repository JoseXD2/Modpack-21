function onCreate()
	for i = 0, getProperty("unspawnNotes.length")-1 do
		if getPropertyFromGroup("unspawnNotes", i, "noteType") == "Poison Notes" then
			setPropertyFromGroup("unspawnNotes", i, "texture", "POISONNOTE_assets")
			setPropertyFromGroup("unspawnNotes", i, "hitHealth", "-500")
			setPropertyFromGroup("unspawnNotes", i, "missHealth", "500")
			setPropertyFromGroup("unspawnNotes", i, "hitCausesMiss", true)

			if getPropertyFromGroup("unspawnNotes", i, "mustPress") then
				setPropertyFromGroup("unspawnNotes", i, "ignoreNote", true)
			end
		end
	end
end