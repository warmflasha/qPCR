function [fc err]=doManyGenesBrigitte(datafiles,genequadrants,normquadrant,normcond,genenames,condnames)

figure; hold all;
for ii=1:length(genequadrants)
    [fctmp errtmp]=doOneGeneBrigitte(datafiles,genequadrants(ii),normquadrant,normcond);
     fc(ii,:)=fctmp(1,:);
     err(ii,:)=errtmp(1,:);
     errorbar(condnames,fc(ii,:),err(ii,:));
     legend(genenames);
end

function [fc err]=doOneGeneBrigitte(datafiles,genequadrant,normquadrant,normcond)

genenums=quadtolist(genequadrant);
normnums=quadtolist(normquadrant);

[fc err]=ComputeOnePlate(datafiles,{genenums,normnums},2,normcond,1);


function list=quadtolist(quad)
list=(6*quad-5):(6*quad);

