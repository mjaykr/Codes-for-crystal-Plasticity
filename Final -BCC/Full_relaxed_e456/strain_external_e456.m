function str_ext = strain_external_e456(euler_angle)

min_taylor=5000;

%% Iteration =1

for e4 =-5:1:5
    for e5 =-5:1:5
        for e6=-5:1:5
            strain_external = [1 e6 e5;e6 0 e4;e5 e4 -1];
            g_mat = Euler_to_gmat(euler_angle);
            s_in= g_mat*strain_external*g_mat';
            Taylor_factor = cal_taylor_factor(s_in);
            if Taylor_factor<min_taylor
                min_taylor = Taylor_factor;
                e_mat0 = [e4 e5 e6];
            end
            
        end
    end
end

min_taylor=5000;
%% Iteration =1

for e4 =(e_mat0(1)-1):0.1:(e_mat0(1)+1)
    for e5 =(e_mat0(2)-1):0.1:(e_mat0(2)+1)
        for e6=(e_mat0(3)-1):0.1:(e_mat0(3)+1)
            strain_external = [1 e6 e5;e6 0 e4;e5 e4 -1];
            g_mat = Euler_to_gmat(euler_angle);
            s_in= g_mat*strain_external*g_mat';
            Taylor_factor = cal_taylor_factor(s_in);
            if Taylor_factor<min_taylor
                min_taylor = Taylor_factor;
                e_mat1 = [e4 e5 e6];
            end
            
        end
    end
end

min_taylor=5000;
%% Iteration =2

for e4 =(e_mat1(1)-0.1):0.01:(e_mat1(1)+0.1)
    for e5 =(e_mat1(2)-0.1):0.01:(e_mat1(2)+0.1)
        for e6=(e_mat1(3)-0.1):0.01:(e_mat1(3)+0.1)
            
            strain_external = [1 e6 e5;e6 0 e4;e5 e4 -1];
            g_mat = Euler_to_gmat(euler_angle);
            s_in= g_mat*strain_external*g_mat';
            Taylor_factor = cal_taylor_factor(s_in);
            if Taylor_factor<min_taylor
                min_taylor = Taylor_factor;
                e_mat2 = [e4 e5 e6];
            end
            
        end
    end
end

min_taylor=5000;

%% Iteration =3

for e4 =(e_mat2(1)-0.01):0.001:(e_mat2(1)+0.01)
    for e5 =(e_mat2(2)-0.01):0.001:(e_mat2(2)+0.01)
        for e6=(e_mat2(3)-0.01):0.001:(e_mat2(3)+0.01)
            
            strain_external = [1 e6 e5;e6 0 e4;e5 e4 -1];
            g_mat = Euler_to_gmat(euler_angle);
            s_in= g_mat*strain_external*g_mat';
            Taylor_factor = cal_taylor_factor(s_in);
            if Taylor_factor<min_taylor
                min_taylor = Taylor_factor;
                e_mat3 = [e4 e5 e6];
            end
            
        end
    end
end

min_taylor=5000;
%% Iteration =4

for e4 =(e_mat3(1)-0.001):0.0001:(e_mat3(1)+0.001)
    for e5 =(e_mat3(2)-0.001):0.0001:(e_mat3(2)+0.001)
        for e6=(e_mat3(3)-0.001):0.0001:(e_mat3(3)+0.001)
            
            strain_external = [1 e6 e5;e6 0 e4;e5 e4 -1];
            g_mat = Euler_to_gmat(euler_angle);
            s_in= g_mat*strain_external*g_mat';
            Taylor_factor = cal_taylor_factor(s_in);
            if Taylor_factor<min_taylor
                min_taylor = Taylor_factor;
                e_mat4 = [e4 e5 e6];
            end
            
        end
    end
end


min_taylor=5000;
%% Iteration =6 

for e4 =(e_mat4(1)-0.0001):0.00001:(e_mat4(1)+0.0001)
    for e5 =(e_mat4(2)-0.0001):0.00001:(e_mat4(2)+0.0001)
        for e6=(e_mat4(3)-0.0001):0.00001:(e_mat4(3)+0.0001)
            
            strain_external = [1 e6 e5;e6 0 e4;e5 e4 -1];
            g_mat = Euler_to_gmat(euler_angle);
            s_in= g_mat*strain_external*g_mat';
            Taylor_factor = cal_taylor_factor(s_in);
            if Taylor_factor<min_taylor
                min_taylor = Taylor_factor;
                e_mat5 = [e4 e5 e6];
            end
            
        end
    end
end


%% End of Iteration
e4 = e_mat5(1);
e5 = e_mat5(2);
e6 = e_mat5(3);


str_ext =[1 e6 e5;e6 0 e4;e5 e4 -1];
end
