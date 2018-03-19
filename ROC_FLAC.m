function [AUC] = ROC_FLAC(b,X,labels)
score = X*b;

[X1,Y1,~,AUC] = perfcurve(labels,score,1);
figure
hold on
plot(X1,Y1,'LineStyle','-','LineWidth',1,'Color','c')
X = [0,1];
Y = X;
plot(X,Y,'LineStyle',':','LineWidth',1,'Color','k')
axis equal tight
xlabel('False positive rate','FontSize',7)
ylabel('True positive rate','FontSize',7)
title('ROC Analysis','FontSize',9,'FontWeight','bold')
hold off
set(gcf,'PaperUnits','inches','PaperSize',[3 3],'PaperPosition',[0 0 3 3])
