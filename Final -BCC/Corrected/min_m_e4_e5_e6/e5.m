function det_e456 = e5(euler_angle)
%% Iteration = 1
dummy6 =1;
Taylor_factor=zeros(1,101);
m=zeros(1,56);
for e5=-5:0.1:5
    
    strain_external = [1 0 e5;0 0 0;e5 0 -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2)))),8);
    end
    Taylor_factor(dummy6) = max(m);
    dummy6 = dummy6+1; 
end
[~, index_min_taylor] = min(Taylor_factor);
det_e5=(-5) + 0.1*(index_min_taylor-1);
%% Iteration = 2
dummy6 =1;
Taylor_factor = zeros(1,round(((((det_e5+0.1)-(det_e5-0.1))/0.001)+1)));
m=zeros(1,56);
for e5=(det_e5-0.1):0.001:(det_e5+0.1)
    strain_external = [1 0 e5;0 0 0;e5 0 -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2)))),8);
    end
    Taylor_factor(dummy6) = max(m);
    dummy6 = dummy6+1; 
end
[~, index_min_taylor] = min(Taylor_factor);
det_e5=(det_e5-0.1) + 0.001*(index_min_taylor-1);

%% Iteration = 3
dummy6 =1;
Taylor_factor = zeros(1,round(((((det_e5+0.001)-(det_e5-0.001))/0.00001)+1)));
m=zeros(1,56);
for e5=(det_e5-0.001):0.00001:(det_e5+0.001)
    strain_external = [1 0 e5;0 0 0;e5 0 -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2)))),8);
    end
    Taylor_factor(dummy6) = max(m);
    dummy6 = dummy6+1; 
end
[Taylor_factor_min, index_min_taylor] = min(Taylor_factor);
det_e5=(det_e5-0.001) + 0.00001*(index_min_taylor-1);




det_e456 = [Taylor_factor_min,det_e5];
end