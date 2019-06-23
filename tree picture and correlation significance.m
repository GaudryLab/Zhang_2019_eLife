Y=pdist(R_corr2_mean);
Z=linkage(Y);
figure
dendrogram(Z)

P=Y;

P([10 20 29 37 44 50 55 59 62 64 66])=0;
pp=P(find(P));

Y=pp./max(pp);
Y=Y';
[O,S]=polyfit(X,Y,1);  % X here should be the same calculation as Y

YY=polyconf(O,X,S);

figure
plot(X,Y,'o','color',[0 0 0])
axis([0 1.2 0 1.2])
hold on
plot(X,YY,'k')

[b bint r rint stats] = regress(Y,X,0.05);
