clear all;
clc;


store_taylor_factor = [];
%% Asking the euler angle input from User

prompt = 'Enter your file name having orientation of grain in apostrophe(''myfile.txt''):-';
name_of_file = input(prompt);
all_euler = dlmread(name_of_file);
%% getting hkl and uvw from Euler angle


for counter16 = 1:1:size(all_euler,1)
    euler_angle = all_euler(counter16,:);
  
    strain_external = [0.5 0 0;0 0.5 0;0 0 -1];
        desired_row = 0;
        
        %converting degree to radian and storing as phi1,phi,phi2
        phi1 = degtorad(euler_angle(1));
        phi = degtorad(euler_angle(2));
        phi2 = degtorad(euler_angle(3));
        
        g11 = ((cos(phi1)*cos(phi2))-sin(phi1)*sin(phi2)*cos(phi));
        g12 = (sin(phi1)*cos(phi2))+(cos(phi1)*sin(phi2)*cos(phi));
        g13 = sin(phi2)*sin(phi);
        
        g21 = (-cos(phi1)*sin(phi2) - sin(phi1)*cos(phi2)*cos(phi));
        g22 = (-sin(phi1)*sin(phi2) + cos(phi1)*cos(phi2)*cos(phi));
        g23 = cos(phi2)*sin(phi);
        
        g31 = sin(phi1)*sin(phi);
        g32 = (-cos(phi1)*sin(phi));
        g33 = cos(phi);
        
        g = [g11 g12 g13;g21 g22 g23;g31 g32 g33];
        z = [round(g13,1) round(g23,1) round(g33,1)];
        x = [round(g11,1) round(g21,1) round(g31,1)];
        y = [round(g12,1) round(g22,1) round(g32,1)];
        g_inv=inv(g);
        g_trans = g';
        
        %% calcualting the strains along crystallographic axis
        s_in= g*strain_external*g_trans;
        
        
        bh =    [1.00	-1.00	0.00	0.00	0.00	0.00
            0.00	1.00	-1.00	0.00	0.00	0.00
            -1.00	0.00	1.00	0.00	0.00	0.00
            0.00	0.00	0.00	1.00	0.00	0.00
            0.00	0.00	0.00	0.00	1.00	0.00
            0.00	0.00	0.00	0.00	0.00	1.00
            0.50	-1.00	0.50	0.00	0.50	0.00
            0.50	-1.00	0.50	0.00	-0.50	0.00
            -1.00	0.50	0.50	0.50	0.00	0.00
            -1.00	0.50	0.50	-0.50	0.00	0.00
            0.50	0.50	-1.00	0.00	0.00	0.50
            0.50	0.50	-1.00	0.00	0.00	-0.50
            0.50	0.00	-0.50	0.50	0.00	0.50
            0.50	0.00	-0.50	-0.50	0.00	0.50
            0.50	0.00	-0.50	0.50	0.00	-0.50
            0.50	0.00	-0.50	-0.50	0.00	-0.50
            0.00	-0.50	0.50	0.00	0.50	0.50
            0.00	-0.50	0.50	0.00	-0.50	0.50
            0.00	-0.50	0.50	0.00	0.50	-0.50
            0.00	-0.50	0.50	0.00	-0.50	-0.50
            -0.50	0.50	0.00	0.50	0.50	0.00
            -0.50	0.50	0.00	-0.50	0.50	0.00
            -0.50	0.50	0.00	0.50	-0.50	0.00
            -0.50	0.50	0.00	-0.50	-0.50	0.00
            0.00	0.00	0.00	0.50	0.50	-0.50
            0.00	0.00	0.00	0.50	-0.50	0.50
            0.00	0.00	0.00	-0.50	0.50	0.50
            0.00	0.00	0.00	0.50	0.50	0.50
            -1.00	1.00	0.00	0.00	0.00	0.00
            0.00	-1.00	1.00	0.00	0.00	0.00
            1.00	0.00	-1.00	0.00	0.00	0.00
            0.00	0.00	0.00	-1.00	0.00	0.00
            0.00	0.00	0.00	0.00	-1.00	0.00
            0.00	0.00	0.00	0.00	0.00	-1.00
            -0.50	1.00	-0.50	0.00	-0.50	0.00
            -0.50	1.00	-0.50	0.00	0.50	0.00
            1.00	-0.50	-0.50	-0.50	0.00	0.00
            1.00	-0.50	-0.50	0.50	0.00	0.00
            -0.50	-0.50	1.00	0.00	0.00	-0.50
            -0.50	-0.50	1.00	0.00	0.00	0.50
            -0.50	0.00	0.50	-0.50	0.00	-0.50
            -0.50	0.00	0.50	0.50	0.00	-0.50
            -0.50	0.00	0.50	-0.50	0.00	0.50
            -0.50	0.00	0.50	0.50	0.00	0.50
            0.00	0.50	-0.50	0.00	-0.50	-0.50
            0.00	0.50	-0.50	0.00	0.50	-0.50
            0.00	0.50	-0.50	0.00	-0.50	0.50
            0.00	0.50	-0.50	0.00	0.50	0.50
            0.50	-0.50	0.00	-0.50	-0.50	0.00
            0.50	-0.50	0.00	0.50	-0.50	0.00
            0.50	-0.50	0.00	-0.50	0.50	0.00
            0.50	-0.50	0.00	0.50	0.50	0.00
            0.00	0.00	0.00	-0.50	-0.50	0.50
            0.00	0.00	0.00	-0.50	0.50	-0.50
            0.00	0.00	0.00	0.50	-0.50	-0.50
            0.00	0.00	0.00	-0.50	-0.50	-0.50];
        %% Calculating taylor factor for single crystal
        
        for counter1=1:1:56
            m(counter1) = round(sqrt(6)*( (bh(counter1,1)*s_in(2,2)) - ((bh(counter1,2)*s_in(1,1))) + ((bh(counter1,4)*2*s_in(2,3))) + ((bh(counter1,5)*2*s_in(3,1))) +((bh(counter1,6)*2*s_in(1,2)))),3);
        end
        Taylor_factor = max(m);
        store_taylor_factor = [store_taylor_factor;Taylor_factor ];
end
