size={512,404}
defineProperty(      "NG",           globalPropertyf("sim/cockpit2/engine/indicators/N1_percent"))
defineProperty(      "T4",            globalPropertyf("sim/cockpit2/engine/indicators/EGT_deg_C"))
defineProperty(      "PA_m",       globalPropertyf("sim/flightmodel/position/elevation")) -- in metres
defineProperty(      "PowerOut", globalPropertyf("sim/cockpit2/engine/indicators/power_watts[0]")) 

local upper1 = loadImage('screen_1.png')
--local upper2 = loadImage('VEMD-upper-2.png')
local NGString = ''
local T4String = ''
local torqueString = ''
local stringLength = 0
--local needleAngle = 0

function draw() 
	drawAll(components)                                                    -- upper screen
	--if get(batteryON) > 0 then

		--if get(NG) > 60 then VEMD_mode = 2 	
			drawTexture(upper1, 0, 0, 512, 404)
	
			NGString = string.format("%d", get(NG)) -- 63% minimum
			stringLength = string.len(NGString)
			drawText(font_Sans36, (400-stringLength*5),330, NGString, 1,1,1)
			--local NG_ratio = (get(NG)  -63)/ 38 -- 63 to 101%
			--local FLI = NG_ratio
			--local FL = 330
	
			T4String = string.format("%d", get(T4)) -- about 400 deg minimum ??
			stringLength = string.len(T4String)
			drawText(font_Sans36, (433-stringLength*5),215, T4String, 1,1,1)
			--local T4_ratio = (get(T4) -390 )/ 440 -- 390 to 830
			--if T4_ratio  > FLI then 
			--	FLI = T4_ratio 
			--	FL = 215
			--end	
	
			--local JBkWb = 0.1*(get(PowerOut)/(300+get(PA_m)* 0.0492125985))  -- EC20
			local JBkWb = 0.1*(get(PowerOut)/(400+get(PA_m)* 0.0492125985))  -- GAZL
			
			
			torqueString = string.format("%.1f", JBkWb)
			stringLength = string.len(torqueString)
			drawText(font_Sans36, (445-stringLength*5),110, torqueString, 1,1,1)
			
			--local TQ_ratio = (JBkWb -30)/ 70 -- 30 to 100%
			--if TQ_ratio > FLI then 
				--FLI = TQ_ratio
				--FL = 110
			--end	
			
		--end
	
		local OATString = string.format("%.1f", get(OAT))
		stringLength = string.len(OATString)
		drawText(font_Sans36, (415-stringLength*5),10, OATString, 1,1,1)

		local FuelString = string.format("%d", get(fuelKg))
		stringLength = string.len(FuelString)
		drawText(font_Sans36, (13-stringLength*5),10, FuelString, 1,1,1)

		local fuelPercent = get(fuelKg)/323
		drawRectangle(4, 83, 16, fuelPercent*260, 0.8, 0, 0.7, 1)

	--end
end