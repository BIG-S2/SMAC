x=-5:0.01:5;
y=LUM_exp(x,0);
y1=(1-x).*(x<1);
plot(x,y,x,y1,'--','LineWidth',2)
xlabel('u','FontSize',20)
ylabel('l(u)','FontSize',20)
legend('LUM','Hinge Loss')