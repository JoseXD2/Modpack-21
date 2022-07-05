function onUpdate()

    if not lowQuality then
	setProperty("background2.angle",math.cos(getSongPosition()/1000+0.1)*2)
	setProperty("background3.angle",math.sin(getSongPosition()/1000+0.2)*3)
	setProperty("background4.angle",math.cos(getSongPosition()/1000+0.3)*4)
	setProperty("background5.angle",math.sin(getSongPosition()/1000+0.4)*5)
	setProperty("background6.angle",math.cos(getSongPosition()/1000+0.5)*6)
	setProperty("background7.angle",math.sin(getSongPosition()/1000+0.6)*7)
	setProperty("background8.angle",math.cos(getSongPosition()/1000+0.7)*8)
    end
	
	setPropertyFromGroup("playerStrums",0,"x",defaultPlayerStrumX0 - 200 + math.sin(getSongPosition()/1234) * 300 )
	setPropertyFromGroup("playerStrums",1,"x",defaultPlayerStrumX1 + math.sin(getSongPosition()/621) * 100 )
	setPropertyFromGroup("playerStrums",2,"x",defaultPlayerStrumX2 - 200 + math.sin(getSongPosition()/1234) * 300 )
	setPropertyFromGroup("playerStrums",3,"x",defaultPlayerStrumX3 + math.sin(getSongPosition()/621) * 100 )
	
	setPropertyFromGroup("opponentStrums",0,"x",defaultOpponentStrumX0 - math.sin(getSongPosition()/621) * 100 )
	setPropertyFromGroup("opponentStrums",1,"x",defaultOpponentStrumX1 + 200 - math.sin(getSongPosition()/1234) * 300 )
	setPropertyFromGroup("opponentStrums",2,"x",defaultOpponentStrumX2 - math.sin(getSongPosition()/621) * 100 )
	setPropertyFromGroup("opponentStrums",3,"x",defaultOpponentStrumX3 + 200 - math.sin(getSongPosition()/1234) * 300 )
	
	for x=0,7,1 do
		funnyx = getPropertyFromGroup("strumLineNotes",x,"x")
		setPropertyFromGroup("strumLineNotes",x,"y",math.sin(funnyx/100+getSongPosition()/250)*50 + 50)
		setPropertyFromGroup("strumLineNotes",x,"angle",math.sin(funnyx/100+getSongPosition()/250)*50 + 50)
	end
	
	setProperty("camGame.angle",math.cos(getSongPosition()/1000)*2)
	setProperty("camGame.zoom",math.sin(getSongPosition()/250)*0.005+0.4)
	
	setProperty("camHUD.angle",math.sin(getSongPosition()/1000)*4)
end