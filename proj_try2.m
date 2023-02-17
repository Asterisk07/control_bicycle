v=0;
%set v value here

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
syms s;
I=eye(4);
temp=(s*I-A);
 temp3=temp\B;
%temp4=(inv(temp))*B
G=C*(temp3);
%G1=C*(temp4)
%G1=C1*(temp3)
G0=G(1);
%h=tf([1 2],[1 2 3]);
%transfer function is first elemetn of G
eigenvalues_of_A=eig(A)
[N,D]=numden(G0);
disp(d0)
n=sym2poly(N);
%highest coefficient first
d=sym2poly(D);

g=tf(n,d)

[num den] = tfdata(g);
poles=pole(g);
zeroes=zero(g);
%part2
disp(d0);
D2=d0; %why is D1 = s*d0 when i just assigned D1=d0
d2=sym2poly(D2);
g2=tf(n,d2)
x0=[1;2;3;4];

[num den] = tfdata(g2);
G1=G0/s;
y2=ilaplace(G1)

%fplot(-y2,[-2 10]) % why am i getting negative plot for normal y1
yticks(-10:1:2)
i=eye(4)
invtemp=temp\i;
a=invtemp*temp
b=inv(temp)*temp














