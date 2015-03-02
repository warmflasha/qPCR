[fc err]=doManyGenesBrigitte({'20120215_intRFP_cl4_shF1_1_ATP50_FOXD3_PLATE1.txt',...
    '20120215_intRFP_cl4_shF1_1_NANOG_OCT4_PLATE2.txt'},[2 5 6],1,1,{'FoxD3','Nanog','Oct4'},[0 10 25 50 75 1000]);
xlim([0 1000]);

[fc2 err2]=doManyGenesBrigitte({'20120215_intRFP_cl4_shF1_1_ATP50_FOXD3_PLATE1.txt',...
    '20120215_intRFP_cl4_shF1_1_NANOG_OCT4_PLATE2.txt'},[4 7 8],3,1,{'FoxD3','Nanog','Oct4'},[0 10 25 50 75 1000]);
xlim([0 1000]);
