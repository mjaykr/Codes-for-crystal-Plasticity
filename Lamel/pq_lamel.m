function det_pq = pq_lamel(euler_angle)
i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p =-5:1:5
        dummy6 =1;
        for q=-5:1:5
            
            strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
            g_mat = Euler_to_gmat(euler_angle(i1,:));
            s_in= g_mat*strain_external*g_mat';
            for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
                m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
            end
            Taylor_factor(dummy7,dummy6,i1) = max(m);
            dummy6 = dummy6+1;
        end
        
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_page=sum(Taylor_factor,3);
[min_taylor, index_min_taylor] = min(sum_all_page(:));
[p_row, q_col] = ind2sub(size(sum_all_page),index_min_taylor);
det_p1=(-5) + 1*(p_row-1);
det_q1=(-5) + 1*(q_col-1);

det_pq1 =[det_p1, det_q1];


%% iteration 2

i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p = (det_p1-1):0.1:(det_p1+1)
        dummy6 =1;
        for q = (det_q1-1):0.1:(det_q1+1)
            
            strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
            g_mat = Euler_to_gmat(euler_angle(i1,:));
            s_in= g_mat*strain_external*g_mat';
            for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
                m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
            end
            Taylor_factor(dummy7,dummy6,i1) = max(m);
            dummy6 = dummy6+1;
        end
        
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_page=sum(Taylor_factor,3);
[min_taylor, index_min_taylor] = min(sum_all_page(:));
[p_row, q_col] = ind2sub(size(sum_all_page),index_min_taylor);
det_p2 = (det_p1-1) + 0.1*(p_row-1);
det_q2 = (det_q1-1) + 0.1*(q_col-1);

det_pq2 =[det_p2, det_q2];


%% Iteration 3


i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p = (det_p2-0.1):0.01:(det_p2+0.1)
        dummy6 =1;
        for q = (det_q2-0.1):0.01:(det_q2+0.1)
            
            strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
            g_mat = Euler_to_gmat(euler_angle(i1,:));
            s_in= g_mat*strain_external*g_mat';
            for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
                m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
            end
            Taylor_factor(dummy7,dummy6,i1) = max(m);
            dummy6 = dummy6+1;
        end
        
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_page=sum(Taylor_factor,3);
[min_taylor, index_min_taylor] = min(sum_all_page(:));
[p_row, q_col] = ind2sub(size(sum_all_page),index_min_taylor);
det_p3 = (det_p2-0.1) + 0.01*(p_row-0.1);
det_q3 = (det_q2-0.1) + 0.01*(q_col-0.1);
det_pq3 =[det_p3, det_q3];

%% Interation 4

i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p = (det_p3-0.01):0.001:(det_p3+0.01)
        dummy6 =1;
        for q = (det_q3-0.01):0.001:(det_q3+0.01)
            
            strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
            g_mat = Euler_to_gmat(euler_angle(i1,:));
            s_in= g_mat*strain_external*g_mat';
            for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
                m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
            end
            Taylor_factor(dummy7,dummy6,i1) = max(m);
            dummy6 = dummy6+1;
        end
        
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_page=sum(Taylor_factor,3);
[min_taylor, index_min_taylor] = min(sum_all_page(:));
[p_row, q_col] = ind2sub(size(sum_all_page),index_min_taylor);
det_p4 = (det_p3-0.01) + 0.001*(p_row-1);
det_q4 = (det_q3-0.01) + 0.001*(q_col-1);

det_pq4 =[det_p4, det_q4];
%% Iteration 5

i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p = (det_p4-0.001):0.0001:(det_p4+0.001)
        dummy6 =1;
        for q = (det_q4-0.001):0.0001:(det_q4+0.001)
            
            strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
            g_mat = Euler_to_gmat(euler_angle(i1,:));
            s_in= g_mat*strain_external*g_mat';
            for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
                m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
            end
            Taylor_factor(dummy7,dummy6,i1) = max(m);
            dummy6 = dummy6+1;
        end
        
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_page=sum(Taylor_factor,3);
[min_taylor, index_min_taylor] = min(sum_all_page(:));
[p_row, q_col] = ind2sub(size(sum_all_page),index_min_taylor);
det_p5 = (det_p4-0.001) + 0.0001*(p_row-1);
det_q5 = (det_q4-0.001) + 0.0001*(q_col-1);

det_pq5 =[det_p5, det_q5];

%% iteration 6

i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p = (det_p5-0.0001):0.00001:(det_p5+0.0001)
        dummy6 =1;
        for q = (det_q5-0.0001):0.00001:(det_q4+0.0001)
            
            strain_external = [1 0 (p*neg);0 0 (q*neg);(p*neg) (q*neg) -1];
            g_mat = Euler_to_gmat(euler_angle(i1,:));
            s_in= g_mat*strain_external*g_mat';
            for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
                m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
            end
            Taylor_factor(dummy7,dummy6,i1) = max(m);
            dummy6 = dummy6+1;
        end
        
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_page=sum(Taylor_factor,3);
[min_taylor, index_min_taylor] = min(sum_all_page(:));
[p_row, q_col] = ind2sub(size(sum_all_page),index_min_taylor);
det_p6 = (det_p5-0.0001) + 0.00001*(p_row-1);
det_q6 = (det_q5-0.0001) + 0.00001*(q_col-1);

det_pq6 =[det_p6, det_q6];



det_pq=det_pq6;
end