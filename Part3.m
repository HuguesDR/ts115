close all
clear
clc
load('X_pluv.mat');
%% Manipulation 3
N=1000;
sigma=[2 1;1 2];
[U,D]=eig(sigma);
sigma2=U*D.^(0.5)*U;
mu=[0.2;0.2];
x=randn(2,N);
y = mu +sigma2*x;
%% Manipulation 4
figure;
histo2D(transpose(y),[-5,5],300,[-5,5],300,"valeur de y(1)","valeur de y(2)","Répartition de y");
figure
histo2D(transpose(x),[-5,5],300,[-5,5],300,"valeur de x(1)","valeur de x(2)","Répartition de x");
%% Manipulation 5
correlation = corrcoef(x,y);
%% Manipulation 6
X1=X_pluv(:,1);
X2=X_pluv(:,2);
X3=X_pluv(:,3);
%% Manipulation 7
Y1=[X1,X2];
Y2=[X1,X3];
Y3=[X2,X3];
BN=cov(Y1);
BS=cov(Y2);
NS=cov(Y3);

%% Manipulation 8
%%% Approximation discrète d'une densité
Nc = 100;               %   Nombre de classes (fixé arbitrairement)

%%%% Calcul de la densité de X1
max_x1 = max(X_pluv(:,1));
min_x1 = max(X_pluv(:,1));
P_X1=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x1-min_x1)/Nc;
    Ci_max = i    *(max_x1-min_x1)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,1)<Ci_max
            P_X1(i)=Pi1(i)+1/Nc;
        end
    end
end
%%%% Calcul de la densité de X2
max_x2 = max(X_pluv(:,2));
min_x2 = max(X_pluv(:,2));
P_X2=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x2-min_x1)/Nc;
    Ci_max = i    *(max_x2-min_x1)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,2)<Ci_max
            P_X2(i)=P_X2(i)+1/Nc;
        end
    end
    
end
%%%% Calcul de la densité de X3
max_x3 = max(X_pluv(:,3));
min_x3 = max(X_pluv(:,3));
P_X3=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x3-min_x3)/Nc;
    Ci_max = i    *(max_x3-min_x3)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,3)<Ci_max
            P_X3(i)=P_X3(i)+1/Nc;
        end
    end 
end

%%%% Calcul de la densité de Y1
mu_1=mean(X_pluv(:,1));
mu_2=mean(X_pluv(:,2));
mu_3=mean(X_pluv(:,3));
P_Y1=zeros(1,Nc);
for i=1:1:Nc
    for k=1:1:Nc
        P_Y1(k) = (1/sqrt(2*pi)*BN(k)) * exp((-1/2*BN(k))*((x-mu_1).^2+(x-mu_2).^2));
    end
    
end
%%%% Calcul de la densité de Y2

P_Y2=zeros(1,Nc);
for i=1:1:Nc
    for k=1:1:Nc
        P_Y2(k) = (1/sqrt(2*pi)*BS(k)) * exp((-1/2*BS(k))*((x-mu_1).^2+(x-mu_3).^2));
    end
    
end

%%%% Calcul de la densité de Y3

P_Y3=zeros(1,Nc);
for i=1:1:Nc
    for k=1:1:Nc
        P_Y3(k) = (1/sqrt(2*pi)*NS(k)) * exp((-1/2*NS(k))*((x-mu_2).^2+(x-mu_3).^2));
    end
    
end

%%% Calcul de l'information mutuelle
I=0; % initialisation
%%%% pour (Y1,Y2)
sum(P_Y1*m.log(P_Y1/P_Y2))

%%%% pour (Y1,Y3)
sum(P_Y1*m.log(P_Y1/P_Y3))
