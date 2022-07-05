local xx = 160 * 3
local yy = 81 * 3

function onStepHit()
	if not lowQuality then
		if curStep == 256 then
			setProperty("defaultCamZoom", 1)
		elseif curStep == 512 then
			setProperty("defaultCamZoom", 2.5)
		elseif curStep == 640 then
			setProperty("defaultCamZoom", 2)
		elseif curStep == 768 then
			setProperty("defaultCamZoom", 1.5)
		elseif curStep == 896 then
			doTweenZoom("dramaticZoom", "camGame", 3, 12, "linear")
		elseif curStep == 1008 then
			cancelTween("dramaticZoom")
			triggerEvent("Camera Follow Pos", xx, yy)
			setProperty("defaultCamZoom", 1 + (1/3) + 0.001)
		elseif curStep == 1024 then
			setProperty("defaultCamZoom", 0.75)
		elseif curStep == 1280 then
			setProperty("defaultCamZoom", 1 + (1/3) + 0.001)
		end
	end
end