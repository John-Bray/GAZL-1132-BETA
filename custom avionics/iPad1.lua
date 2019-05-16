size={256,192}

function draw()  -- pitch + power
	drawAll(components) 
	local textForPrinting	  = '-'
	local currentPitch	      = 0.1*math.floor(10*get(collectivePitch))
	local currentEngTq    = math.floor(get(engTq))
	local currentEng_kW = math.floor( 0.5+ (get(engWatts)/1000))
	local currentNR         = math.floor(get(NR))
	local currentThrottle	  =  math.floor(get(throttle)       *100)  -- convert tp percentage
	local currentAlt          = math.floor(get(altitude_m)*  3.2808399)	
	local angularVelocity = 0.1 * math.floor(0.5+   (10* 2 * 3.14159 * get(NR)/60 )  ) -- RadiansPerSecond
	local currentPedals 	  = 0.1*math.floor(get(pedals) *1000)
	local currentTRPtitch =  0.1*math.floor(get(TRPtitch)    *10)  -- 1dp

	drawText(font_Sans12, 15, 5, 'Power' , 1,0,0)
	
	textForPrinting = 'Rotor speed: '  .. currentNR .. 'rpm = ' .. angularVelocity .. ' Radians/second'
	drawText(font_Sans10, 10, 150, textForPrinting, 1,1,1)	
	
	textForPrinting = 'Engine Power: '  .. currentEng_kW .. 'kW'
	drawText(font_Sans10, 10, 140, textForPrinting, 1,1,1)
	
	local torqueCalc =  math.floor (get(engWatts) / angularVelocity)
	textForPrinting = 'Power / Angular velocity = '  .. torqueCalc .. 'Nm'
	drawText(font_Sans10, 10, 130, textForPrinting, 1,1,1)	

	textForPrinting = 'Engine Torque: '  .. currentEngTq .. 'Nm (from XP dataref)'
	drawText(font_Sans10, 10, 120, textForPrinting, 1,1,1)	
	
	textForPrinting = 'Altitude: '  .. currentAlt .. 'ft'
	drawText(font_Sans10, 10, 100, textForPrinting, 1,1,1)	
	
	-- Powerplant: 1 × Turbomeca Astazou IIIA turboshaft, 440 kW (590 hp) NR should be 386 [SA341G]
	local trorqueLimit_kW = math.floor(0.5 + 400+(0.015*currentAlt)  +  currentNR-386) 

	textForPrinting = 'Torque limit is at: '  .. trorqueLimit_kW .. 'kW ('.. math.floor(0.5 + (1.341* trorqueLimit_kW)) .. 'hp)'
	drawText(font_Sans10, 10, 90, textForPrinting, 1,1,1)	
	
	local TqReading =  math.floor ((100*currentEng_kW /trorqueLimit_kW) +0.5)
	textForPrinting = 'Torque reading '  .. currentEng_kW .. ' / '.. trorqueLimit_kW .. '=' .. TqReading .." percent"
	drawText(font_Sans10, 10, 80, textForPrinting, 1,1,1)	

	textForPrinting = 'Blade pitch: '  .. currentPitch .. 'deg'
	drawText(font_Sans10, 10, 30, textForPrinting, 1,1,1)	

	textForPrinting = 'Engine Throttle: '  .. currentThrottle .. '%'
	drawText(font_Sans10, 10, 20, textForPrinting, 1,1,1)
	
end
	
function update()
		local currentEng_kW = math.floor( 0.5+ (get(engWatts)/1000))
		local currentAlt           = math.floor(get(altitude_m)*  3.2808399)	
		local currentNR          = math.floor(get(NR))
		local trorqueLimit_kW = math.floor(0.5 + 400+(0.015*currentAlt)  +  currentNR-386) 
		local TqReading         =  math.floor ((100*currentEng_kW /trorqueLimit_kW) +0.5)
		set(TqPercent, TqReading)
end
	