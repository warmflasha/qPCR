function h=plotqPCR(fc,err,genenames,samplenames)

h=bar(fc); hold on;

if size(fc,1) > 1
    xdat = h(1).XData;
    xtickplace = xdat;
    set(gca,'Xtick',xtickplace);
    if exist('genenames','var')
        set(gca,'Xticklabel',genenames)
    end
    if exist('samplenames','var')
        legend(samplenames,'FontSize',16,'Location','NorthWest');
    end
    
    for ii = 1:size(fc,2)
        xdat = h(ii).XData + h(ii).XOffset;
        errorbar(xdat,fc(:,ii),err(:,ii),'kx','LineWidth',1.5);
    end
    
else
    
    if exist('samplenames','var')
        set(gca,'Xtick',xtickplace);
        set(gca,'Xticklabel',samplenames);
    end
    if exist('genenames','var')
        legend(genenames,'FontSize',16,'Location','NorthWest');
    end
    
    errorbar(h(1).XData+h(1).XOffset,fc,err,'kx','LineWidth',1.5);
end

ylabel('Fold Change','FontSize',20);
set(gca,'FontSize',14);
hold off;
