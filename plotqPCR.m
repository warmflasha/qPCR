function h=plotqPCR(fc,err,genenames,samplenames)

h=bar(fc); hold on;

if size(fc,1) > 1
    xdat = h(1).XData;
    xtickplace = xdat;
    set(gca,'Xtick',xtickplace);
    set(gca,'Xticklabel',genenames)
    if exist('samplenames','var')
        legend(samplenames,'FontSize',16,'Location','NorthWest');
    end;
    
else
%     xdat =get(get(h,'children'), 'xdata');
%     xdat = mean(xdat([1 3],:));
%     errorbar(xdat,fc,err,'k.');
%     xtickplace=xdat;
    if exist('samplenames','var')
        set(gca,'Xtick',xtickplace);
        set(gca,'Xticklabel',samplenames);
    end
    if exist('genenames','var')
        legend(genenames,'FontSize',16,'Location','NorthWest');
    end
end

ylabel('Fold Change','FontSize',20);
set(gca,'FontSize',14);
