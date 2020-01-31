clear all;
clc;
strain_increment =0.1;
collect_lamel_eulers_angle=[];
euler_angle_pair_collection=[];
%% Asking the euler angle input from User
prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
all_euler = dlmread(name_of_file);
prompt1 = 'Enter the number of iteration:- ';
iteration = input(prompt1);
repeat_iteration = iteration;
%% Creating random pairs of euler angle
random_pairs = reshape(randperm(size(all_euler,1)),[],2);
%%
euler_angle_pair=zeros(2,3);
m=zeros(1,56);

for i1 = 1:1:size(random_pairs,1)
    i3=2;
    for i2=1:1:size(random_pairs,2)
        euler_angle_pair(i2,:) = all_euler(random_pairs(i1,i2),:);
    end
    iteration = repeat_iteration;
    while iteration >0
        desired_row = 0;
        dummy1 = 0;
        independent_slip_system = [];
        i3=2;
        p = p_lamel(euler_angle_pair);
        for i8=1:1:size(euler_angle_pair,1) 
            euler_angle = euler_angle_pair(i8,:);
            neg = (-1)^i3;
            strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
            new_euler_angle = cal_new_euler_angle(euler_angle,strain_external,strain_increment);
            i3=1;
            euler_angle_pair(i8,:)=new_euler_angle;
        end
        iteration = iteration-1;
    end
    collect_lamel_eulers_angle = [collect_lamel_eulers_angle;euler_angle_pair];
end
collect_lamel_eulers_angle
