function det_p = p_lamel(euler_angle)
i3=2;
Taylor_factor=zeros(2,101);
m=zeros(1,56);
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p =-5:0.1:5
        strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle(i1,:));
        s_in= g_mat*strain_external*g_mat';
        for counter1=1:1:56
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
        end
        Taylor_factor(i1,dummy7) = max(m);
        dummy7 = dummy7+1;
    end
    i3=1;
end
sum_all_row=sum(Taylor_factor);
[~, index_min_taylor] = min(sum_all_row);
p_row = index_min_taylor;
det_p1=(-5) + 0.1*(p_row-1);

%% iteration 2
i3=2;
Taylor_factor = zeros(2,round(((((det_p1+0.1)-(det_p1-0.1))/0.001)+1)));
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
    for p =(det_p1-0.1):0.001:(det_p1+0.1)
        strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
        g_mat = Euler_to_gmat(euler_angle(i1,:));
        s_in= g_mat*strain_external*g_mat';
        for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
            m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
        end
        Taylor_factor(i1,dummy7)=max(m);
        dummy7 = dummy7+1;
        
    end
    i3=1;
end
sum_all_row=sum(Taylor_factor);
[~, index_min_taylor] = min(sum_all_row);
p_row = index_min_taylor;
det_p2=(det_p1-0.1) + 0.001*(p_row-1);

% iteration 3
% i3=2;
% Taylor_factor = zeros(2,round(((((det_p2+0.001)-(det_p2-0.001))/0.00001)+1),0));
% for i1=1:1:size(euler_angle,1)
%     neg = (-1)^i3;
%     dummy7=1;
% for p =(det_p2-0.001):0.00001:(det_p2+0.001)
%     strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
%     g_mat = Euler_to_gmat(euler_angle(i1,:));
%     s_in= g_mat*strain_external*g_mat';
%     for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
%             m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
%     end
%     Taylor_factor(i1,dummy7) = max(m);
% dummy7 = dummy7+1;
% 
% end
% i3=1;
% end
% sum_all_row=sum(Taylor_factor);
% [~, index_min_taylor] = min(sum_all_row);
% p_row = index_min_taylor;
% det_p3=(det_p2-0.001) + 0.00001*(p_row-1);

%% iteration 4
%
% i3=2;
% for i1=1:1:size(euler_angle,1)
%     neg = (-1)^i3;
%     dummy7=1;
% for p =(det_p3-0.001):0.0001:(det_p3+0.001)
%
%     strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
%     g_mat = Euler_to_gmat(euler_angle(i1,:));
%     s_in= g_mat*strain_external*g_mat';
%     for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
%             m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
%     end
%     Taylor_factor(i1,dummy7) = max(m);
%
%
% dummy7 = dummy7+1;
%
% end
% i3=1;
% end
% sum_all_row=sum(Taylor_factor);
% [~, index_min_taylor] = min(sum_all_row);
% p_row = index_min_taylor;
% det_p4=(det_p3-0.001) + 0.0001*(p_row-1);
%
% %% iteration 5
%
% i3=2;
% for i1=1:1:size(euler_angle,1)
%     neg = (-1)^i3;
%     dummy7=1;
% for p =(det_p4-0.0001):0.00001:(det_p4+0.0001)
%
%     strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
%     g_mat = Euler_to_gmat(euler_angle(i1,:));
%     s_in= g_mat*strain_external*g_mat';
%     for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
%             m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
%     end
%     Taylor_factor(i1,dummy7) = max(m);
%
%
% dummy7 = dummy7+1;
%
% end
% i3=1;
% end
% sum_all_row=sum(Taylor_factor);
% [~, index_min_taylor] = min(sum_all_row);
% p_row = index_min_taylor;
% det_p5=(det_p4-0.0001) + 0.00001*(p_row-1);
%



det_p = det_p2;
end