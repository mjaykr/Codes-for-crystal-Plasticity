clc
clear all
format rat
collect_BHSS = {'A' 'B' 'C' 'F' 'G' 'H' 'aQI' 'aQII' 'aQIII' 'bQIV' 'bQV' 'bQVI' 'cQVII' 'cQVIII' 'cQIX' 'dQX' 'dQXI' 'dQXII'};
syms A B C F G H
% syms sigma11 sigma12 sigma13 sigma23 sigma22 sigma33
%
% sd = [1 1 1;-1 -1 1;-1 1 1;1 -1 1];
% sp = [-2 1 1;1 -2 1;1 1 -2;2 -1 1;-1 2 1;-1 -1 2;2 1 1;-1 -2 1;-1 1 -2;-2 -1 1;1 2 1;1 -1 -2]; % a b c d plane respectively % direction of slip planes
% ca = [1 0 0; 0 1 0; 0 0 1];

%% Defining Direction cosine with Slip Plane and Cube axes

% for i = 1:size(sp,1)
%     for j = 1:size(ca,1)
%         sp_ca(i,j) = dcosine(sp(i,:),ca(j,:));
%
%     end
% end
% sp_ca = La1 La2 La3
%         Lb1 Lb2 Lb3
%         Lc1 Lc2 Lc3
%         Ld1 Ld2 Ld3

%% Defining Direction cosine with Slip Direction and Cube axes

% for i = 1:size(sd,1)
%     for j = 1:size(ca,1)
%         sd_ca(i,j) = dcosine(sd(i,:),ca(j,:));
%
%     end
% end

% For different Slip direction

% sd_ca = La1 La2 La3
%         Lb1 Lb2 Lb3
%         Lc1 Lc2 Lc3
%         Ld1 Ld2 Ld3
% where a b c d are slip planes and 1 2 3 are the cube axes


%% Creating the equations
i = 1;
% for j = 1:size(sd,1)
%     count = 1;
%     while count<4
%
%         resolved_stress(j,count) = (sp_ca(i,1)*sd_ca(j,1)*sigma11 + sp_ca(i,2)*sd_ca(j,2)*sigma22 + sp_ca(i,3)*sd_ca(j,3)*sigma33 + (sp_ca(i,1)*sd_ca(j,2)+sp_ca(i,2)*sd_ca(j,1))*sigma12 +(sp_ca(i,1)*sd_ca(j,3)+sp_ca(i,3)*sd_ca(j,1))*sigma13 + (sp_ca(i,2)*sd_ca(j,3)+sp_ca(i,3)*sd_ca(j,2))*sigma23);
%         i = i+1;
%         count = count+1;
%     end
% end

% equations = subs(resolved_stress, [((2^(1/2)*sigma11)/6+ (2^(1/2)*sigma22)/6- (2^(1/2)*sigma33)/3),((2^(1/2)*sigma11)/6 - (2^(1/2)*sigma22)/3+ (2^(1/2)*sigma33)/6),(((2^(1/2)*sigma22)/6) - ((2^(1/2)*sigma11)/3) + ((2^(1/2)*sigma33)/6)),((2^(1/2)*sigma12)/3),((2^(1/2)*sigma13)/6),((2^(1/2)*sigma23)/6)],[sym('A'),sym('B'),sym('C'),sym('F'),sym('G'),sym('H')]);
% equations = subs(equations, [((2^(1/2)*sigma12)/6),((2^(1/2)*sigma13)/3),((2^(1/2)*sigma23)/3)],[sym('2*F'),sym('2*G'),sym('2*H')]);
% equations = subs(equations,[(- (2^(1/2)*sigma11)/6 - (2^(1/2)*sigma22)/6 + (2^(1/2)*sigma33)/3),(- (2^(1/2)*sigma11)/6 + (2^(1/2)*sigma22)/3 - (2^(1/2)*sigma33)/6),((2^(1/2)*sigma11)/3 - (2^(1/2)*sigma22)/6 - (2^(1/2)*sigma33)/6)],[sym('-A'),sym('-B'),sym('-C')])
% equations = subs(equations, [A,B,C],[(sym('A-B')),(sym('C-A')),(sym('B-C'))])

% [ A - B + F - G - H, C - A - 2*F + 2*G - H, B - C - 2*F - G + 2*H]
% [ B - A + F - G + H, A - C - 2*F + 2*G + H, B - C + 2*F + G + 2*H]
% [ B - A + F + G - H, C - A + 2*F + 2*G + H, C - B - 2*F + G + 2*H]
% [ A - B + F + G + H, A - C + 2*F + 2*G - H, C - B + 2*F - G + 2*H]

equations = [B-C+2*F-G-H,C-A-F+2*G-H,A-B-F-G+2*H;B-C-2*F+G-H,C-A+F-2*G-H,A-B+F+G+2*H;B-C+2*F+G+H,C-A-F-2*G+H,A-B-F+G-2*H;B-C-2*F-G+H,C-A+F+2*G+H,A-B+F-G-2*H];
%% Solving the equations
verify =0;

Possible_ABC = cal_ABC;






for i = 1:size(Possible_ABC,1)
    A=Possible_ABC(i,1);
    B=Possible_ABC(i,2);
    C=Possible_ABC(i,3);
    
    for F = -12:1:12
        F=F/12;
        for G = -12:1:12
            G=G/12;
            for H = -12:1:12
                H=H/12;
                
                solved_mat = eval(equations);
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

verify
xlswrite('Bishops Hill Stress state and Corresponding Slip System',collect_BHSS);

