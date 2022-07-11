set terminal pngcairo dashed truecolor enhanced font "Times New Roman, 30" size 1200,1084
set output 'plot61v2.png'

set logs
#set log cb
set xr [1e-02:1e7]
set yr [1e-48:1e-34]
#set cbr [1e-5:100]

set xl "Dark matter mass M_{DM} [GeV]" 
set yl "DM-proton cross section {/Symbol s}_{p} [cm^2]" 
#set cbl "T [10^{3} K]" 

set format x "10^{%L}"
set format y "10^{%L}"
#set format cb "10^{%L}"

set label "{/Symbol r}_{DM} = 10^{3} GeV cm^{-3}" at 3e3,1e-35 front
set label "{CRESST-III}" at 0.55,1e-35 rotate by -83 left font ",17" tc rgb "blue" front
set label "{CDMSlite}" at 2,1e-35 rotate by -90 left font ",17" tc rgb "#006400" front
set label "{XENON-1T}" at 9,1e-35 rotate by -90 left font ",17" tc rgb "red" front
set label "{Saturation Limit}" at 1e2,3e-43 rotate by  0 left font ",17" front
set label "{This Work}" at 1e2,1.2e-44 rotate by 0 left font ",17" front

#set palette defined ( 0 "green", 1 "blue", 2 "red", 3 "orange" 
#set key top right
#set key box width 0.1 height 0.5 opaque

er(x)=1e-4 * ((x**2) * 12.0)/((x + 12.0)**2)
Helm2(x)=exp(-er(x)/8.8e-4)

RMRsqr(x)=((12*(x+1.0))/(x+12.0))**2

set tics front

p "file2.txt" u (10**($1)):(8.3e-40/(144.0*Helm2(10**($1))*RMRsqr(10**($1)))) w filledcu y1=1e-34 fs solid 0.5 lc rgb "#A9A9A9" notitle,\
"file2.txt" u (10**($1)):(8.3e-40/(144.0*Helm2(10**($1))*RMRsqr(10**($1)))) w filledcu y1=0 fs solid 0.5 lc rgb "#696969" notitle,\
"file2.txt" u (10**($1)):((1e4*(10**($2)))/(144.0*Helm2(10**($1))*RMRsqr(10**($1)))) w filledcu y1=0 lc rgb "white" notitle,\
"cresst3_new.dat" u 1:($2) w l lc rgb "blue" lw 5 dashtype 1 notitle ,\
"x1t_firstresults.dat" u 1:($2*1.0) smooth bezier lc rgb "red" lw 5 dashtype 1 notitle ,\
"CDMSlite.dat" u 1:($2) w l lc rgb "#006400" lw 5 dashtype 1 notitle,\
"file2.txt" u (10**($1)):(8.3e-40/(144.0*Helm2(10**($1))*RMRsqr(10**($1))))  w l lc rgb "black" lw 3 dashtype 2 notitle,\
"file2.txt" u (10**($1)):((1e4*(10**($2)))/(144.0*Helm2(10**($1))*RMRsqr(10**($1)))) w l lc rgb "black" lw 5 dashtype 1  notitle
