v=0;%%%%%%%%%%%
x0=[1;2;3;4];%%%%%%%%%%%%%
pre=4;%%%%%%%%%%%%%%
%pre=number of precision digits
%set v value here

syms s;
r1=[0 0 1 0];
r2=[0 0 0 1];
r3=[ 13.67 0.225-1.319*v*v -0.164*v -0.552*v];
r4=[4.857 10.81-1.125*v*v 3.621*v -2.388*v];
A=[r1;r2;r3;r4];
B=[0;0;-.339;7.457];
zer=zeros(1,4);
C=eye(4); %doubtful, C is sus


%C=[1 0 0 0;zer;zer;zer]
%C=[1 0 0 0];
D=[0;0;0;0];
sys=ss(A,B,C,D);

G=tf(sys);
g=G(1)%%%%%%%%%%%;
[num ,den] = tfdata(g);


denpoly=poly2sym(den{1},s);
denpoly1=denpoly*s;
%sym2poly(denpoly1);
numpoly=poly2sym(num{1},s);
g_step=tf(num,sym2poly(denpoly1))
%numpoly/denpoly1
y_step=ilaplace(numpoly/denpoly1);

%disp(vpa(y_step,pre));%%%%%%%%%%%%%%%%%%%%%
fplot(y_step,[-0.5 5]);
ylabel("unit step response");
xlabel("time");
ylim([-5 5]);



zeroes=zero(g);%%%%%%%%%%%%%%
eigenvalues_of_A=eig(A);%%%%%%%%%%%%%%%
%step(g)
y=initial(sys,x0);
y1=y(:,1);
%%%%%%%%%%%plot(y1);
poles=pole(g);
