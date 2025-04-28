% Configuration space
q1 = sym("theta1","real");
q2 = sym("d2","real");
q3 = sym("d3","real");

%% Relative transformations

% First joint
Rz0 = get_Hri(q1,'z'); 

H0_1 = Rz0

% Second joint
Tz1 = get_Hti(q2,'z');
Rx1 = int32(get_Hri(pi/2,'x'));

H1_2 = Tz1*Rx1;

% Third joint
Tz2 = get_Hti(q3,'z');

H2_3 = Tz2;

%% FKM

H0_2 = simplify(H0_1 * H1_2)
H0_3 = simplify(H0_1 * simplify(H1_2 * H2_3))

%% Jacobian

% z
z_0 = [0;0;1]
z_1 = H0_1(1:3,1:3) * [0;0;1]
z_2 = H0_2(1:3,1:3) * [0;0;1]

% p
p_0 = [0;0;0]
p_1 = H0_1(1:3,4)
p_2 = H0_2(1:3,4)
p_3 = H0_3(1:3,4)


% ji [RPP]

j1 = [cross(z_0, (p_0 - p_3));
        z_0]

j2 = [z_1;
      zeros(3,1)];

j3 = [z_2;
       zeros(3,1)];

% Jacobian

J = [j1, j2, j3]

det(J)