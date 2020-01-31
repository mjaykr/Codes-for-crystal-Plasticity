clear all;
clc;
collect_pq = [];


%% Asking the euler angle input from User

prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
all_euler = dlmread(name_of_file);

for counter16 = 1:1:size(all_euler,1)
    euler_angle = all_euler(counter16,:);
    find_pq = pq_relaxed_small_step(euler_angle);
    collect_pq = [collect_pq;find_pq]
end