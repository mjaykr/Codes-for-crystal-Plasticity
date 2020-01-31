function det_pq = pq_relaxed_small_step(euler_angle)

    strain_external = [1 0 0;0 0 0;0 0 -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
    end
    Taylor_factor_0 = max(m);


        


% 
% [min_taylor, index_min_taylor] = min(Taylor_factor(:));
% [p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
% det_p=(-2) + 0.01*(p_row-1);
% det_q=(-2) + 0.01*(q_col-1);
% 
% 
% 
% det_pq =[det_p, det_q];



end