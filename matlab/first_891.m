N=2000;
A = rand(N);
B = rand(N,1);

tic
C1 = A\B;
toc

tic
C2 = inv(A)*B;
toc