function taylor_factor = cal_taylor_factor(s_in)

m = zeros(1,56);
for counter1=1:1:56 % Calculating m using bishop-hill table and picking max m as taylor factor
    m(counter1) = sqrt(6)*( (bishop(counter1,1)*s_in(2,2)) - ((bishop(counter1,2)*s_in(1,1))) + ((bishop(counter1,4)*2*s_in(2,3))) + ((bishop(counter1,5)*2*s_in(3,1))) +((bishop(counter1,6)*2*s_in(1,2))));
end
taylor_factor = max(m);
end
