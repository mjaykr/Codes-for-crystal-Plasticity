function det_pq = relax_p_q_sequencially(euler_angle)
dummy6 =1;
for p=-2:0.001:2
    
    strain_external = [1 0 p;0 0 0;p 0 -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2)))),8);
    end
    Taylor_factor(dummy6) = max(m);
    dummy6 = dummy6+1; 
end
[min_taylor1, index_min_taylor] = min(Taylor_factor);
det_p=(-2) + 0.001*(index_min_taylor-1);

dummy7 =1;
for q=-2:0.001:2
    
    strain_external = [1 0 det_p;0 0 q;det_p q -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m1(counter1) = round(sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2)))),8);
    end
    Taylor_factor1(dummy7) = max(m1);
    dummy7 = dummy7+1; 
end
[min_taylor2, index_min_taylor] = min(Taylor_factor1);
det_q=(-2) + 0.001*(index_min_taylor-1);
det_pq = [det_p,det_q];
end
