%% To calculate new euler angle from rotation matrix
function new_euler_angle=rot_mat_to_euler_angle(New_rotation_matrix)

new_phi = real(round(radtodeg(round(acos(New_rotation_matrix(3,3)),4)),8));
new_phi1 = real(round(radtodeg(round(asin(New_rotation_matrix(3,1)/sin(degtorad(new_phi))),4)),8));
new_phi2 = real(round(radtodeg(round(acos(New_rotation_matrix(2,3)/round(sin(degtorad(new_phi)),3)),4)),8));
new_euler_angle = round([new_phi1 new_phi new_phi2],8);

end
