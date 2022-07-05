function onSongStart()
	doTweenColor('aaa1', 'disruptor', 000000, 2, 'circInOut')
    runTimer('fade1', 2)
end

function onTimerCompleted(tag)
	if tag == 'fade1' then
	   doTweenColor('aaa2', 'disruptor', 'ffffff', 2, linear)
	   runTimer('fade2', 2)
	elseif tag == 'fade2' then
	   doTweenColor('aaa1', 'disruptor', '000000', 2, linear)
	   runTimer('fade1', 2)
	end
end