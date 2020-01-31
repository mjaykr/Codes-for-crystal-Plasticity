function str_ext = strain_external_e45(euler_angle)
dummy7=1;

Taylor_factor=zeros(101,101);
for e5 =-5:0.1:5
    dummy6 =1;
    for e4=-5:0.1:5
        
        strain_external = [1 0 e5;0 0 e4;e5 e4 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor(dummy7,dummy6) = cal_taylor_factor(s_in);
        dummy6 = dummy6+1;
    end
    
    
    dummy7 = dummy7+1;
    
end
[~, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p1=(-5) + 0.1*(p_row-1);
det_q1=(-5) + 0.1*(q_col-1);


%% iteration 2


dummy7=1;
Taylor_factor=zeros(round(((((det_p1+0.1)-(det_p1-0.1))/0.01)+1),0),round(((((det_q1+0.1)-(det_q1-0.1))/0.01)+1),0));
for e5 =(det_p1-0.1):0.01:(det_p1+0.1)
    dummy6 =1;
    for e4=(det_q1-0.1):0.01:(det_q1+0.1)
        
        strain_external = [1 0 e5;0 0 e4;e5 e4 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor(dummy7,dummy6) = cal_taylor_factor(s_in);
        dummy6 = dummy6+1;
    end
    dummy7 = dummy7+1;
    
end
[~, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p2=(det_p1-0.1) + 0.01*(p_row-1);
det_q2=(det_q1-0.1) + 0.01*(q_col-1);




%% Iteration 3


dummy7=1;
Taylor_factor=zeros(round(((((det_p2+0.01)-(det_p2-0.01))/0.001)+1),0),round(((((det_q2+0.01)-(det_q2-0.01))/0.001)+1),0));
for e5 =(det_p2-0.01):0.001:(det_p2+0.01)
    dummy6 =1;
    for e4=(det_q2-0.01):0.001:(det_q2+0.01)
        strain_external = [1 0 e5;0 0 e4;e5 e4 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor(dummy7,dummy6) = cal_taylor_factor(s_in);
        dummy6 = dummy6+1;
    end
    
    
    dummy7 = dummy7+1;
    
end
[~, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p3=(det_p2-0.01) + 0.001*(p_row-1);
det_q3=(det_q2-0.01) + 0.001*(q_col-1);

%% Iteration 4


dummy7=1;
Taylor_factor=zeros(round(((((det_p3+0.001)-(det_p3-0.001))/0.0001)+1),0),round(((((det_q3+0.001)-(det_q3-0.001))/0.0001)+1),0));
for e5 =(det_p3-0.001):0.0001:(det_p3+0.001)
    dummy6 =1;
    for e4=(det_q3-0.001):0.0001:(det_q3+0.001)
        strain_external = [1 0 e5;0 0 e4;e5 e4 -1];
        g_mat = Euler_to_gmat(euler_angle);
        s_in= g_mat*strain_external*g_mat';
        Taylor_factor(dummy7,dummy6) = cal_taylor_factor(s_in);
        dummy6 = dummy6+1;
    end
    
    
    dummy7 = dummy7+1;
    
end
[~, index_min_taylor] = min(Taylor_factor(:));
[p_row, q_col] = ind2sub(size(Taylor_factor),index_min_taylor);
det_p4=(det_p3-0.001) + 0.0001*(p_row-1);
det_q4=(det_q3-0.001) + 0.0001*(q_col-1);
e4 = det_q4;
e5 = det_p4;
str_ext =[1 0 e5;0 0 e4;e5 e4 -1];
end