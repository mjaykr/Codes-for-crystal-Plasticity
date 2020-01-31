%% Calculation of Net Rotation

function rotation=net_rotation(probable_independent_slip_system,collect_shear,strain_increment)
%% Forming 3x3 matrix by calculating diadic prodcut
for counter9=1:1:size(probable_independent_slip_system,1)
three_by_three(:,:,counter9) = [probable_independent_slip_system(counter9,4);probable_independent_slip_system(counter9,5); probable_independent_slip_system(counter9,6)]*[probable_independent_slip_system(counter9,1) probable_independent_slip_system(counter9,2) probable_independent_slip_system(counter9,3)];
end

%% finding e12, e21, e13, e31, e23 and e32
e12=0; e21=0; e13=0; e31=0; e23=0; e32 = 0;
% finding e12
for counter10 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(1,2,counter10)*collect_shear(counter10)*strain_increment;
e12 = dummy2+e12;
end
% finding e21
for counter11 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(2,1,counter11)*collect_shear(counter11)*strain_increment;
e21 = dummy2+e21;
end
% finding e13
for counter12 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(1,3,counter12)*collect_shear(counter12)*strain_increment;
e13 = dummy2+e13;
end
% finding e31
for counter13 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(3,1,counter13)*collect_shear(counter13)*strain_increment;
e31 = dummy2+e31;
end
% finding e23
for counter14 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(2,3,counter14)*collect_shear(counter14)*strain_increment;
e23 = dummy2+e23;
end
% finding e32
for counter15 = 1:1:size(three_by_three,3)
dummy2 = three_by_three(3,2,counter15)*collect_shear(counter15)*strain_increment;
e32 = dummy2+e32;
end


%% calculating W12, W31 and W23
w12 = (e12-e21)/4.88; w31 = (e31-e13)/4.88; w23 = (e23-e32)/4.88;
Net_rotaion = sqrt((w12*w12) + (w31*w31) + (w23*w23));
rotation = Net_rotaion;
end