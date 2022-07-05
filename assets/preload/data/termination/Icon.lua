 --this thing below me is nonsense why did i make it idk u tell me
 --           V V very epic lad for this script
 
 --made by Cherif#9382 <-- mind rope mod creator
 
 -- Kinda improved by superpowers04#3887
 -- some minor improvements by TheConcealedCow

 --Some Instruction

-- CONFIG

 local right = "0" -- The offset for the right -- if p == 2 then it use the left, otherwise use the right
 local left = "-40" -- The offset for the left
 local axisY = "45" -- offset for Y axis (up (+), or down (-))
 local iconName = "icon-poorqt" -- The icon's name (make sure xml has the same name as the png)
 local pngName = "faceIcon" -- The tag that the animated sprites are given
 local overIcon = false -- If false, this icon will be under the vanilla icon 
 local scaleX = "1" -- scale X if you want to change it for whatever reason
 local scaleY = "1" -- scale Y, works the same as scale X
 local P = 2 -- Controls which icon to be placed with and to mimic
 -- 1 is BF's side 
 -- 2 is Opponent's side
 
 local folderName = "icons" -- The folder that the icon is in (i have it defaulted to the images/icons to make it MUCH easier)
 

-- Actual script, dont try to edit anything under here unless you ACTUALLY know what you are doing


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


local BoundiconName = "iconP" .. P
function onCreatePost()
	makeAnimatedLuaSprite(pngName, folderName .. '/' .. iconName); --change Name with your icon's name
	if P == 1 then
		setProperty(pngName .. '.flipX', true);
	end
	addAnimationByPrefix(pngName, 'idle', 'Icon', 0, true);
	setObjectCamera(pngName, 'camHUD');
	setProperty(pngName .. '.y', getProperty(BoundiconName .. '.y')+axisY)
	setObjectOrder(pngName, getObjectOrder(BoundiconName)+(overIcon and 1 or -1))
	scaleObject(pngName, scaleX, scaleY);
	addLuaSprite(pngName);
end

function onUpdate()
	setProperty(pngName .. '.x', getProperty(BoundiconName ..'.x')+(P == 2 and left or right))
	setProperty(pngName .. '.scale.x', getProperty(BoundiconName ..'.scale.x')) --until boundTo is supported by lua i guess
	setProperty(pngName .. '.scale.y', getProperty(BoundiconName ..'.scale.y'))
	setProperty(pngName .. '.animation.curAnim.curFrame', getProperty(BoundiconName .. '.animation.curAnim.curFrame'));
end
