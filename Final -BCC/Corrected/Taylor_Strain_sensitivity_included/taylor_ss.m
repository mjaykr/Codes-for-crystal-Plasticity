clear all;
clc;

%% Taking input arguments
strain_increment =0.1;
name_of_file = input('Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-');
all_euler = dlmread(name_of_file);
iteration = input('Enter the number of iteration:- ');
m_ss = input('Enter the strain Sensitivity(m):- ');
repeat_iteration =iteration;
strain_external = [1 0 0;0 0 0;0 0 -1];

% Input argument Finish
%%
collect_euler_angle = zeros(size(all_euler,1),3);
for i=1:1:size(all_euler,1)
    iteration = repeat_iteration;
    euler_angle = all_euler(i,:);
    while iteration>0
        new_euler_angle = cal_new_euler_angle(euler_angle,strain_external,strain_increment,m_ss);
        iteration = iteration - 1;
        euler_angle = new_euler_angle;
    end
    
    collect_euler_angle(i,:) = new_euler_angle;
    clc;
    S = [num2str(i), ' grains have been processed.'];
    disp(S)
    
end
clc
disp('calculation is over. Resmat output file has been generated.')
resmat(collect_euler_angle);