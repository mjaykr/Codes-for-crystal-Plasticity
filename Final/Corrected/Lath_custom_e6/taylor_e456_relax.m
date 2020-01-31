


% Input argument Finish
%%
collect_euler_angle = zeros(size(all_euler,1),3);
for i=1:1:size(all_euler,1)
euler_angle = all_euler(i,:);
strain_external = strain_external_min_taylor(euler_angle);
new_euler_angle = cal_new_euler_angle(euler_angle,strain_external,strain_increment);
     collect_euler_angle(i,:) = new_euler_angle;
     clc;
     S = [num2str(i), ' grains have been processed.'];
     disp(S)
    
end
clc
disp('calculation is over. Resmat output file has been generated.')
resmat(collect_euler_angle);