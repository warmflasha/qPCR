function dat = readSOPData2(filename)

fid = fopen(filename,'r');

tline = fgetl(fid);

firstlinefound = 0;
q = 1;
while(ischar(tline))
    if firstlinefound == 0
         if strfind(tline,'Sample')
             firstlinefound = 1;
             splitline = strsplit(tline,',');
             ind = find(~cellfun(@isempty,strfind(splitline,'C_')),1,'first');
         end
    else
        splitline = strsplit(tline,',');
        num = str2num(splitline{ind});
        if isnumeric(num) && ~isempty(num)
        dat(q) = num;
        else
            dat(q) = NaN;
        end
        q = q + 1;
    end
    tline = fgetl(fid);
    tline = strrep(tline,',',', ');
end
     