function opponentNoteHit(id, direction, noteType, isSustainNote)
		colour = math.random(1, 4);
		if colour == 1 then
			doTweenColor('bfcolour', 'boyfriend', 'FF0000', 0.45, 'linear');
			doTweenColor('gfcolour', 'gf', 'FF0000', 0.45, 'linear');
			doTweenColor('dadcolour', 'dad', 'FF0000', 0.45, 'linear');
			doTweenColor('skycolour', 'bg', 'FF0000', 0.45, 'linear');
		end
		if colour == 2 then
			doTweenColor('bfcolour', 'boyfriend', '00ff00', 0.45, 'linear');
			doTweenColor('gfcolour', 'gf', '00ff00', 0.45, 'linear');
			doTweenColor('dadcolour', 'dad', '00ff00', 0.45, 'linear');
			doTweenColor('skycolour', 'bg', '00ff00', 0.45, 'linear');
		end
		if colour == 3 then
			doTweenColor('bfcolour', 'boyfriend', '00FFFF', 0.45, 'linear');
			doTweenColor('gfcolour', 'gf', '00FFFF', 0.45, 'linear');
			doTweenColor('dadcolour', 'dad', '00FFFF', 0.45, 'linear');
			doTweenColor('skycolour', 'bg', '00FFFF', 0.45, 'linear');
                end
		if colour == 4 then
			doTweenColor('bfcolour', 'boyfriend', 'ff00ff', 0.45, 'linear');
			doTweenColor('gfcolour', 'gf', 'ff00ff', 0.45, 'linear');
			doTweenColor('dadcolour', 'dad', 'ff00ff', 0.45, 'linear');
			doTweenColor('skycolour', 'bg', 'ff00ff', 0.45, 'linear');
    end
	triggerEvent('Screen Shake', '0.01, 0.00001', '0.01, 0.00001');
end

function onUpdate()
                   if mustHitSection == true then
			doTweenColor('bfcolour', 'boyfriend', 'FFFFFF', 0.755, 'linear');
			doTweenColor('gfcolour', 'gf', 'FFFFFF', 0.755, 'linear');
			doTweenColor('dadcolour', 'dad', 'FFFFFF', 0.755, 'linear');
			doTweenColor('skycolour', 'bg', 'FFFFFF', 0.755, 'linear');
                   end
end