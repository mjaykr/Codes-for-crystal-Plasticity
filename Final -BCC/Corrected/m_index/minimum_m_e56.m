function minimum_m = minimum_m_e56(euler_angle)

tic
min_taylor=5000;

%% Iteration =1

for e5 =-5:1:5
    for e6=-5:1:5
        strain_external = [1 e6 e5;e6 0 0;e5 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat0 = [0 e5 e6];
        end
        
    end
end

min_taylor=5000;
%% Iteration =1


for e5 =(e_mat0(2)-1):0.1:(e_mat0(2)+1)
    for e6=(e_mat0(3)-1):0.1:(e_mat0(3)+1)
        strain_external = [1 e6 e5;e6 0 0;e5 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat1 = [0 e5 e6];
        end
        
    end
end

min_taylor=5000;
%% Iteration =2

for e5 =(e_mat1(2)-0.1):0.01:(e_mat1(2)+0.1)
    for e6=(e_mat1(3)-0.1):0.01:(e_mat1(3)+0.1)
        
        strain_external = [1 e6 e5;e6 0 0;e5 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat2 = [0 e5 e6];
        end
        
    end
end


min_taylor=5000;
%% Iteration =3

for e5 =(e_mat2(2)-0.01):0.001:(e_mat2(2)+0.01)
    for e6=(e_mat2(3)-0.01):0.001:(e_mat2(3)+0.01)
        
        strain_external = [1 e6 e5;e6 0 0;e5 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat3 = [0 e5 e6];
        end
        
    end
end


min_taylor=5000;
%% Iteration =4


for e5 =(e_mat3(2)-0.001):0.0001:(e_mat3(2)+0.001)
    for e6=(e_mat3(3)-0.001):0.0001:(e_mat3(3)+0.001)
        
        strain_external = [1 e6 e5;e6 0 0;e5 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat4 = [0 e5 e6];
        end
        
    end
end




min_taylor=5000;
%% Iteration =6

for e5 =(e_mat4(2)-0.0001):0.00001:(e_mat4(2)+0.0001)
    for e6=(e_mat4(3)-0.0001):0.00001:(e_mat4(3)+0.0001)
        
        strain_external = [1 e6 e5;e6 0 0;e5 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat5 = [0 e5 e6];
        end
        
    end
end


minimum_m = min_taylor;
%% End of Iteration

%e5 = e_mat5(2);
%e6 = e_mat5(3);


%str_ext =[1 e6 e5;e6 0 0;e5 0 -1];

end
