size={222,88}

function draw() -- Central Warning Panel
	drawAll(components) 
	if get(batteryON) > 0 then	
		if get(cwpTest) == 1 then 
			drawText(font_Sans12, 4, 74, 'FUEL' , 0.7, 0.5, 0)
			drawText(font_Sans12,  4, 45, 'FUEL' , 0.7, 0.5, 0)
			drawText(font_Sans12, 15, 33, 'P' ,   0.7, 0.5, 0)	
			drawText(font_Sans12,  4, 18, 'FUEL' , 0.7, 0.5, 0)
			drawText(font_Sans12,  6,   5, 'FILT' ,   0.7, 0.5, 0)
			drawText(font_Sans12, 39, 74, 'GENE' , 0.7, 0.5, 0)
			drawText(font_Sans12,  41, 45, 'BATT' , 0.7, 0.5, 0)
			drawText(font_Sans12,  41, 18, 'BATT' , 0.7, 0.5, 0)
			drawText(font_Sans12,  40,   5, 'FUSE' ,   0.7, 0.5, 0)	
			drawText(font_Sans12, 76, 74, 'PITOT' , 0.7, 0.5, 0)
			drawText(font_Sans12,  74, 45, 'HORN' , 0.7, 0.5, 0)
			drawText(font_Sans12,  78, 18, 'MGB' , 0.7, 0.5, 0)
			drawText(font_Sans12,  76,   5, 'TEMP' ,   0.7, 0.5, 0)
			drawText(font_Sans12, 116, 74, 'ENG' , 0.7, 0.5, 0)
			drawText(font_Sans12,  116, 62, 'CHIP' , 0.7, 0.5, 0)
			drawText(font_Sans12,  120, 45, 'GB' , 0.7, 0.5, 0)
			drawText(font_Sans12,  115, 33, 'CHIP' , 0.7, 0.5, 0)
			drawText(font_Sans12,  115, 22, '____' , 0.7, 0.5, 0)
			drawText(font_Sans12,  115,   12, '____' ,   0.7, 0.5, 0)
			drawText(font_Sans12, 153, 74, 'ENG' , 1.0, 0.1, 0)
			drawText(font_Sans12, 164, 62, 'P' , 1.0, 0.1, 0)
			drawText(font_Sans12,  153, 45, 'MGB' ,1.0, 0.1, 0)
			drawText(font_Sans12, 164, 33, 'P' ,  1.0, 0.1, 0)	
			drawText(font_Sans12,  155, 18, 'TWT' , 1.0, 0.1, 0)
			drawText(font_Sans12,  153,   5, 'GRIP' ,  1.0, 0.1, 0)
			drawText(font_Sans12, 190, 74, 'ENG' , 1.0, 0.1, 0)
			drawText(font_Sans12, 190, 62, 'FIRE' , 1.0, 0.1, 0)
			drawText(font_Sans12,  190, 45, 'BATT' ,1.0, 0.1, 0)
			drawText(font_Sans12, 187, 33, 'TEMP' ,  1.0, 0.1, 0)	
			drawText(font_Sans12,  187, 18, 'HYDR' , 1.0, 0.1, 0)
		else
			if get(fuelKg) < 30 then
				drawText(font_Sans12, 4, 74, 'FUEL' , 0.7, 0.5, 0) --  < 30 kg 
			else
				drawText(font_Sans12, 4, 74, 'FUEL' , 0.1, 0.2, 0) --  [13.17 of TM]		
			end
			drawText(font_Sans12,  4, 45, 'FUEL' , 0.1, 0.2, 0) -- < 0.2 bar
			drawText(font_Sans12, 15, 33, 'P' ,   0.1, 0.2, 0)	
		
			drawText(font_Sans12,  4, 18, 'FUEL' , 0.1, 0.2, 0) -- pre clogging warning
			drawText(font_Sans12,  6,   5, 'FILT' ,   0.1, 0.2, 0)
			-- note: LACU has a "PUMP" button to operate starting pump (with green lights)
		
			if get(NF) < 0.5 then
				drawText(font_Sans12, 39, 74, 'GENE' , 0.7, 0.5, 0) 	-- Only normally on at start/shutdown <50% NG  <18Vdc [9.21 - 9.41 of TM]
			else
				drawText(font_Sans12, 39, 74, 'GENE' , 0.1, 0.2, 0)
			end
			drawText(font_Sans12,  41, 45, 'BATT' , 0.1, 0.2, 0) -- FAIL or GPU attached --  [9.11 of TM]
		
			drawText(font_Sans12,  41, 18, 'BATT' ,  0.1, 0.2, 0) -- 225A
			drawText(font_Sans12,  40,   5, 'FUSE' ,  0.1, 0.2, 0) --  [9.11 of TM]

			drawText(font_Sans12, 76, 74, 'PITOT' , 0.1, 0.2, 0) -- LACU switch  [19.5 of TM] light on = failure  [19.5 of TM] 
		
			if get(NR) > 420 or get(NR) <370 then
				drawText(font_Sans12,  74, 45, 'HORN' , 0.7, 0.5, 0) -- sound enabled when when you press the HORN button on the LACU? 
			else
				drawText(font_Sans12,  74, 45, 'HORN' , 0.1, 0.2, 0)
			end
			-- NR min/max aural warning ?
			--  [5.26 to 5.32 of TM]
			-- NR > 420 = interrupted tone
			-- NR < 370 = continuous tone
		
			drawText(font_Sans12,  78, 18, 'MGB' ,    0.1, 0.2, 0)  -- amber light comes on 
			drawText(font_Sans12,  76,   5, 'TEMP' ,   0.1, 0.2, 0) -- at > 120deg C [5.24 of TM]
	
			drawText(font_Sans12, 116, 74, 'ENG' , 0.1, 0.2, 0) -- [14.23 of TM]
			drawText(font_Sans12,  116, 62, 'CHIP' , 0.1, 0.2, 0)
		
			drawText(font_Sans12,  120, 45, 'GB' ,    0.1, 0.2, 0) -- either main or tail rotor
			drawText(font_Sans12,  115, 33, 'CHIP' , 0.1, 0.2, 0) -- chip detectors  [5.24 of TM]
		
			drawText(font_Sans12,  115, 22, '____' ,  0.1, 0.2, 0)
			drawText(font_Sans12,  115, 12, '____' ,  0.1, 0.2, 0)
	
			local EOP = get(engOilPressure)/14.5
			if EOP < 1.7 then
				drawText(font_Sans12, 153, 74, 'ENG' ,  1, 0.2, 0) -- < 1.7 bar
				drawText(font_Sans12, 164, 62,    'P' ,    1, 0.2, 0) -- [14.23 of TM]
			else
				drawText(font_Sans12, 153, 74, 'ENG' , 0.3, 0.0, 0) 
				drawText(font_Sans12, 164, 62,    'P' ,   0.3, 0.0, 0) 
			end
		
			drawText(font_Sans12,  153, 45, 'MGB' ,0.3, 0.0, 0) -- Pressure less
			drawText(font_Sans12, 164, 33, 'P' ,       0.3, 0.0, 0) -- than 1 bar  [5.24 of TM]
		
			if get(NF) < 0.6 then
				drawText(font_Sans12,  155, 18, 'TWT' , 1, 0.2, 0) 
				drawText(font_Sans12,  153,   5, 'GRIP' ,  1, 0.2, 0) 
			else
				drawText(font_Sans12,  155, 18, 'TWT' , 0.3, 0.0, 0) -- when not in "FLIGHT" position
				drawText(font_Sans12,  153,   5, 'GRIP' ,  0.3, 0.0, 0) -- [14.35 of TM]  "gong" sound [14.53 of TM] 		
			end

			drawText(font_Sans12, 190, 74, 'ENG' , 0.3, 0.0, 0) -- --  [5.30 of TM] either real fire or FIRE TEST button of LACU
			drawText(font_Sans12, 190, 62, 'FIRE' , 0.3, 0.0, 0) -- also 16.7 of TM
		
			drawText(font_Sans12,  190, 45, 'BATT' ,0.3, 0.0, 0) --  when > 71 deg C 
			drawText(font_Sans12, 187, 33, 'TEMP' ,  0.3, 0.0, 0)	--  [9.10-11 of TM] also audible warning
		
			drawText(font_Sans12,  187, 18, 'HYDR' , 0.3, 0.0, 0) -- loss of pressure, pump failure or leak [10.12 of TM] 
	
		end -- of cwpTest switch testing
	end -- of if get(batteryON) > 0
end
