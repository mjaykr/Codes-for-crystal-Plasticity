%% This script is used to create a 5 X 5 matrix

function five_by_five_mat = five_by_five_mat(all_possible_comb_SS)

    for counter5=1:1:size(all_possible_comb_SS,3)
        collect_column=[];
        for counter6=1:1:size(all_possible_comb_SS,1)
            column1 = (1/(sqrt(6)))*[all_possible_comb_SS(counter6,5,counter5)*all_possible_comb_SS(counter6,2,counter5),all_possible_comb_SS(counter6,6,counter5)*all_possible_comb_SS(counter6,3,counter5), all_possible_comb_SS(counter6,5,counter5)*all_possible_comb_SS(counter6,3,counter5)+all_possible_comb_SS(counter6,6,counter5)*all_possible_comb_SS(counter6,2,counter5), all_possible_comb_SS(counter6,4,counter5)*all_possible_comb_SS(counter6,3,counter5)+all_possible_comb_SS(counter6,1,counter5)*all_possible_comb_SS(counter6,6,counter5), all_possible_comb_SS(counter6,4,counter5)*all_possible_comb_SS(counter6,2,counter5)+all_possible_comb_SS(counter6,1,counter5)*all_possible_comb_SS(counter6,5,counter5)]';
            collect_column = [collect_column column1];
        end
        fivebyfive_mat(:,:,counter5)=collect_column;

    end
    five_by_five_mat = fivebyfive_mat;
end
