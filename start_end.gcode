; start
G21 ; set units to millimeters
G90 ; use absolute positioning
M82 ; absolute extrusion mode
M107 ;start with the fan off

M104 S{material_print_temperature_layer_0} ; set extruder temp
M140 S{material_bed_temperature_layer_0} ; set bed temp
M190 S{material_bed_temperature_layer_0} ; wait for bed temp
M109 S{material_print_temperature_layer_0} ; wait for extruder temp

;M900 K0.04 ; K factor

M201 X1200 Y1200 Z1200 E5000 ; sets maximum accelerations, mm/sec^2
M203 X200 Y200 Z25 E100 ; sets maximum feedrates, mm/sec
M204 P1200 R5000 T1200 ; sets acceleration (P, T) and retract acceleration (R), mm/sec^2

G28 W ; home all without mesh bed level
G80 ; mesh bed leveling

G92 E0.0 ; reset extruder distance position
G1 X0.0 Y0.0 Z0.3 F6000.0 ; go outside print area
G1 X160.0 E50.0 F1000.0 ; intro line
G92 E0.0 ; reset extruder distance position


; end
M104 S0 ;extruder heater off
M140 S0 ;bed heater off
M107      ;fan off

G91 ;relative positioning
G1 Z+0.5 E-10.0 ;retract the filament a bit before lifting the nozzle, to release some of the pressure

G90 ;absolute positioning
G1 X20 Y190 F3000.0 ;move X/Y, so the head is out of the way

M84 ;steppers off