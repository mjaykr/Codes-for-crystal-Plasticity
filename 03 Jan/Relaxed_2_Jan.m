clear all;
clc;
common_slip =[]; independent_slip_system = [];store_row_position = []; collect_shear = []; collect_det =[]; sd_shear = []; collecting_all_shear = []; collect_all_valid_shear=[]; store_page_no_of_fivebyfive_mat = []; collect_p_final=[];
%% Asking the euler angle input from User
prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
all_euler = dlmread(name_of_file);
strain_increment =0.1;
prompt1 = 'Enter the number of iteration for each grain:- ';
iteration = input(prompt1);
repeat_iteration = iteration;
% prompt2 = 'please specify the strain condition [exx exy exz;eyx eyy eyz; ezx ezy ezz] for example [1 0 0;0 0 0;0 0 -1];-';
% strain_external= input(prompt2);
 for counter16 = 1:1:size(all_euler,1) % for loop considering all different grain
    iteration = repeat_iteration;
    euler_angle = all_euler(counter16,:);
    dummy6 =1;
for p=-5:0.001:5
    strain_external = [1 0 p;0 0 0;p 0 -1];
    g_mat = Eulertogmat(euler_angle);
    s_in1= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in1(2,2)) - ((bishop(counter1,2)*s_in1(1,1))) + ((bishop(counter1,4)*2*s_in1(2,3))) + ((bishop(counter1,5)*2*s_in1(3,1))) +((bishop(counter1,6)*2*s_in1(1,2)))),6);
    end
    Taylor_factor(dummy6) = max(m);
    dummy6 = dummy6+1; 
end
[min_taylor, index_min_taylor] = min(Taylor_factor);
p_final=round((-5) + 0.001*(index_min_taylor-1),3);
collect_p_final = [collect_p_final, p_final];

strain_external = [1 0 p_final;0 0 0;p_final 0 -1];
    %% Calculating g_ij and transpose of it
    while iteration >0 % To perform given no. of iteration to every single euler angle
    desired_row = 0; dummy1 = 0;
    g = Eulertogmat(euler_angle);
    s_in2= g*strain_external*g'; % calcualting the strains along crystallographic axis
    %% Calculating taylor factor and corresponding possible slip system for single crystal
        for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m_1(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in2(2,2)) - ((bishop(counter1,2)*s_in2(1,1))) + ((bishop(counter1,4)*2*s_in2(2,3))) + ((bishop(counter1,5)*2*s_in2(3,1))) +((bishop(counter1,6)*2*s_in2(1,2)))),6);
        end

    Taylor_factor = max(m_1);
for counter2=1:1:56 % Taking out the stress state from bishop-hill table corresponding to maximum m or having taylor factor 
    if m_1(counter2)==max(m_1)
       desired_row = counter2;
       dummy1 = dummy1+1;
possible_slip_system(:,:,dummy1) =stress_state(desired_row); % Coding to Output the Slip System 
    end
end

slip_system_for_cal = possible_slip_system(:,:,1);
%% Generating all possible matrix
dummy_m = nchoosek(1:1:size(slip_system_for_cal,1),5);
for counter3=1:1:size(dummy_m,1)
    generate_mat = [];
    for counter4 = 1:1:size(dummy_m,2)
        generate_mat = [generate_mat;slip_system_for_cal(dummy_m(counter3,counter4),:)];
    end
    Three_DM(:,:,counter3) = generate_mat;
end
%% calculating 5x5 matrix
collecting_all_det = [];
for counter5=1:1:size(Three_DM,3)
  collect_column=[];  
