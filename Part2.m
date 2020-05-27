figure;
N=10000;
mu = 2;
sigma = 3;
ax1 = axes();
ax2 = axes();
Y=zeros(1,301);
k=0;
for i=-15:0.1:15
    k=k+1;
    Y(k)=gaussienne(i);
end
x = -15:15;
y = mu +sigma*randn(1,N);
hist(ax1,y,x) 
 
plot(ax2, [-15:0.1:15], Y, '-r');
 
set(ax2,'XTick',[],'XTickLabel',{''},'YTick',[],'YTickLabel',{''},'Color','none');

%Entropie
H=hist(ax1,y,x);
entropie=0;
for i=1:31
    if H(i)~=0
        entropie=entropie-(H(i)/N)*log(H(i)/N);
    end
end


