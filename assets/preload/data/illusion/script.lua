local allowCountdown = false

function onStartCountdown()

	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
local lol = true;

function onUpdate()
songPos = getSongPosition()
local currentBeat = (songPos/1000)
local flickbeat = (songPos/10)

  if lol == true then
  doTweenX('k', 'camHUD', 350*math.sin((currentBeat+0.92*0.1)*math.pi), 6)
  doTweenY('k2', 'camHUD', 250*math.cos((currentBeat+0.92*0.1)*math.pi), 6)
   noteTweenX('sus', 4, defaultPlayerStrumX0 + 700*math.sin((currentBeat+0.92*0.1)*math.pi), 6)
   noteTweenY('sus1', 4, defaultPlayerStrumY0 + 700*math.cos((currentBeat+0.92*0.1)*math.pi), 6)
   noteTweenX('sus2', 5, defaultPlayerStrumX1 + 700*math.sin((currentBeat+0.92*0.2)*math.pi), 6)
   noteTweenY('sus3', 5, defaultPlayerStrumY1 + 700*math.cos((currentBeat+0.92*0.2)*math.pi), 6)
   noteTweenX('sus4', 6, defaultPlayerStrumX2 + 700*math.sin((currentBeat+0.92*0.3)*math.pi), 6)
   noteTweenY('sus5', 6, defaultPlayerStrumY2 + 700*math.cos((currentBeat+0.92*0.3)*math.pi), 6)
   noteTweenX('sus6', 7, defaultPlayerStrumX3 + 700*math.sin((currentBeat+0.92*0.5)*math.pi), 6)
   noteTweenY('sus7', 7, defaultPlayerStrumY3 + 700*math.cos((currentBeat+0.92*0.5)*math.pi), 6)
   noteTweenX('soos', 0, defaultOpponentStrumX0 + 700*math.sin((currentBeat+0.92*0.1)*math.pi), 6)
   noteTweenY('soos1', 0, defaultOpponentStrumY0 + 700*math.cos((currentBeat+0.92*0.1)*math.pi), 6)
   noteTweenX('soos2', 1, defaultOpponentStrumX1 + 700*math.sin((currentBeat+0.92*0.2)*math.pi), 6)
   noteTweenY('soos3', 1, defaultOpponentStrumY1 + 700*math.cos((currentBeat+0.92*0.2)*math.pi), 6)
   noteTweenX('soos4', 2, defaultOpponentStrumX2 + 700*math.sin((currentBeat+0.92*0.3)*math.pi), 6)
   noteTweenY('soos5', 2, defaultOpponentStrumY2 + 700*math.cos((currentBeat+0.92*0.3)*math.pi), 6)
   noteTweenX('soos6', 3, defaultOpponentStrumX3 + 700*math.sin((currentBeat+0.92*0.5)*math.pi), 6)
   noteTweenY('soos7', 3, defaultOpponentStrumY3 + 700*math.cos((currentBeat+0.92*0.5)*math.pi), 6)
   end


  if curBeat % 8 == 4 then
  fade = true
  else
  fade = false
  end

  if fade == false then
  doTweenAlpha('camstopflicker', 'camHUD', 1, 0.001, 'linear')
  end
  end
