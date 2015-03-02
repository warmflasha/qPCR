function dat=readqPCRdata(filename)
fid=fopen(filename,'r');
td=textscan(fid,'%s');
inds=find(strcmp(td{1},'Sample'));

for ii=1:length(inds)
    tt=str2num(td{1}{inds(ii)+2});
    if isempty(tt)
        dat(ii)=NaN;
    else
        dat(ii)=tt;
    end
end
dat=dat';