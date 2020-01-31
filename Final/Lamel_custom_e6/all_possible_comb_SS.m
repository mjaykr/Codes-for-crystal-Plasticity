%% To generate all possible matrix of 5 row Out of 8 possible rows (from Bishop Hill Stress state)
function All_poss_comb_of_SS=all_possible_comb_SS(all_independent_slip_system)

dummy_m = nchoosek(1:1:size(all_independent_slip_system,1),5);
                for counter3=1:1:size(dummy_m,1)
                    generate_mat = [];
                    for counter4 = 1:1:size(dummy_m,2)
                        generate_mat = [generate_mat;all_independent_slip_system(dummy_m(counter3,counter4),:)];
                        
                    end
                    Three_DM(:,:,counter3) = generate_mat;
                    
                end
                
     All_poss_comb_of_SS=Three_DM;
                
end