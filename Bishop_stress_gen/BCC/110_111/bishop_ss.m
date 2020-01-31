clc
clear all
collect_BHSS = {'A' 'B' 'C' 'F' 'G' 'H' 'aUI' 'aUII' 'aUIII' 'aUI' 'aUIV' 'aUV' 'aUVI' 'aUII' 'aUV' 'aUVI' 'aUIV' 'aUIII'};
syms sigma11 sigma12 sigma13 sigma23 sigma22 sigma33


sd = [1 1 1;-1 1 1;1 -1 1;1 1 -1]; % a, b, c, d directions respectively
sp = [0 1 -1; 1 0 -1; 1 -1 0;0 1 -1;1 0 1;1 1 0;0 1 1; 1 0 -1;1 1 0; 0 1 1;1 0 1;1 -1 0]; %Each direction from above lie on three planes consequitively
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

%% Defining Direction cosine with Slip Direction and Cube axes

for i = 1:size(sd,1)
    for j = 1:size(ca,1)
        sd_ca(i,j) = dcosine(sd(i,:),ca(j,:));
        
    end
end

% For different Slip direction

% sd_ca = La1 La2 La3
%         Lb1 Lb2 Lb3
%         Lc1 Lc2 Lc3
%         Ld1 Ld2 Ld3 
% where a b c d are slip planes and 1 2 3 are the cube axes


%% Creating the equations
i = 1;
for j = 1:size(sd,1)
    count = 1;
    while count<4
        
        resolved_stress(j,count) = (sp_ca(i,1)*sd_ca(j,1)*sigma11 + sp_ca(i,2)*sd_ca(j,2)*sigma22 + sp_ca(i,3)*sd_ca(j,3)*sigma33 + (sp_ca(i,1)*sd_ca(j,2)+sp_ca(i,2)*sd_ca(j,1))*sigma12 +(sp_ca(i,1)*sd_ca(j,3)+sp_ca(i,3)*sd_ca(j,1))*sigma13 + (sp_ca(i,2)*sd_ca(j,3)+sp_ca(i,3)*sd_ca(j,2))*sigma23);
        i = i+1;
        count = count+1;
    end
end

equations = subs(resolved_stress, [((sigma22/(6^(1/2)))-(sigma33/(6^(1/2)))),((sigma33/(6^(1/2)))-(sigma11/(6^(1/2)))),((sigma11/(6^(1/2)))-(sigma22/(6^(1/2)))),((sigma23)/(6^(1/2))),((sigma13)/(6^(1/2))),((sigma12)/(6^(1/2)))],[sym('A'),sym('B'),sym('C'),sym('F'),sym('G'),sym('H')]);
equations = subs(equations, [(-(6^(1/2)*sigma11)/6 + (6^(1/2)*sigma22)/6),((6^(1/2)*sigma11)/6 - (6^(1/2)*sigma33)/6),(- (6^(1/2)*sigma22)/6 + (6^(1/2)*sigma33)/6)],[sym('-C'),sym('-B'),sym('-A')]);

% 
% [ F - C + G, B + F + H, A + G - H]    ~[aAI aAII aAIII] 
% [ C + F + G, F - B - H, G - A + H]    ~[bAI bAIV bAV] 
% [ F - B + H, A + G + H, C + F - G]    ~[cAII cAV cAVI]
% [ A - G + H, H - F - B, C - F + G]    ~[dAIII dAIV dAVI]

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

