clear all;
clc;
strain_increment =0.1;
store_euler_angle_pair=[];euler_angle_pair_collection=[];
%% Asking the euler angle input from User
name_of_file = input('Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-');
all_euler = dlmread(name_of_file);
iteration = input('Enter the number of iteration:- ');
repeat_iteration = iteration;
%% Creating random pairs of euler angle
random_pairs = reshape(randperm(size(all_euler,1)),[],2);
%%
euler_angle_pair=zeros(2,3);

for i1 = 1:1:size(random_pairs,1)
    i3=2;
    for i2=1:1:size(random_pairs,2)
        euler_angle_pair(i2,:) = all_euler(random_pairs(i1,i2),:);
    end  % Pair of Euler angle created
    iteration = repeat_iteration;
    while iteration >0
        i3=1;
        e_vector = calc_e5(euler_angle_pair); % Output is in vector form [e4 e5 e6]
        e5 = e_vector(2); % Selecting only e5 out of e_Vector
        for i8=1:1:size(euler_angle_pair,1)
            euler_angle = euler_angle_pair(i8,:);
            strain_external = [1 0 e5*i3;0 0 0;e5*i3 0 -1];
            new_euler_angle = cal_new_euler_angle(euler_angle,strain_external,strain_increment);
            i3=(-1);
            euler_angle_pair(i8,:)=new_euler_angle;
        end % New Euler angle pair after one iteration
        iteration = iteration-1;
    end % All Iteration of a pair of Euler angle pair done
    
    clc;
    S = [num2str(i1), ' Pair out of ',num2str(size(random_pairs,1)),  ' grains have been processed.'];
    disp(S)
    
    store_euler_angle_pair = [store_euler_angle_pair;euler_angle_pair];
end
resmat(store_euler_angle_pair);
disp('Calculation completed. Resmat file has been Created.');
