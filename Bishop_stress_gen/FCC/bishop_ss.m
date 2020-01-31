clc
clear all
collect_BHSS = {'A' 'B' 'C' 'F' 'G' 'H' 'aI' 'aII' 'aIII' 'bI' 'bII' 'bIII' 'cI' 'cII' 'cIII' 'dI' 'dII' 'dIII'};
syms sigma11 sigma12 sigma13 sigma23 sigma22 sigma33

sp = [1 1 1; -1 -1 1; -1 1 1; 1 -1 1]; % a b c d plane respectively
sd = [0 1 -1; -1 0 1; 1 -1 0;0 -1 -1;1 0 1;-1 1 0;0 1 -1;1 0 1;-1 -1 0;0 -1 -1;-1 0 1;1 1 0]; % direction of slip planes
ca = [1 0 0; 0 1 0; 0 0 1];

%% Defining Direction cosine with Slip Plane and Cube axes

for i = 1:size(sp,1)
    for j = 1:size(ca,1)
        sp_ca(i,j) = dcosine(sp(i,:),ca(j,:));
        
    end
end
% sp_ca = La1 La2 La3
%         Lb1 Lb2 Lb3
%         Lc1 Lc2 Lc3
%         Ld1 Ld2 Ld3
% where a b c d are slip planes and 1 2 3 are the cube axes

%% Defining Direction cosine with Slip Direction and Cube axes

for i = 1:size(sd,1)
    for j = 1:size(ca,1)
        sd_ca(i,j) = dcosine(sd(i,:),ca(j,:));
        
    end
end

% sd_ca = LI1 LI2 LI3
%         LII1 LII2 LII3
%         LIII1 LIII2 LIII3
% For planne a = (111)
% sd_ca = LI1 LI2 LI3
%         LII1 LII2 LII3
%         LIII1 LIII2 LIII3
% For planne b = (-1-11)
% sd_ca = LI1 LI2 LI3
%         LII1 LII2 LII3
%         LIII1 LIII2 LIII3
% For planne b = (-111)
% sd_ca = LI1 LI2 LI3
%         LII1 LII2 LII3
%         LIII1 LIII2 LIII3
%         Ld1 Ld2 Ld3
% where I II III  are slip direction and 1 2 3 are the cube axes

%% Creating the equations
j = 1;
for i = 1:size(sp,1)
    count = 1;
    while count<4
        
        resolved_stress(i,count) = (sp_ca(i,1)*sd_ca(j,1)*sigma11 + sp_ca(i,2)*sd_ca(j,2)*sigma22 + sp_ca(i,3)*sd_ca(j,3)*sigma33 + (sp_ca(i,1)*sd_ca(j,2)+sp_ca(i,2)*sd_ca(j,1))*sigma12 +(sp_ca(i,1)*sd_ca(j,3)+sp_ca(i,3)*sd_ca(j,1))*sigma13 + (sp_ca(i,2)*sd_ca(j,3)+sp_ca(i,3)*sd_ca(j,2))*sigma23);
        j = j+1;
        count = count+1;
    end
end

equations = subs(resolved_stress, [(sigma22/(6^(1/2))-sigma33/(6^(1/2))),(sigma33/(6^(1/2))-sigma11/(6^(1/2))),(sigma11/(6^(1/2))-sigma22/(6^(1/2))),(sigma23)/(6^(1/2)),(sigma13)/(6^(1/2)),(sigma12)/(6^(1/2))],[sym('A'),sym('B'),sym('C'),sym('F'),sym('G'),sym('H')]);

%  [ A - G + H, B + F - H, C - F + G]  ~ [aI aII aIII]
%  [ A + G + H, B - F - H, C + F - G]  ~ [bI bII bIII]
%  [ A + G - H, B + F + H, C - F - G]  ~ [cI cII cIII]
%  [ A - G - H, B - F + H, C + F + G]  ~ [dI dII dIII]

%% Solving the equations
verify =0;
for A = -1:0.5:1
    for B = -1:0.5:1
        for C = -1:0.5:1
            for F = -1:0.5:1
                for G = -1:0.5:1
                    for H = -1:0.5:1
                        
                        solved_mat = eval(equations);
                        if A+B+C~=0
                            break
                        else
                            checking_valid_mat = check_valid_mat(solved_mat);
                            if checking_valid_mat ==1
                                verify =verify+1;
                                all_slip = [A B C F G H];
                                operating_slip_system = reshape(solved_mat',12,1)';
                                BHSS = num2cell([all_slip operating_slip_system]); % Bishop Hill stress states and corresponding slip systems
                                collect_BHSS = [collect_BHSS;BHSS];
                            end
                        end
                        
                    end
                end
            end
        end
    end
end


verify
xlswrite('Bishops Hill Stress state and Corresponding Slip System',collect_BHSS);

