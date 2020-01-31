syms sigma11 sigma12 sigma13 sigma22 sigma33 sigma23

a = [1 1 1];
b = [-1 -1 1];
c = [-1 1 1];
d = [1 -1 1];
I = [0 1 -1];
II = [-1 0 1];
III = [1 -1 0];
one  = [1 0 0];
two = [0 1 0];
three = [0 0 1];

La_one = (a/sqrt(a*a'))*((one/sqrt(one*one')))';
Lb_one = (b/sqrt(b*b'))*((one/sqrt(one*one')))';
Lc_one = (c/sqrt(c*c'))*((one/sqrt(one*one')))';
Ld_one = (d/sqrt(d*d'))*((one/sqrt(one*one')))';
La_two = (a/sqrt(a*a'))*((two/sqrt(two*two')))';
Lb_two = (b/sqrt(b*b'))*((two/sqrt(two*two')))';
Lc_two = (c/sqrt(c*c'))*((two/sqrt(two*two')))';
Ldtwo = (d/sqrt(d*d'))*((two/sqrt(two*two')))';
La_three = (a/sqrt(a*a'))*((three/sqrt(three*three')))';
Lb_three = (b/sqrt(b*b'))*((three/sqrt(three*three')))';
Lc_three = (c/sqrt(c*c'))*((three/sqrt(three*three')))';
Ld_three = (d/sqrt(d*d'))*((three/sqrt(three*three')))';


sigma_

