; start
M75 ;start timer

G90 ;absolute positioning
M83 ;extruder relative mode

M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M109 S[first_layer_temperature] ; wait for extruder temp

G92 E0.0
G1 E-5.0 ;retract
M106 S128 ; turn on fan

G28 W ; home all without mesh bed level
G80 ; mesh bed leveling

M190 S[first_layer_bed_temperature] ; wait for bed temp

M107 ; turn off fan
G1 E0.0

G92 E0.0
G1 X0.0 Y-3.0 Z0.25 F6000 ; go outside print area
G1 X210.0 E60.0 F1000.0 ; intro line
G92 E0.0



; end
G91 ;relative positioning
G1 E-15.0 ;retract the filament a bit before lifting the nozzle, to release some of the pressure

M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan

G90 ;absolute positioning

M77 ;end timer
