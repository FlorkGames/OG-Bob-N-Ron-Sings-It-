local xx = 620;
local yy = 440;
local xx2 = 620;
local yy2 = 440;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

-- Thanks to Byok for the motivation and everything, he is such a cool man.

function onCreate()
	-- background shit
	setPropertyFromClass('GameOverSubstate', 'characterName', 'RonDead');
	
	makeLuaSprite('ogBackground', 'ogBackground', -600, -300);
	setScrollFactor('ogBackground', 0.9, 0.9);
	
	makeLuaSprite('RonJumpscare', 'Ron Jumpscare', -80, -200);
	setScrollFactor('RonJumpscare', 0.9, 0.9);
		scaleObject('RonJumpscare', 1.1, 1.1);
		
		makeLuaSprite('Watermark', 'ByokWaterMark', 8, 10);
		setScrollFactor('Watermark', 0.9, 0.9);
					scaleObject('Watermark', 0.8, 0.8);
	
	makeAnimatedLuaSprite('BopRap', 'BobRapping', -40, -60);
	setScrollFactor('BopRap', 0.9, 0.9);
	scaleObject('BopRap', 2.2, 2.2);
	addAnimationByPrefix('BopRap', 'BobRapping', 'Bob Rapping At Camera', 30, false)
	
	makeAnimatedLuaSprite('BopKill', 'LittleManDies', -700, 60);
	setScrollFactor('BopKill', 0.9, 0.9);
	scaleObject('BopKill', 2.2, 2.2);
	addAnimationByPrefix('BopKill', 'LittleManDies', 'He Dies', 30, false)
	
	makeAnimatedLuaSprite('RonRap', 'RonRapping', -40, -60);
	setScrollFactor('RonRap', 0.9, 0.9);
	scaleObject('RonRap', 2.2, 2.2);
	addAnimationByPrefix('RonRap', 'RonRapping', 'HELP', 30, false)
	
	makeLuaSprite('ogGrass', 'ogGrass', -650, 600);
	setScrollFactor('ogGrass', 0.9, 0.9);
	scaleObject('ogGrass', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('ogClouds', 'ogClouds', -125, -100);
		setScrollFactor('ogClouds', 0.9, 0.9);
		scaleObject('ogClouds', 1.1, 1.1);

		makeLuaSprite('ogCeiling', 'ogCeiling', -500, -300);
		setScrollFactor('ogCeiling', 1.3, 1.3);
		scaleObject('ogCeiling', 0.9, 0.9);
	end

	addLuaSprite('ogBackground', false);
	addLuaSprite('Watermark', false);
	addLuaSprite('ogGrass', false);
	addLuaSprite('ogClouds', false);
	addLuaSprite('ogCeiling', false);
	
	setObjectCamera('Watermark', 'other')
end


function onSongStart()
	runTimer('BopWaitig', 4.6, 1)
		runTimer('RonWaitig', 8.74, 1)
				runTimer('BopKill', 8.77, 1)
						runTimer('BopKillt', 10.84, 1)
		runTimer('BopReady', 0.03, 0.03)
				runTimer('RonReady', 4.33, 1)
		runTimer('RonJumpscare', 228, 1)
	
end

function onUpdate(elapsed)
setTextFont('scoreTxt', 'comic-sans-ms.ttf');
setTextFont('botplayTxt', 'comic-sans-ms.ttf');
setTextFont('timeTxt', 'comic-sans-ms.ttf');
		setProperty('timeBar.visible', false);
		setProperty('timeBarBG.visible', false);
		setProperty('BopRap.antialiasing', true);
			setProperty('RonRap.antialiasing', true);
			setProperty('BobKill.antialiasing', true);
		    setProperty('Watermark.antialiasing', true);
			setProperty('RonJumpscare.antialiasing', true);
				setProperty('BopRap.visible', true);
				setProperty('RonRap.visible', true);
				setProperty('BopKill.visible', true);
				setProperty('Watermark.visible', true);

		if del > 0 then
			del = del - 1
		end
		if del2 > 0 then
			del2 = del2 - 1
		end
	    if followchars == true then
	        if mustHitSection == false then
	            setProperty('defaultCamZoom',0.9)
	            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
	                triggerEvent('Camera Follow Pos',xx-ofs,yy)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
	                triggerEvent('Camera Follow Pos',xx+ofs,yy)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singUP' then
	                triggerEvent('Camera Follow Pos',xx,yy-ofs)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
	                triggerEvent('Camera Follow Pos',xx,yy+ofs)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
	                triggerEvent('Camera Follow Pos',xx-ofs,yy)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
	                triggerEvent('Camera Follow Pos',xx+ofs,yy)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
	                triggerEvent('Camera Follow Pos',xx,yy-ofs)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
	                triggerEvent('Camera Follow Pos',xx,yy+ofs)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
	                triggerEvent('Camera Follow Pos',xx,yy)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'idle' then
	                triggerEvent('Camera Follow Pos',xx,yy)
	            end
	        else

	            setProperty('defaultCamZoom',0.9)
	            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
	                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
	            end
	            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
	                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
	            end
	            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
	                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
	            end
	            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
	                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
	            end
				if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
	                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
	            end
				if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
	                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
	            end
				if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
	                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
	            end
				if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
	                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
	                triggerEvent('Camera Follow Pos',xx2,yy2)
	            end
	            if getProperty('dad.animation.curAnim.name') == 'idle' then
	                triggerEvent('Camera Follow Pos',xx2,yy2)
	            end
	        end
	    else
	        triggerEvent('Camera Follow Pos','','')
	    end

	end						


function OnCreatePost()	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'BopWaitig' then
		removeLuaSprite('BopRap', true)
	end
	if tag == 'BopReady' then
				
				objectPlayAnimation('BopRap', 'Bob Rapping At Camera', false)
				
				addLuaSprite('BopRap', true);
					
	     		setObjectCamera('BopRap', 'hud')
	end
	if tag == 'RonJumpscare' then
		addLuaSprite('RonJumpscare', true);
	end
	if tag == 'RonWaitig' then
		removeLuaSprite('RonRap', true)
	end
	if tag == 'RonReady' then
				
				objectPlayAnimation('RonRap', 'HELP', false)
				
				addLuaSprite('RonRap', true);
					
	     		setObjectCamera('RonRap', 'hud')
	end
	if tag == 'BopKill' then
		objectPlayAnimation('BopKill', 'He Dies', false)
		
	   addLuaSprite('BopKill', true);
   end
   if tag == 'BopKillt' then
		removeLuaSprite('BopKill', true)
	  end
end	