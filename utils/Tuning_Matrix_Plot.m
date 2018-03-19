function [] = Tuning_Matrix_Plot (Tuning_accuray, Name)
if nargin<2
    Name = 'Your Method';
end
imagesc(Tuning_accuray)
colormap('jet')
caxis([0.4,1])
colorbar
axis equal tight
axis off

title (['Tuning Matrix for ', Name],'FontSize',16,'FontWeight','bold')