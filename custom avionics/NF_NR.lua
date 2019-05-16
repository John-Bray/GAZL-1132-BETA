size={256,256}

local LED_16 = loadImage('LED_16.png')

function draw() 
	drawAll(components) 
	
	if get(batteryON) > 0 then
	
		local currentNR = math.floor(get(NR))
		local currentNF = math.floor(get(NF)*currentNR* 0.01) -- as RPM!!!
	
	
		-- --------------------------------------------------------------------------- NF (N2)
		local NF_steps = 1	
		if currentNF > 340 then -- for everything above 340 rpm
			-- 100% = 409 (the redline setting in engines)	
			-- 340 to 450rpm over 11 15-deg steps (165 deg) == 33 deg steps
			-- = 33 steps for 110 rpm = 3.333 rpm per 5-deg step
			NF_steps = math.floor((currentNF-340)/3.333)	
			for i=1, NF_steps+1 do
				drawRotatedTexture(LED_16, 55+(i*5), 123.5, 20,  9, 215)
			end
			for i=1, 13 do
				drawRotatedTexture(LED_16, -10+(i*5), 123.5, 20,  9, 215)
			end
		else  -- low rpm -10 to +55 = 65deg for 200 rpm 
			  -- = 13 steps for 200 rpm = 15.38 rpm per 5-deg step
			NF_steps = math.floor((currentNF-150)/15.38)
			for i=1, NF_steps+1 do
				drawRotatedTexture(LED_16, -10+(i*5), 123.5, 20,  9, 215)
			end
		end
		-- ------------------------------------------------------------------------- ROTOR RPM
		local NR_steps = 1	
		--currentNR = 200-- for testing ONLY
		if currentNR > 340 then -- for everything above 340 rpm
			-- during flight phase
			-- 340 to 450rpm over 11 15-deg steps (165 deg) == 33 deg steps
			-- = 33 steps for 110 rpm = 3.333 rpm per 5-deg step
			NR_steps = math.floor((currentNR-340)/3.333)
			for i=1, NR_steps+1 do
				drawRotatedTexture(LED_16, 55+(i*5), 124, 31, 8, 194)
			end
			for i=1, 13 do
				drawRotatedTexture(LED_16, -10+(i*5), 124, 31, 8, 194)
			end
		else  -- low rpm -10 to +55 = 65deg for 200 rpm 
			  -- = 13 steps for 200 rpm = 15.38 rpm per 5-deg step
			NR_steps = math.floor((currentNR-150)/15.38)
			for i=1, NR_steps+1 do
				drawRotatedTexture(LED_16, -10+(i*5), 124, 31,  8, 194)
			end
		end
		
		
	
	end
end
