size={512,404}
defineProperty(      "NG",           globalPropertyf("sim/cockpit2/engine/indicators/N1_percent"))
defineProperty(      "T4",            globalPropertyf("sim/cockpit2/engine/indicators/EGT_deg_C"))
defineProperty(      "PA_m",       globalPropertyf("sim/flightmodel/position/elevation")) -- in metres
defineProperty(      "PowerOut", globalPropertyf("sim/cockpit2/engine/indicators/power_watts[0]")) 
local needle1 = loadImage('needle1.png')
local needle2 = loadImage('needle2.png')
local upper1 = loadImage('VEMD-upper-1.png')
local upper2 = loadImage('VEMD-upper-2.png')
local NGString = ''
local T4String = ''
local torqueString = ''
local stringLength = 0
local needleAngle = 0

function draw() 
	drawAll(components)                                                    -- upper screen
	local VEMD_mode = 0
	if get(batteryON) > 0 then
	
	
	
	
	
		if get(NG) > 0  and get(NG) <=60 then VEMD_mode = 1 
			drawTexture(upper1, 0, 0, 512, 404)
		
			T4String =  string.format("%d", get(T4)) -- about 400 deg minimum ??
			stringLength = string.len(T4String)
			drawText(font_Sans36, (270-stringLength*5), 250,  T4String, 1,1,1)
			needleAngle = -48 + ((get(T4) -300)*0.161)
			-- 1,000 deg C = 120deg
			--needleAngle = -63-- calibration zero
			--needleAngle = -48-- calibration 300
			--needleAngle = -30-- calibration 400
			--needleAngle = -15 -- calibration 500
			--needleAngle = 0 -- calibration 600
			--needleAngle = 65 -- calibration 1000
			-- 300 to 1,000 = 48+65 = 113 degrees for 700C = (*0.161)
			
			if get(T4) < 300 then
			--15 deg for 300C  
				needleAngle = -63 + ((get(T4) )*0.05)
			end
			drawRotatedTexture(needle1, needleAngle, 282, 110, 15, 260)		

			local JBkWb = 0.1*(get(PowerOut)/(300+get(PA_m)* 0.0492125985)) 
			torqueString = string.format("%.1f", JBkWb)
			stringLength = string.len(torqueString)
			drawText(font_Sans36, (170-stringLength*5), 92, torqueString, 1,1,1)
			needleAngle = -105 + (JBkWb*1.6)
			--needleAngle = -105-- calibration zero
			--needleAngle = 0 -- calibration 62
			--needleAngle = 55 -- calibration 100
			-- ZERO to 100 = 160 degrees
			drawRotatedTexture(needle1, needleAngle, 175, 30, 15, 200)	
			
			
					
			NGString = string.format("%d", get(NG)) -- 63% minimum
			stringLength = string.len(NGString)
			drawText(font_Sans36, (380-stringLength*5),92, NGString, 1,1,1)
			needleAngle = -70 -- calibration 90%
			--needleAngle = 0 -- calibration 96.5%
			--needleAngle = 105-- calibration 106%
			-- 175 degrees for 21%
			--local testNG =105
			--needleAngle = -70 + ( (testNG -90)*10.76)
			if  get(NG) > 90 then  needleAngle = -70 + ((get(NG) -90 )*10.76) end
			drawRotatedTexture(needle1, needleAngle, 390, 30, 15, 200)	
				
				
	
		end
		if get(NG) > 60 then VEMD_mode = 2 	
			drawTexture(upper2, 0, 0, 512, 404)
	
			NGString = string.format("%d", get(NG)) -- 63% minimum
			stringLength = string.len(NGString)
			drawText(font_Sans36, (400-stringLength*5),330, NGString, 1,1,1)
			local NG_ratio = (get(NG)  -63)/ 38 -- 63 to 101%
			--drawText(font_Sans36, 100,90, NG_ratio, 0.9,0.5,0.5)	
			local FLI = NG_ratio
			local FL = 330
	
			T4String = string.format("%d", get(T4)) -- about 400 deg minimum ??
			stringLength = string.len(T4String)
			drawText(font_Sans36, (433-stringLength*5),215, T4String, 1,1,1)
			local T4_ratio = (get(T4) -390 )/ 440 -- 390 to 830
			--drawText(font_Sans36, 100,50, T4_ratio, 0.5,0.9,0.5)	
			if T4_ratio  > FLI then 
				FLI = T4_ratio 
				FL = 215
			end	
	
			local JBkWb = 0.1*(get(PowerOut)/(300+get(PA_m)* 0.0492125985)) 
			torqueString = string.format("%.1f", JBkWb)
			stringLength = string.len(torqueString)
			drawText(font_Sans36, (445-stringLength*5),110, torqueString, 1,1,1)
			local TQ_ratio = (JBkWb -30)/ 70 -- 30 to 100%
			--drawText(font_Sans36, 100,10, TQ_ratio, 0.5,0.5,0.9)	
			if TQ_ratio > FLI then 
				FLI = TQ_ratio
				FL = 110
			end	

			drawRectangle(430, FL-10, 80, 6, 0.1,0.1,0.1,1) -- testing only, really
			if FLI > 0.9 then
				drawRectangle(430, FL-10, 80, 6, 1,1,0,1)
			end 
			if FLI >1.0 then
				drawRectangle(430, FL-10, 80, 6, 1, 0,0,1)
			end 
				drawText(font_Sans12, 150,50, 'VEH PARAM', 1,1,1)	
				drawText(font_Sans12, 150,10, 'OVER LIMIT', 1,1,1)	

			needleAngle = -125 + (FLI*212)
			--needleAngle = -125-- calibration zero
			--needleAngle = 0 -- calibration SIX
			--needleAngle = 87 -- calibration TEN
			-- ZERO to TEN = 212 degrees
			drawRotatedTexture(needle2, needleAngle, 230, 90, 18, 262)	
			
		end
	
		local OATString = string.format("%.1f", get(OAT))
		stringLength = string.len(OATString)
		drawText(font_Sans36, (415-stringLength*5),10, OATString, 1,1,1)

		local FuelString = string.format("%d", get(fuelKg))
		stringLength = string.len(FuelString)
		drawText(font_Sans36, (13-stringLength*5),10, FuelString, 1,1,1)

		local fuelPercent = get(fuelKg)/323
		drawRectangle(4, 83, 16, fuelPercent*260, 0.8, 0, 0.7, 1)

	end
end