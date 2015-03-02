function [fc err]=qPCRRowData(datafiles,genestartrows,normgene,normcond,usecol)

if ~exist('usecol','var')
    usecol=1:12;
end

%read the data files and concatenate into one big array
TRall=[];
for ii=1:length(datafiles)
    T=readqPCRdata(datafiles{ii});
    %check the size
    if length(T) ~= 96
        error('expected data from a 96 well plate');
    end
    
    %reshape, one column for each triplicate
    
    TRtmp=reshape(T,12,8)';
    
    TRall=[TRall; TRtmp];
end

ngenes=length(genestartrows);
for ii=1:ngenes
    gdata{ii}=TRall(genestartrows(ii):(genestartrows(ii)+2),usecol);
end

%correction for 0's in normalization -- MAYBE REMOVE?
inds = gdata{normcond} < 10 | gdata{normcond} >37 | isnan(gdata{normcond});
for ii=1:length(inds)
    [rr cc]=ind2sub(size(gdata{normcond}),inds(ii));
    xx=1:size(gdata{normcond},1);
    gdata{normcond}(inds(ii))=mean(gdata{normcond}(xx~=rr,cc));
end

%compute fold changes and errors
for ii=1:ngenes
    [fc(ii,:) err(ii,:)]=compFcAndErr(gdata{ii},gdata{normgene},normcond);
end

function [fc err]=compFcAndErr(gene,gnorm,normcond)
%compute fold changes and errors
fc=-mean(gene)+mean(gene(:,normcond))+mean(gnorm)-mean(gnorm(:,normcond));
fc=pow2(fc);
err=std(gene).*std(gene)+std(gene(:,normcond))*std(gene(:,normcond))+std(gnorm).*std(gnorm)...
    +std(gnorm(:,normcond))*std(gnorm(:,normcond));
err=log(2)*sqrt(err).*fc;
