function h=plotqPCR(fc,err,genenames,samplenames)

h=bar(fc); hold on;

if size(fc,1) > 1
    for ii=1:size(fc,2)
        xdat =get(get(h(ii),'children'), 'xdata');
        xdat = mean(xdat([1 3],:));
        errorbar(xdat,fc(:,ii),err(:,ii),'k.');
        if ii==2
            xtickplace=xdat;
        end
    end
    set(gca,'Xtick',xtickplace);
    set(gca,'Xticklabel',genenames)
    if exist('samplenames','var')
        legend(samplenames,'FontSize',16,'Location','NorthWest');
    end;
    
else
    xdat =get(get(h,'children'), 'xdata');
    xdat = mean(xdat([1 3],:));
    errorbar(xdat,fc,err,'k.');
    xtickplace=xdat;
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
