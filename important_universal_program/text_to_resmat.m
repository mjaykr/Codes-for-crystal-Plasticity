%% Resmat file converter
function text_to_resmat(~)

%make sure your current folder is the same where your files are present
FileList = dir('*.txt');
N = size(FileList,1);

for k = 1:N

filename = FileList(k).name

text_to_mat= dlmread(filename);
line = zeros(19,73);

%% processing the data for first file
line(15,:) = text_to_mat(1:73,2)';
line(14,:) = text_to_mat(74:146,2)';
line(13,:) = text_to_mat(147:219,2)';
line(12,:) = text_to_mat(220:292,2)';
line(11,:) = text_to_mat(293:365,2)';
line(10,:) = text_to_mat(366:438,2)';
line(9,:) = text_to_mat(439:511,2)';
line(8,:) = text_to_mat(512:584,2)';
line(7,:) = text_to_mat(585:657,2)';
line(6,:) = text_to_mat(658:730,2)';
line(5,:) = text_to_mat(731:803,2)';
line(4,:) = text_to_mat(804:876,2)';
line(3,:) = text_to_mat(877:949,2)';
line(2,:) = text_to_mat(950:1022,2)';
line(1,:) = text_to_mat(1023:1095,2)';
line(19,:) = zeros();



fileID = fopen([filename '.hpf'],'w');
fprintf(fileID,'This pole figure file is created by Matlab Code written in Texture lab, IIT Kanpur');
fprintf(fileID,'\r\nCubic, (1 1 1), 5.00, 19 x 73, (1.00 1.00 1.00 90.00 90.00 90.00), Program Created at Texture Lab IIT Kanpur ');
fprintf(fileID,'\r\n');
fprintf(fileID ,'%0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f  %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f  %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f  %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f  %0.1f %0.1f %0.1f \r',line' );
fclose(fileID);

end

end