function det_pq = pq_relaxed(euler_angle)

dummy7=1;
for p =-5:1:5
    dummy6 =1;
for q=-5:1:5
    
    strain_external = [1 0 p;0 0 q;p q -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
    end
    Taylor_factor(dummy7,dummy6) = max(m);
    dummy6 = dummy6+1; 
end


dummy7 = dummy7+1;

end
[min_taylor, index_min_taylor] = min(Taylor_factor(:))
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor)
det_p1=(-5) + 1*(p_row-1);
det_q1=(-5) + 1*(q_col-1);

det_pq1 =[det_p1, det_q1]
%% iteration 2


dummy7=1;
for p =(det_p1-1):0.1:(det_p1+1) 
    dummy6 =1;
for q=(det_q1-1):0.1:(det_q1+1)
    
    strain_external = [1 0 p;0 0 q;p q -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
    end
    Taylor_factor(dummy7,dummy6) = max(m);
    dummy6 = dummy6+1; 
end


dummy7 = dummy7+1;

end
[min_taylor, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p2=(det_p1-1) + 0.1*(p_row-1);
det_q2=(det_q1-1) + 0.1*(q_col-1);
det_pq2 =[det_p2, det_q2]
%% Iteration 3


dummy7=1;
for p =(det_p2-0.1):0.01:(det_p2+0.1) 
    dummy6 =1;
for q=(det_q2-0.1):0.01:(det_q2+0.1)
    
    strain_external = [1 0 p;0 0 q;p q -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
    end
    Taylor_factor(dummy7,dummy6) = max(m);
    dummy6 = dummy6+1; 
end


dummy7 = dummy7+1;

end
[min_taylor, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p3=(det_p2-0.1) + 0.01*(p_row-1);
det_q3=(det_q2-0.1) + 0.01*(q_col-1);

det_pq3 =[det_p3, det_q3]
%% Interation 4


dummy7=1;
for p =(det_p3-0.01):0.001:(det_p3+0.01) 
    dummy6 =1;
for q=(det_q3-0.01):0.001:(det_q3+0.01)
    
    strain_external = [1 0 p;0 0 q;p q -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
    end
    Taylor_factor(dummy7,dummy6) = max(m);
    dummy6 = dummy6+1; 
end


dummy7 = dummy7+1;

end
[min_taylor, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p4=(det_p3-0.01) + 0.001*(p_row-1);
det_q4=(det_q3-0.01) + 0.001*(q_col-1);
det_pq4 =[det_p4, det_q4];


%% Iteration 5
dummy7=1;
for p =(det_p4-0.001):0.0001:(det_p4+0.001) 
    dummy6 =1;
for q=(det_q3-0.001):0.0001:(det_q3+0.001)
    
    strain_external = [1 0 p;0 0 q;p q -1];
    g_mat = Euler_to_gmat(euler_angle);
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
    end
    Taylor_factor(dummy7,dummy6) = max(m);
    dummy6 = dummy6+1; 
end


dummy7 = dummy7+1;

end
[min_taylor, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p5=(det_p4-0.001) + 0.0001*(p_row-1);
det_q5=(det_q4-0.001) + 0.0001*(q_col-1);
det_pq5 =[det_p5, det_q5];
det_pq=det_pq5
end