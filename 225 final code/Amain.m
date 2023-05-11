v=3.5
%set v value here

x0=[1;2;3;4];
xrange=[-0.5 5];

pre=4;
%change the values above as per needed
%pre=number of precision digits after decimal point

syms s;
r1=[0 0 1 0];
r2=[0 0 0 1];
r3=[ 13.67 0.225-1.319*v*v -0.164*v -0.552*v];
r4=[4.857 10.81-1.125*v*v 3.621*v -2.388*v];
A=[r1;r2;r3;r4];
B=[0;0;-.339;7.457];
zer=zeros(1,4);
C=eye(4);

D=[0;0;0;0];
sys=ss(A,B,C,D)

G=tf(sys)

disp("open loop transfer function is:")
g=G(1)
[num ,den] = tfdata(g);


% Commands added for nquist,root locus,bode plot
% uncomment for plots
% bodeplot(g);
% nyquistplot(g);
% rlocus(g);


denpoly=poly2sym(den{1},s);
denpoly1=denpoly*s;
sym2poly(denpoly1);
numpoly=poly2sym(num{1},s);
y_step=ilaplace(numpoly/denpoly1);

disp("unit_step_response_time_domain") 
disp(vpa(y_step,pre)); 

%uncommment for step response plot
% step(g) 
% ylabel("unit step response");
% xlabel("time");
 % ylim(yrange);

open_loop_zeroes=zero(g)
eigenvalues_of_A=eig(A)



%uncommment for zero inupt response plot
% y=initial(sys,x0);
% y1=y(:,1);
% plot(y1); 
% ylabel("Zero input response")
% xlabel("time")


open_loop_poles=pole(g)

syms t;
C1=[1 0 0 0]
[V, D] = eig(A);
x_zero_input = V * exp(D * t) * inv(V) * x0;
y_zero_input=C1*x_zero_input;
y_zero_input=vpa(y_zero_input,2)




% closed loop transfer function
disp("closed loop transfer function")
h0=minreal(g/(1+g))

 % closed loop poles
  closed_loop_poles=zero(1+g) 
 % alternatively
 closed_loop_poles=pole(h0)

 

 % closed  loop zeroes
  closed_loop_zeroes=zero(h0)

