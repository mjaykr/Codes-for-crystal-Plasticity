function resmat(collect_euler)

A = collect_euler;
fileID = fopen('Output_for_resmat.txt','w');
fprintf(fileID,'This file is created by TexTools software, Resmat Corp.');
fprintf(fileID,'\r\nODF file name: file Created at Texture lab IITK');
fprintf(fileID,'\r\n');
fprintf(fileID,'\r\n');
fprintf(fileID,'B ');
fprintf(fileID,'%d',length(A));
fprintf(fileID,' 0\r\n');

fprintf(fileID,'\t%0.3f %0.3f %0.3f 1\r\n',A');
fclose(fileID);
end