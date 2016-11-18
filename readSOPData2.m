function dat = readSOPData2(filename)
% read data from stepOnePlus machine. 
% must resave as .csv. Uses default output settings


fid = fopen(filename,'r');

curr_line = fgetl(fid);

q = 1;
%find the results section
while length(curr_line) < 9 || ~strcmpi(curr_line(1:9),'[Results]')
    curr_line = fgetl(fid);
    q = q + 1;
end

%get the column header line
curr_line = fgetl(fid);
headers = strsplit(curr_line,',');
ind = find(~cellfun(@isempty,strfind(headers,'RQ Max')))+1;

q = 1;
curr_line = fgetl(fid);
while length(curr_line) > 50
    curr_line = strrep(curr_line,',',' ,');
    curr_dat = strsplit(curr_line,',');
    if ~(curr_dat{ind}(1)=='U') %undetermined
        dat(q) = str2num(curr_dat{ind});
    else
        dat(q) = NaN;
    end
    curr_line = fgetl(fid);
    q = q + 1;
end