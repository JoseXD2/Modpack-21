function onCreatePost()
	if dadName == 'monika-angry' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'DokiDnotes')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'DokiDnotes'); --Change texture

			end
		end
	end
end
