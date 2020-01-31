function minimum_m = minimum_m_e6(euler_angle)

min_taylor=5000;

%% Iteration =1

for e6 =-5:1:5
    
        strain_external = [1 e6 0;e6 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat0 = [0 e6 0];
        end
        
    
end

min_taylor=5000;
%% Iteration =1


for e6 =(e_mat0(2)-1):0.1:(e_mat0(2)+1)
    
        strain_external = [1 e6 0;e6 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat1 = [0 e6 0];
        end
        
    
end

min_taylor=5000;
%% Iteration =2

for e6 =(e_mat1(2)-0.1):0.01:(e_mat1(2)+0.1)
    
        
        strain_external = [1 e6 0;e6 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat2 = [0 e6 0];
        end
        
    
end


min_taylor=5000;
%% Iteration =3

for e6 =(e_mat2(2)-0.01):0.001:(e_mat2(2)+0.01)
    
        
        strain_external = [1 e6 0;e6 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat3 = [0 e6 0];
        end
        
    
end


min_taylor=5000;
%% Iteration =4


for e6 =(e_mat3(2)-0.001):0.0001:(e_mat3(2)+0.001)
    
        
        strain_external = [1 e6 0;e6 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat4 = [0 e6 0];
        end
        
    
end




min_taylor=5000;
%% Iteration =6

for e6 =(e_mat4(2)-0.0001):0.00001:(e_mat4(2)+0.0001)
    
        
        strain_external = [1 e6 0;e6 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor = cal_taylor_factor(s_in);
        if Taylor_factor<min_taylor
            min_taylor = Taylor_factor;
            e_mat5 = [0 e6 0];
        end
        
    
end



%% End of Iteration

%e6 = e_mat5(2);
%e6 = e_mat5(3);
minimum_m = min_taylor;

%str_ext =[1 e6 0;e6 0 0;0 0 -1];

end
