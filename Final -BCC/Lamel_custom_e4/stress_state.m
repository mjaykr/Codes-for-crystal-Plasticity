function s_s = stress_state(x)

%% Defining Slip System for FCC in [plane direction] format

a = [1 1 1 0 1 -1; 1 1 1 -1 0 1; 1 1 1 1 -1 0; 1 1 1 0 -1 1; 1 1 1 1 0 -1; 1 1 1 -1 1 0];
b = [-1 -1 1 0 -1 -1; -1 -1 1 1 0 1; -1 -1 1 -1 1 0; -1 -1 1 0 1 1; -1 -1 1 -1 0 -1; -1 -1 1 1 -1 0];
c = [-1 1 1 0 1 -1; -1 1 1 1 0 1; -1 1 1 -1 -1 0; -1 1 1 0 -1 1; -1 1 1 -1 0 -1;-1 1 1 1 1 0];
d = [1 -1 1 0 -1 -1; 1 -1 1 -1 0 1; 1 -1 1 1 1 0; 1 -1 1 0 1 1; 1 -1 1 1 0 -1; 1 -1 1 -1 -1 0];

%% Defining operating slip system for all stress states

stress_state_mat(:,:,1) = [a(1,:);a(5,:);b(1,:);b(5,:);c(1,:);c(5,:);d(1,:);d(5,:)];
stress_state_mat(:,:,2) = [a(2,:);a(6,:);b(2,:);b(6,:);c(2,:);c(6,:);d(2,:);d(6,:)];
stress_state_mat(:,:,3) = [a(4,:);a(3,:);b(4,:);b(3,:);c(4,:);c(3,:);d(4,:);d(3,:)];
stress_state_mat(:,:,4) = [a(2,:);a(6,:);b(5,:);b(3,:);c(2,:);c(6,:);d(5,:);d(3,:)];
stress_state_mat(:,:,5) = [a(4,:);a(3,:);b(1,:);b(6,:);c(1,:);c(6,:);d(4,:);d(3,:)];
stress_state_mat(:,:,6) = [a(1,:);a(5,:);b(1,:);b(5,:);c(4,:);c(2,:);d(4,:);d(2,:)];
stress_state_mat(:,:,7) = [a(5,:);a(3,:);b(1,:);b(5,:);c(1,:);c(5,:);d(5,:);d(3,:)];
stress_state_mat(:,:,8) = [a(1,:);a(5,:);b(5,:);b(3,:);c(5,:);c(3,:);d(1,:);d(5,:)];
stress_state_mat(:,:,9) = [a(4,:);a(2,:);b(4,:);b(3,:);c(4,:);c(2,:);d(4,:);d(3,:)];
stress_state_mat(:,:,10) = [a(4,:);a(3,:);b(4,:);b(2,:);c(4,:);c(3,:);d(4,:);d(2,:)];
stress_state_mat(:,:,11) = [a(1,:);a(6,:);b(1,:);b(6,:);c(2,:);c(6,:);d(2,:);d(6,:)];
stress_state_mat(:,:,12) = [a(2,:);a(6,:);b(2,:);b(6,:);c(1,:);c(6,:);d(1,:);d(6,:)];
stress_state_mat(:,:,13) = [a(1,:);a(6,:);b(1,:);b(5,:);c(2,:);c(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,14) = [a(1,:);a(5,:);b(1,:);b(6,:);d(2,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,15) = [a(2,:);a(6,:);c(1,:);c(6,:);d(1,:);d(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,16) = [b(2,:);b(6,:);c(1,:);c(5,:);d(1,:);d(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,17) = [a(5,:);a(3,:);b(1,:);b(5,:);d(4,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,18) = [a(1,:);a(5,:);b(5,:);b(3,:);c(4,:);c(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,19) = [a(4,:);a(3,:);c(1,:);c(5,:);d(5,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,20) = [b(4,:);b(3,:);c(5,:);c(3,:);d(1,:);d(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,21) = [a(4,:);a(2,:);c(2,:);c(6,:);d(4,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,22) = [a(4,:);a(3,:);b(2,:);b(6,:);d(4,:);d(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,23) = [a(2,:);a(6,:);b(4,:);b(3,:);c(4,:);c(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,24) = [b(4,:);b(2,:);c(4,:);c(3,:);d(2,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,25) = [a(4,:);a(2,:);c(1,:);c(6,:);d(5,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,26) = [a(1,:);a(6,:);b(5,:);b(3,:);c(4,:);c(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,27) = [a(5,:);a(3,:);b(1,:);b(6,:);d(4,:);d(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,28) = [b(1,:);b(5,:);c(2,:);c(6,:);d(4,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,29) = [a(4,:);a(2,:);b(4,:);b(2,:);c(4,:);c(2,:);d(4,:);d(2,:)];
stress_state_mat(:,:,30) = [a(5,:);a(3,:);b(5,:);b(3,:);c(5,:);c(3,:);d(5,:);d(3,:)];
stress_state_mat(:,:,31) = [a(1,:);a(6,:);b(1,:);b(6,:);c(1,:);c(6,:);d(1,:);d(6,:)];
stress_state_mat(:,:,32) = [a(5,:);a(3,:);b(2,:);b(6,:);c(5,:);c(3,:);d(2,:);d(6,:)];
stress_state_mat(:,:,33) = [a(1,:);a(6,:);b(4,:);b(3,:);c(4,:);c(3,:);d(1,:);d(6,:)];
stress_state_mat(:,:,34) = [a(4,:);a(2,:);b(4,:);b(2,:);c(1,:);c(5,:);d(1,:);d(5,:)];
stress_state_mat(:,:,35) = [a(2,:);a(6,:);b(4,:);b(2,:);c(4,:);c(2,:);d(2,:);d(6,:)];
stress_state_mat(:,:,36) = [a(4,:);a(2,:);b(2,:);b(6,:);c(2,:);c(6,:);d(4,:);d(2,:)];
stress_state_mat(:,:,37) = [a(1,:);a(5,:);b(1,:);b(6,:);c(1,:);c(5,:);d(1,:);d(6,:)];
stress_state_mat(:,:,38) = [a(1,:);a(6,:);b(1,:);b(5,:);c(1,:);c(6,:);d(1,:);d(5,:)];
stress_state_mat(:,:,39) = [a(4,:);a(3,:);b(4,:);b(3,:);c(5,:);c(3,:);d(5,:);d(3,:)];
stress_state_mat(:,:,40) = [a(5,:);a(3,:);b(5,:);b(3,:);c(4,:);c(3,:);d(4,:);d(3,:)];
stress_state_mat(:,:,41) = [a(4,:);a(3,:);b(4,:);b(2,:);c(5,:);c(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,42) = [a(4,:);a(2,:);b(4,:);b(3,:);d(5,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,43) = [a(5,:);a(3,:);c(4,:);c(3,:);d(4,:);d(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,44) = [b(5,:);b(3,:);c(4,:);c(2,:);d(4,:);d(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,45) = [a(2,:);a(6,:);b(4,:);b(2,:);d(1,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,46) = [a(4,:);a(2,:);b(2,:);b(6,:);c(1,:);c(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,47) = [a(1,:);a(6,:);c(4,:);c(2,:);d(2,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,48) = [b(1,:);b(6,:);c(2,:);c(6,:);d(4,:);d(2,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,49) = [a(1,:);a(5,:);c(5,:);c(3,:);d(1,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,50) = [a(1,:);a(6,:);b(5,:);b(3,:);d(1,:);d(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,51) = [a(5,:);a(3,:);b(1,:);b(6,:);c(1,:);c(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,52) = [b(1,:);b(5,:);c(1,:);c(6,:);d(5,:);d(3,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,53) = [a(1,:);a(5,:);c(4,:);c(3,:);d(2,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,54) = [a(4,:);a(3,:);b(2,:);b(6,:);c(1,:);c(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,55) = [a(2,:);a(6,:);b(4,:);b(3,:);d(1,:);d(5,:);0 0 0 0 0 0; 0 0 0 0 0 0];
stress_state_mat(:,:,56) = [b(4,:);b(2,:);c(5,:);c(3,:);d(1,:);d(6,:);0 0 0 0 0 0; 0 0 0 0 0 0];

s_s = stress_state_mat(:,:,x);
end