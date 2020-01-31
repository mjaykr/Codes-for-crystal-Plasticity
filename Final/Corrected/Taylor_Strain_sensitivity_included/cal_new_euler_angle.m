
function new_euler_angle = cal_new_euler_angle(euler_angle,strain_external,strain_increment,m_ss)

i7=1;
while i7<=1
    g=Euler_to_gmat(euler_angle);
    s_in= g*strain_external*g';
    all_independent_slip_system = slip_system(s_in);
    possible_comb_SS = all_possible_comb_SS(all_independent_slip_system); % Generating all possible matrix
    fivebyfive_mat = five_by_five_mat(possible_comb_SS); % calculating five by five matrix
    
    %% Calculating independent slip systems by eliminating depedent slip system
    collect_shear_ss = [];
    shear_sum = [];
    store_page_no_of_fivebyfive_mat = [];
    
    for counter8=1:1:size(fivebyfive_mat,3)
        if det(fivebyfive_mat(:,:,counter8))==0
            continue
        end
        shear = (fivebyfive_mat(:,:,counter8))\[s_in(2,2);s_in(3,3);2*s_in(2,3);2*s_in(1,3);2*s_in(1,2)];% inv(A)*b
        if all(shear(:)>=0)
            if ismember(round(std(shear),8),round(shear_sum,8))
                continue
            end
         
            shear_ss = power(shear,(m_ss+1));
            shear_sum = [shear_sum sum(shear_ss)];
            collect_shear_ss=[collect_shear_ss shear_ss];
            store_page_no_of_fivebyfive_mat = [store_page_no_of_fivebyfive_mat counter8];
            
            
        else
            continue
        end
    end
    
    %% Finding the Minimum Standard deviation for Shear
    
    [~,index_min_sd] = min(shear_sum);
    
    location_of_ss = store_page_no_of_fivebyfive_mat(index_min_sd);
    
    independent_slip_system = possible_comb_SS(:,:,location_of_ss);
    
    if isempty(independent_slip_system)
        euler_angle = euler_angle-1;
        
    else
        %% Forming 3x3 matrix by calculating diadic prodcut
        
        for counter9=1:1:size(independent_slip_system,1)
            three_by_three(:,:,counter9) = [independent_slip_system(counter9,4);independent_slip_system(counter9,5); independent_slip_system(counter9,6)]*[independent_slip_system(counter9,1) independent_slip_system(counter9,2) independent_slip_system(counter9,3)];
        end
        
        %% finding e12, e21, e13, e31, e23 and e32
        e12=0; e21=0; e13=0; e31=0; e23=0; e32 = 0;
        
        % finding e12
        for counter10 = 1:1:size(three_by_three,3)
            dummy2 = three_by_three(1,2,counter10)*collect_shear_ss(counter10,index_min_sd)*strain_increment;
            e12 = dummy2+e12;
        end
        
        
        % finding e21
        for counter11 = 1:1:size(three_by_three,3)
            dummy2 = three_by_three(2,1,counter11)*collect_shear_ss(counter11,index_min_sd)*strain_increment;
            e21 = dummy2+e21;
        end
        
        
        % finding e13
        for counter12 = 1:1:size(three_by_three,3)
            dummy2 = three_by_three(1,3,counter12)*collect_shear_ss(counter12,index_min_sd)*strain_increment;
            e13 = dummy2+e13;
        end
        
        
        % finding e31
        for counter13 = 1:1:size(three_by_three,3)
            dummy2 = three_by_three(3,1,counter13)*collect_shear_ss(counter13,index_min_sd)*strain_increment;
            e31 = dummy2+e31;
        end
        
        
        % finding e23
        for counter14 = 1:1:size(three_by_three,3)
            dummy2 = three_by_three(2,3,counter14)*collect_shear_ss(counter14,index_min_sd)*strain_increment;
            e23 = dummy2+e23;
        end
        
        
        % finding e32
        for counter15 = 1:1:size(three_by_three,3)
            dummy2 = three_by_three(3,2,counter15)*collect_shear_ss(counter15,index_min_sd)*strain_increment;
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
        new_euler_angle = rot_mat_to_euler_angle(New_rotation_matrix);
        i7=i7+1;
    end
    
    
    
end
end