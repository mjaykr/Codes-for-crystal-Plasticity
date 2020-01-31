function det_e456 = calc_e456(euler_angle_pair)

%% iteration #1
min_taylor=5000;
i3=2;
for e4 =-5:1:5
    for e5 =-5:1:5
        for e6=-5:1:5
            sum_taylor_factor = 0;
            for i1=1:1:size(euler_angle_pair,1)
                neg = (-1)^i3;
                strain_external = [1 e6*neg e5*neg;e6*neg 0 e4*neg;e5*neg e4*neg -1];
                g_mat = Euler_to_gmat(euler_angle_pair(i1,:));
                s_in= g_mat*strain_external*g_mat';
                Taylor_factor = cal_taylor_factor(s_in);
                i3=1;
            end
            sum_taylor_factor = sum_taylor_factor + Taylor_factor;
            if sum_taylor_factor < min_taylor
                min_taylor = sum_taylor_factor;
                e_mat1 = [e4 e5 e6];
            end
        end
    end
end

%% iteration #2
min_taylor=5000;
i3=2;
for e4 =(e_mat1(1)-1):0.1:(e_mat1(1)+1)
    for e5 =(e_mat1(2)-1):0.1:(e_mat1(2)+1)
        for e6=(e_mat1(3)-1):0.1:(e_mat1(3)+1)
            sum_taylor_factor = 0;
            for i1=1:1:size(euler_angle_pair,1)
                neg = (-1)^i3;
                strain_external = [1 e6*neg e5*neg;e6*neg 0 e4*neg;e5*neg e4*neg -1];
                g_mat = Euler_to_gmat(euler_angle_pair(i1,:));
                s_in= g_mat*strain_external*g_mat';
                Taylor_factor = cal_taylor_factor(s_in);
                i3=1;
            end
            sum_taylor_factor = sum_taylor_factor + Taylor_factor;
            if sum_taylor_factor < min_taylor
                min_taylor = sum_taylor_factor;
                e_mat2 = [e4 e5 e6];
            end
        end
    end
end

%% iteration #3
min_taylor=5000;
i3=2;
for e4 =(e_mat2(1)-0.1):0.01:(e_mat2(1)+0.1)
    for e5 =(e_mat2(2)-0.1):0.01:(e_mat2(2)+0.1)
        for e6=(e_mat2(3)-0.1):0.01:(e_mat2(3)+0.1)
            sum_taylor_factor = 0;
            for i1=1:1:size(euler_angle_pair,1)
                neg = (-1)^i3;
                strain_external = [1 e6*neg e5*neg;e6*neg 0 e4*neg;e5*neg e4*neg -1];
                g_mat = Euler_to_gmat(euler_angle_pair(i1,:));
                s_in= g_mat*strain_external*g_mat';
                Taylor_factor = cal_taylor_factor(s_in);
                i3=1;
            end
            sum_taylor_factor = sum_taylor_factor + Taylor_factor;
            if sum_taylor_factor < min_taylor
                min_taylor = sum_taylor_factor;
                e_mat3 = [e4 e5 e6];
            end
        end
    end
end



%% iteration #4
min_taylor=5000;
i3=2;
for e4 =(e_mat3(1)-0.01):0.001:(e_mat3(1)+0.01)
    for e5 =(e_mat3(2)-0.01):0.001:(e_mat3(2)+0.01)
        for e6=(e_mat3(3)-0.01):0.001:(e_mat3(3)+0.01)
            sum_taylor_factor = 0;
            for i1=1:1:size(euler_angle_pair,1)
                neg = (-1)^i3;
                strain_external = [1 e6*neg e5*neg;e6*neg 0 e4*neg;e5*neg e4*neg -1];
                g_mat = Euler_to_gmat(euler_angle_pair(i1,:));
                s_in= g_mat*strain_external*g_mat';
                Taylor_factor = cal_taylor_factor(s_in);
                i3=1;
            end
            sum_taylor_factor = sum_taylor_factor + Taylor_factor;
            if sum_taylor_factor < min_taylor
                min_taylor = sum_taylor_factor;
                e_mat4 = [e4 e5 e6];
            end
        end
    end
end

%% iteration #5
min_taylor=5000;
i3=2;
for e4 =(e_mat4(1)-0.001):0.0001:(e_mat4(1)+0.001)
    for e5 =(e_mat4(2)-0.001):0.0001:(e_mat4(2)+0.001)
        for e6=(e_mat4(3)-0.001):0.0001:(e_mat4(3)+0.001)
            sum_taylor_factor = 0;
            for i1=1:1:size(euler_angle_pair,1)
                neg = (-1)^i3;
                strain_external = [1 e6*neg e5*neg;e6*neg 0 e4*neg;e5*neg e4*neg -1];
                g_mat = Euler_to_gmat(euler_angle_pair(i1,:));
                s_in= g_mat*strain_external*g_mat';
                Taylor_factor = cal_taylor_factor(s_in);
                i3=1;
            end
            sum_taylor_factor = sum_taylor_factor + Taylor_factor;
            if sum_taylor_factor < min_taylor
                min_taylor = sum_taylor_factor;
                e_mat5 = [e4 e5 e6];
            end
        end
    end
end

%% iteration #6
min_taylor=5000;
i3=2;
for e4 =(e_mat5(1)-0.001):0.0001:(e_mat5(1)+0.001)
    for e5 =(e_mat5(2)-0.001):0.0001:(e_mat5(2)+0.001)
        for e6=(e_mat5(3)-0.001):0.0001:(e_mat5(3)+0.001)
            sum_taylor_factor = 0;
            for i1=1:1:size(euler_angle_pair,1)
                neg = (-1)^i3;
                strain_external = [1 e6*neg e5*neg;e6*neg 0 e4*neg;e5*neg e4*neg -1];
                g_mat = Euler_to_gmat(euler_angle_pair(i1,:));
                s_in= g_mat*strain_external*g_mat';
                Taylor_factor = cal_taylor_factor(s_in);
                i3=1;
            end
            sum_taylor_factor = sum_taylor_factor + Taylor_factor;
            if sum_taylor_factor < min_taylor
                min_taylor = sum_taylor_factor;
                e_mat6 = [e4 e5 e6];
            end
        end
    end
end

% e4 = e_mat6(1);
% e5 = e_mat6(2);
% e6 = e_mat6(3);
det_e456 = e_mat6;
end