for counter6=1:1:size(Three_DM,1)
column1 = (1/(sqrt(6)))*[Three_DM(counter6,5,counter5)*Three_DM(counter6,2,counter5),Three_DM(counter6,6,counter5)*Three_DM(counter6,3,counter5), Three_DM(counter6,5,counter5)*Three_DM(counter6,3,counter5)+Three_DM(counter6,6,counter5)*Three_DM(counter6,2,counter5), Three_DM(counter6,4,counter5)*Three_DM(counter6,3,counter5)+Three_DM(counter6,1,counter5)*Three_DM(counter6,6,counter5), Three_DM(counter6,4,counter5)*Three_DM(counter6,2,counter5)+Three_DM(counter6,1,counter5)*Three_DM(counter6,5,counter5)]';
collect_column = [collect_column column1];
end
fivebyfive_mat(:,:,counter5)=collect_column;
collecting_all_det = [collecting_all_det det(fivebyfive_mat(:,:,counter5))];
end
for counter8=1:1:size(fivebyfive_mat,3)
    collect_det = [collect_det det(fivebyfive_mat(:,:,counter8))];
    if det(fivebyfive_mat(:,:,counter8))==0
        continue
    end
    shear = inv(fivebyfive_mat(:,:,counter8))*[s_in2(2,2);s_in2(3,3);2*s_in2(2,3);2*s_in2(1,3);2*s_in2(1,2)];
    collect_all_valid_shear = [collect_all_valid_shear shear];
            if all(shear(:)>=0)
                if ismember(round(std(shear),3),round(sd_shear,3))
                    continue
                end
            
	sd_shear = [sd_shear std(shear)];
    collect_shear=[collect_shear shear];
    store_page_no_of_fivebyfive_mat = [store_page_no_of_fivebyfive_mat counter8];
        
    
            else
                continue
            end
end
%% Finding the Minimum Standard deviation for Shear
[min_sd, index_min_sd] = min(sd_shear);
location_of_ss = store_page_no_of_fivebyfive_mat(index_min_sd);
independent_slip_system = Three_DM(:,:,location_of_ss);
if isempty(independent_slip_system)
euler_angle = euler_angle-1;
else
%% Forming 3x3 matrix by calculating diadic product
for counter9=1:1:size(independent_slip_system,1)
three_by_three(:,:,counter9) = [independent_slip_system(counter9,4);independent_slip_system(counter9,5); independent_slip_system(counter9,6)]*[independent_slip_system(counter9,1) independent_slip_system(counter9,2) independent_slip_system(counter9,3)];
end
%% finding e12, e21, e13, e31, e23 and e32
e12=0; e21=0; e13=0; e31=0; e23=0; e32 = 0;
% finding e12
for counter10 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(1,2,counter10)*collect_shear(counter10)*strain_increment;
e12 = dummy2+e12;
end
% finding e21
for counter11 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(2,1,counter11)*collect_shear(counter11)*strain_increment;
e21 = dummy2+e21;
end
% finding e13
for counter12 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(1,3,counter12)*collect_shear(counter12)*strain_increment;
e13 = dummy2+e13;
end
% finding e31
for counter13 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(3,1,counter13)*collect_shear(counter13)*strain_increment;
e31 = dummy2+e31;
end
% finding e23
for counter14 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(2,3,counter14)*collect_shear(counter14)*strain_increment;
e23 = dummy2+e23;
end
% finding e32
for counter15 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(3,2,counter15)*collect_shear(counter15)*strain_increment;
e32 = dummy2+e32;
end
%% calculating W12, W31 and W23
w12 = (e12-e21)/4.88; w31 = (e31-e13)/4.88; w23 = (e23-e32)/4.88;
Net_rotaion = sqrt((w12*w12) + (w31*w31) + (w23*w23));
r1 = (-w23/Net_rotaion); r2 = (-w31/Net_rotaion); r3 = (-w12/Net_rotaion);
axis_angle_pair = [r1 r2 r3 Net_rotaion];
Rotation_Matrix = axang2rotm(axis_angle_pair);
New_rotation_matrix = Rotation_Matrix*g;
new_euler_angle = gmat_to_euler(New_rotation_matrix);
euler_angle = new_euler_angle
iteration = iteration -1;
store_euler_angles(counter16,:) = new_euler_angle;
end
end
end