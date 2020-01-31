function check_valid_mat = check_valid_mat(matrix)
cell_counter =0;
zero_cell = 0;
for i=1:size(matrix,1)
    for j=1:size(matrix,2)
        if matrix(i,j)==0
            zero_cell = zero_cell +1;
        elseif matrix(i,j) ==1 || matrix(i,j) == -1
            cell_counter =cell_counter +1;
        end
    end
end

total_cell_counter = cell_counter + zero_cell ;
if total_cell_counter == 12 && cell_counter>4
    check_valid_mat =1;
else
    check_valid_mat =0;
end
end