function [fc err]=doOneGeneBrigitte(datafiles,genequadrant,normquadrant,normcond)

genenums=quadtolist(genequadrant);
normnums=quadtolist(normquadrant);

[fc err]=ComputeOnePlate(datafiles,{genenums,normnums},2,normcond,1);


function list=quadtolist(quad)
list=(6*quad-5):(6*quad);

