clear all;
clc;

%% Taking input arguments
strain_increment =0.1;
prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
all_euler = dlmread(name_of_file);
prompt1 = 'Enter the number of iteration:- ';
iteration = input(prompt1);
repeat_iteration =iteration;
collect_euler_angle = zeros(size(all_euler,1),3);
% Input argument Finish
%%

for i=1:1:size(all_euler,1)
    iteration = repeat_iteration;
    euler_angle = all_euler(i,:);
    strain_external = strain_external_e456(euler_angle);
    while iteration>0
        
        new_euler_angle = cal_new_euler_angle(euler_angle,strain_external,strain_increment);
        euler_angle = new_euler_angle;
        iteration = iteration - 1;
    end
    collect_euler_angle(i,:) = new_euler_angle;
    clc;
    S = [num2str(i), ' grains have been processed.'];
    disp(S)
    
end
clc
disp('calculation is over. Resmat output file has been generated.')
resmat(collect_euler_angle);