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
Pi1=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x1-min_x1)/Nc;
    Ci_max = i    *(max_x1-min_x1)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,1)<Ci_max
            Pi1(i)=Pi1(i)+1/Nc;
        end
    end
end
%%%% Calcul de la densité de X2
max_x2 = max(X_pluv(:,2));
min_x2 = max(X_pluv(:,2));
Pi2=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x2-min_x1)/Nc;
    Ci_max = i    *(max_x2-min_x1)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,2)<Ci_max
            Pi2(i)=Pi2(i)+1/Nc;
        end
    end
    
end
%%%% Calcul de la densité de X3
max_x3 = max(X_pluv(:,3));
min_x3 = max(X_pluv(:,3));
Pi3=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x3-min_x3)/Nc;
    Ci_max = i    *(max_x3-min_x3)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,3)<Ci_max
            Pi3(i)=Pi3(i)+1/Nc;
        end
    end 
end

%%%% Calcul de la densité de Y1

for i=1:1:Nc
    Ci_min = (i-1)*(max_x1-min_x1)/Nc;
    Ci_max = i    *(max_x1-min_x1)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,1)<Ci_max
            Pi(i)=Pi(i)+1/Nc;
        end
    end
    
end
%%%% Calcul de la densité de Y3
max_x1 = max(X_pluv(:,1));
min_x1 = max(X_pluv(:,1));
Pi=zeros(1,Nc);
for i=1:1:Nc
    Ci_min = (i-1)*(max_x1-min_x1)/Nc;
    Ci_max = i    *(max_x1-min_x1)/Nc;
    for k=1:1:Nc
        if Ci_min<X_pluv(k,1)<Ci_max
            Pi(i)=Pi(i)+1/Nc;
        end
    end
    
end
