%% This script finds the minimum taylor factor varying e4, e5, e6 and corresponding stain matrix is considered for analysis of that garin
function strain_ext = strain_external_min_taylor_factor(euler_angle)

taylor_e4 = e4(euler_angle);
taylor_e5 = e5(euler_angle);
taylor_e6 = e6(euler_angle);

if taylor_e4(1)<taylor_e5(1) && taylor_e6(1)
    strain_external = [1 0 0;0 0 taylor_e4(2);0 taylor_e4(2) -1];
elseif taylor_e5(1)<taylor_e4(1) && taylor_e6(1)
    strain_external = [1 0 taylor_e5(2);0 0 0;taylor_e5(2) 0 -1];
else
    strain_external = [1 taylor_e6(2) 0;taylor_e6(2) 0 0;0 0 -1];
    
    
    
end 
strain_ext =strain_external;
end