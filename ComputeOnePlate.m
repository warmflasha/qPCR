function [fc err]=ComputeOnePlate(datafiles,genenumbers,normgene,normcond,Brigitte)
%[fc err]=ComputeOnePlate(datafile,genenumbers,normgene,genenames,condnames)
%----------------------------------------------------------------
%Function to read in one plate worth of qPCR data and quantify

%read in the data file, should contain 96 numbers

TRall=[];
for ii=1:length(datafiles)
    
    if ischar(datafiles{ii})
        T=readqPCRdata(datafiles{ii});
    else
        T=datafiles{ii};
    end
    %check the size
    if length(T) ~= 96
        error('expected data from a 96 well plate');
    end
    
    %reshape, one column for each triplicate
    
    if Brigitte
        TRtmp=reshape(T,12,8)';
        TRtmp=[TRtmp(1:3,:) TRtmp(5:7,:)];
    else
        TRtmp=reshape(T,3,32);
    end
    TRall=[TRall TRtmp];
end
ngenes=length(genenumbers);

%group the data by gene
for ii=1:ngenes
    gdata{ii}=TRall(:,genenumbers{ii});
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