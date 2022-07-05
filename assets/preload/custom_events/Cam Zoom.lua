function onEvent(name, value1, value2)

   if name == "Cam Zoom" then

      doTweenZoom('zoom', 'camGame', value1, value2, 'linear')

     end
  end