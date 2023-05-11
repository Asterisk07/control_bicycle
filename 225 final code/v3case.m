% to get the closed loop poles

%v=5 case
v=5
x0=[1;2;3;4];
xrange=[-0.5 5];

pre=4;
%change the values above as per needed
%pre=number of precision digits after decimal point
%set v value here
%uncomment the long % lines to get outputs
syms s;
r1=[0 0 1 0];
r2=[0 0 0 1];
r3=[ 13.67 0.225-1.319*v*v -0.164*v -0.552*v];
r4=[4.857 10.81-1.125*v*v 3.621*v -2.388*v];
A=[r1;r2;r3;r4];
B=[0;0;-.339;7.457];
zer=zeros(1,4);
C=eye(4);


%C=[1 0 0 0;zer;zer;zer]
%C=[1 0 0 0];
D=[0;0;0;0];
sys=ss(A,B,C,D);

G=tf(sys);
g=G(1)

[num ,den] = tfdata(g);


% k=-11
% c=-0.4 to -1.8 for stable
c=1 %location of zero
controller=s-c
denpoly=poly2sym(den{1},s);
vpa(denpoly,2);
numpoly=poly2sym(num{1},s);
numpoly1=numpoly*controller;
numnew=sym2poly(numpoly1) ;
disp("location of added zero:")


% open loop transfer function after adding PD controller
disp("open loop transfer function after adding PD controller")
g1=tf(numnew,den{1})


% closed loop transfer function
% h0=(g/(1+g));


 % closed loop poles
 % z=zero(1+g) ;

 

  disp("closed loop transfer function after adding the PD controller:")
  % closed loop transfer function after adding the PD controller
  h=minreal((g1/(g1+1)))
 
  disp("closed loop zeroes after adding PD controller:")
  % closed loop zeroes after adding PD controller
  zero(h) 

disp("closed loop pole after adding PD controller:")
  pole(h)
 disp("or:")
   z1=zero(1+g1)
   display("here we took a value as example to show that how stability can be achieved. Exact values for  controller are found using sisotool. Please load the v3controller.mat session file into sisotool")
 % uncomment for sisotool
   % sisotool(); 
