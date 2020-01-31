
clear all;
clc;



%% Asking the euler angle input from User
strain_increment =0.03;

prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
grain_orientation = dlmread(name_of_file);
all_euler = grain_orientation;

prompt1 = 'Enter the number of iteration:- ';
iteration = input(prompt1);
repeat_iteration = iteration;

%% Creating random pairs of euler angle

random_pairs=[];
theNumbers = randperm(length(all_euler)); % creating random no. between 1 to #grains
for k = 1 : 2 : length(theNumbers)
	selection = theNumbers(k:k+1); % Report this selection to command window.
    random_pairs = [random_pairs; selection];
end

for i1 = 1:1:length(random_pairs)
    
    while iteration >0
        desired_row = 0;
        dummy1 = 0;
        common_slip =[];
        independent_slip_system = [];
        i3=2;
    
    
    for i2=1:1:size(random_pairs,2)
       neg = (-1)^i3;
       iteration = repeat_iteration;
       euler_angle(i2,:) = all_euler(random_pairs(i1,i2),:);
       pq = pq_lamel(euler_angle);
       p = pq(1); q = pq(2);
       strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
       g=Euler_to_gmat(euler_angle(i2,:));
       s_in= g*strain_external*g';
       
       for i4=1:1:56
            m(i4) = sqrt(6)*( (bishop(i4,1)*s_in(2,2)) - ((bishop(i4,2)*s_in(1,1))) + ((bishop(i4,4)*2*s_in(2,3))) + ((bishop(i4,5)*2*s_in(3,1))) +((bishop(i4,6)*2*s_in(1,2))));
       end
        Taylor_factor = max(m);
            for counter2=1:1:56
        if m(counter2)==max(m)
           desired_row = counter2;
           dummy1 = dummy1+1;
           
           possible_slip_system(:,:,dummy1) =stress_state(desired_row);
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
            
            %% Calculating independent slip systems by eliminating depedent slip system
            % D=0
            % Shear = -ve
            store_row_position = [];
            collect_shear = [];
            collect_det =[];
            sd_shear = [];
            collecting_all_shear = [];
            collect_all_valid_shear=[];
            store_page_no_of_fivebyfive_mat = [];
            
            for counter8=1:1:size(fivebyfive_mat,3)
                collect_det = [collect_det det(fivebyfive_mat(:,:,counter8))];
                if det(fivebyfive_mat(:,:,counter8))==0
                    continue
                end
                shear = inv(fivebyfive_mat(:,:,counter8))*[s_in(2,2);s_in(3,3);2*s_in(2,3);2*s_in(1,3);2*s_in(1,2)];
                collect_all_valid_shear = [collect_all_valid_shear shear];
                if all(shear(:)>=0)
                    if ismember(round(std(shear),8),round(sd_shear,8))
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
                euler_angle = euler_angle-0.01;
                
            else
                
                
                
                
                
                %% Forming 3x3 matrix by calculating diadic prodcut
                
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
                
                w12 = (e12-e21)/4.88;
                w31 = (e31-e13)/4.88;
                w23 = (e23-e32)/4.88;
                
                Net_rotaion = sqrt((w12*w12) + (w31*w31) + (w23*w23));
                r1 = (-w23/Net_rotaion); r2 = (-w31/Net_rotaion); r3 = (-w12/Net_rotaion);
                axis_angle_pair = [r1 r2 r3 Net_rotaion];
                Rotation_Matrix = axang2rotm(axis_angle_pair);
                New_rotation_matrix = Rotation_Matrix*g;
                
                new_phi = real(round(radtodeg(round(acos(New_rotation_matrix(3,3)),4)),8));
                new_phi1 = real(round(radtodeg(round(asin(New_rotation_matrix(3,1)/sin(degtorad(new_phi))),4)),8));
                new_phi2 = real(round(radtodeg(round(acos(New_rotation_matrix(2,3)/round(sin(degtorad(new_phi)),3)),4)),8));
                new_euler_angle = round([new_phi1 new_phi new_phi2],8);
                % new_euler_angle=radtodeg(rotm2eul(New_rotation_matrix));
                euler_angle = new_euler_angle;

       
       
       
        
        
    end
    
    iteration = iteration-1;
    end
end
