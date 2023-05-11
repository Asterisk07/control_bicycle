<h1> Notes on the code: </h1>
<h2> 1. Amain contains the all code except the controllers portion. 
<h3> a) Change the value of 'v' at the top to get the values for different values.
<h3> b) Bode, Nyquist, root locus plots, as well as Zero input response plot and Step response plots are all commented. PLease uncomment them to get the plot.We have inserted the bode plots by running siso tools so that we get the phase and gain margin too along with the plot as in on running normal bodeplot(tranferfunction) we don't get the phase and gain margin and the plots in both cases are same.You can obtain the bode plot from siso tool by running sisotool(g) for the open loop transfer function.
<h2> 2. v2case.m (v=3.5 m/s) and v3case.m (v=5 m/s) contain the code where we demonstrated stability using example values , using Proportional controller and PID controller respectively.
<h3> 3. Please launch sisotool and import the session data files v2controller.mat [proportional controller for v=3.5 m/s]   and v3controller.mat [PID controller for v=5 m/ps]  to see the entire controller parameters including compensator, design requirements, Root locus plot, Step response plot etc.
