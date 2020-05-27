%Manipulation 3
N=1000;
sigma=[2 1;1 2];
[U,D]=eig(sigma);
sigma2=U*D.^(0.5)*U;
mu=[0.2;0.2];
x=randn(2,N);
y = mu +sigma2*x;
%Manipulation 4
figure;
histo2D(transpose(y),[-5,5],300,[-5,5],300,"valeur de y(1)","valeur de y(2)","Répartition de y");
figure
histo2D(transpose(x),[-5,5],300,[-5,5],300,"valeur de x(1)","valeur de x(2)","Répartition de x");
%Manipulation 5
correlation = corrcoef(x,y);
%Manipulation 6


