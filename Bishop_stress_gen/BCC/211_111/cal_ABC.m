function cal_ABC = cal_ABC(~)
Dummy = [];
for A = -12:1:12
    A=A/12;
    for B = -12:1:12
        B=B/12;
        for C = -12:1:12
            C=C/12;
            if A+B+C ==0
                
           Dummy = [Dummy;A B C]  ;  
            end
        end
    end
end
cal_ABC = Dummy;
end
