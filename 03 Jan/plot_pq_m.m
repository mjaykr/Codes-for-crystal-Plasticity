function det_pq = plot_pq_m(euler_angle)

dummy7=1;

for p =-2:0.01:2
    dummy6 =1;
for q=-2:0.01:2
    
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
det_p=(-2) + 0.01*(p_row-1);
det_q=(-2) + 0.01*(q_col-1);
dummy8 = -2:0.01:2;
dummy9 = -2:0.01:2;
[xx,yy]=meshgrid(dummy8,dummy9);
figure
surf(xx,yy,Taylor_factor)


% for i=1:1:length(dummy8)
% plot(dummy8,Taylor_factor(i,:))
% hold on
% end


det_pq =[det_p, det_q];



end