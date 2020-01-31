clear all;
clc;
store_taylor_factor = [];
%% Asking the euler angle input from User

prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
all_euler = dlmread(name_of_file);

iteration = input('Enter the number of iteration:- ');
repeat_iteration =iteration;

for i=1:1:size(all_euler,1)
    
    euler_angle = all_euler(i,:);
    strain_external = strain_external_e1(euler_angle);
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    Taylor_factor = cal_taylor_factor(s_in);
    store_taylor_factor = [store_taylor_factor;Taylor_factor ];
    Average_taylor_factor = mean(store_taylor_factor);
    
    
    
end
