function det_p = p1_lamel(euler_angle)

i3=2;
for i1=1:1:size(euler_angle,1)
    neg = (-1)^i3;
    dummy7=1;
for p =-0.5:0.0001:0.5
    
    strain_external = [1 (p*neg) 0;(p*neg) 0 0;0 0 -1];
    g_mat = Euler_to_gmat(euler_angle(i1,:));
    s_in= g_mat*strain_external*g_mat';
    for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor 
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
det_p1=(-0.5) + 0.0001*(p_row-1);
det_p = det_p1;
end