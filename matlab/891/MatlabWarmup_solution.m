clc;clear;
%First Problem
x=linspace(-10,10,200);
y1=(1-2*x)/3;
y2=x-2;
figure(1);plot(x,y1,'LineWidth',3); hold on;
plot(x,y2,'LineWidth',3); hold off;

A=[2 3;1 -1];B=[1;-1];X=A\B;
x0=X(1);
y0=X(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=logspace(-5,1,200);
figure(2);plot(x,sin(x)./x,'LineWidth',3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Second Problem
A=[1 -1 2;-3 1 1;1 4 -6];
B=[0.50 0.35 0.15;0.35 0.60 0.05;0.15 0.05 0.80];
C=[1 -1;1 2;-3 2];
a0=A*A;
b0=A*B;
c0=B*A;
d0=A*C;
e0=C*C';
f0=C'*C;
g0=(A'+A)/2;

if  (A*B==B*A)
    sprintf('A*B equal to B*A')
else
    sprintf('A*B not equal to B*A')
end

if  ((A+A')/2==(A+A')'/2)
    sprintf('(A+A^T)/2 is symmetric')
else
    sprintf('(A+A^T)/2 is not symmetric')
end

if  ((A-A')/2==-(A-A')'/2)
    sprintf('(A-A^T)/2 is anti-symmetric')
else
    sprintf('(A+A^T)/2 is not anti-symmetric')
end

if  ((A*B)'==B'*A')
    sprintf('(A*B)^T is equal to B^T*A^T')
else
    sprintf('(A*B)^T is not equal to B^T*A^T')
end

if  (inv(A*B)==inv(A)*inv(B))
    sprintf('(A*B)^T is equal to B^T*A^T')
else
    sprintf('(A*B)^T is not equal to B^T*A^T')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Third Problem;
A=rand(4,4);B=rand(4,4);
a1=A^2-A*A;
b1=inv(A)*A^2*inv(A);
c1=inv(A)^2*A^2;
d1=A^3*A^(-3);
e1=A*A'-A'*A;
f1=A*A-A.*A;
g1=A.^3-A^3;
h1=A.^(-1)-A^(-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fourth Problem;
A=rand(5,5);B=rand(5,5);
a2=det(A);
b2=det(3*A);
c2=det(A')-det(A);
d2=det(A)+det(B);
e2=det(A+B);
f2=det(A*B);
g2=det(B*A);
h2=det(A'*B');
i2=det(B'*A');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fifth Problem 
A=rand(5,5);
[v,l]=eig(A);
for i=1:5
    E1(i)=abs(det(A-eye(5,5)*l(i,i)));
    E2(i)=mean(abs(A*v(:,i)-l(i,i)*v(:,i)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Sixth Problem 
N0=20;
y0=zeros(N0,1);
err=y0;
y0(1)=1.0;
for i=1:N0
    y0(i+1)=y0(i)+1/factorial(i);
    err(i)=abs(exp(1)-y0(i+1));
end
figure(3);plot(1:N0,err,'LineWidth',3); 
figure(4);semilogy(1:N0,err,'LineWidth',3); 
figure(5);loglog(1:N0,err,'LineWidth',3); 
    
%Seventh Problem
h=[1.0e-1 5.0e-2 1.0e-2 1.0e-2 5.0e-3 1.0e-3];
Dp=(sin(1+h)-sin(1))./h;
Dm=(sin(1)-sin(1-h))./h;
D0=(sin(1+h)-sin(1-h))./(2*h);
D3=(2*sin(1+h)+3*sin(1)-6*sin(1-h)+sin(1-2*h))./(6*h);
figure(6);loglog(h,abs(Dp-cos(1)),'-o','LineWidth',3); hold on;
figure(6);loglog(h,abs(Dm-cos(1)),'-+','LineWidth',3); hold on;
figure(6);loglog(h,abs(D0-cos(1)),'->','LineWidth',3); hold on;
figure(6);loglog(h,abs(D3-cos(1)),'--','LineWidth',3); hold on;    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=logspace(-10,-1,100);
Dp=(sin(1+h)-sin(1))./h;
Dm=(sin(1)-sin(1-h))./h;
D0=(sin(1+h)-sin(1-h))./(2*h);
D3=(2*sin(1+h)+3*sin(1)-6*sin(1-h)+sin(1-2*h))./(6*h);
figure(7);loglog(h,abs(Dp-cos(1)),'-o','LineWidth',3); hold on;
figure(7);loglog(h,abs(Dm-cos(1)),'-+','LineWidth',3); hold on;
figure(7);loglog(h,abs(D0-cos(1)),'->','LineWidth',3); hold on;
figure(7);loglog(h,abs(D3-cos(1)),'--','LineWidth',3); hold on; 


