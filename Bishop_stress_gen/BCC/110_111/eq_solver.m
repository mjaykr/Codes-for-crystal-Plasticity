function solved_matrix=eq_solver(equation_matrix,i_mat)


solved_matrix = subs(equation_matrix,[A,B,C,F,G,H],i_mat);
                   

end