Volume_of_sample = input('Please enter the volume of sample = ');
Dm1 = input('Density of Metal M1 = ');
Dm2 = input('Density of Metal M2 = ');
Wtm1 = input('Mass fraction of Metal M1 = ');
Wtm2 = input('Mass fraction of Metal M2 = ');
Porosity = input('Percentage of Porosity = ');
%% Calculating Theoretical Density

TD_composite = ((Wtm1/Dm1)+(Wtm2/Dm2))^(-1);
Total_mass = TD_composite*Volume_of_sample ;

ABS_mass_m1 = Total_mass * Wtm1;
ABS_mass_m2 = Total_mass * Wtm2;


