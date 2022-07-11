set terminal pngcairo dashed enhanced font "Times New Roman, 30" size 1200,1084
set output 'plot3.png'

set log y
#set log cb
set yr [1:]
set xr [:10]

set xl "White dwarf radius R [10^{6} m]" 
set yl "Luminosity L [10^{28} GeV s^{-1}]" 
#set cbl "T [10^{3} K]"
set label "T [10^{3} K]" at 10.1,5e5

set format y "10^{%L}"
#set format x "%f"
#set format cb "10^{%L}" 

set mxtics 4
set title "Electrons"

#set label "M_{DM} = 400 MeV" at 7,4e5 font ",20"
#set label "{{/Symbol r}_{DM} = 10^{3} GeV cm^{-3}}" at 7,2e5 font ",20"
#set label "{{/Symbol s}_p = 10^{-43} cm^2}" at 3,29 rotate by 31 left font ",17" front
#set label "{{/Symbol s}_p = 3x10^{-43} cm^2}" at 2.5,52 rotate by 32 left font ",17" front
#set label "{{/Symbol s}_p = 10^{-44} cm^2}" at 3.8,6 rotate by 24 left font ",17" front
#set label "{{/Symbol s}_p = 10^{-42} cm^2}" at 2,90 rotate by 37 left font ",17" front
#set label "{{/Symbol s}_{int} = {/Symbol s}_{sat} (R)}" at 1.,200 rotate by 41 left font ",17" front

set label "M_{DM} = 10 GeV" at 3,280 font ",20"
set label "{{/Symbol s}_{self} = 10^{-23} cm^{2}}, {/Symbol s}_{ann} = 10^{-29} cm^3 s^{-1} " at 3,150 font ",20"
set label "T_{core} = 10^6 K" at 3,80 font ",17" front

set palette defined ( 0 "red", 1 "orange", 2 "green", 3 "blue" )

set tics front

set key bottom right

set colorbox user origin graph 1.02, graph 0 size 0.04, graph 0.9
set rmargin at screen 0.85

p "data1.dat" u 1:2 w l lc rgb "black" dashtype 1 lw 3 title "{{/Symbol s} = 10^{-40} cm^2" ,\
"data2.dat" u 1:2 w l lc rgb "green" dashtype 1 lw 3 title "{{/Symbol s} = 10^{-42} cm^2" ,\
"dataSigmaSat.dat" u 1:3 w l lc rgb "brown" lw 5 title "{/Symbol s}_{sat}" ,\
"LTheatPlot.dat" u ($1/1.0):($2/1.0):($3/1.0) w p pt 7 ps 2 lc palette notitle
