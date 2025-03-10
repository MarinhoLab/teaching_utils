% Configuration space
q0 = sym("q0","real");
q1 = sym("q1","real");
q2 = sym("q2","real");

% Link Length Parameter
l0 = sym("l0","real");
l1 = sym("l1","real");
l2 = sym("l2","real");

%% Relative transformations

% First joint
Rz0 = get_Hri(q0,'z');
Tz0 = get_Hti(l0,'z');
Rx0 = int32(get_Hri(pi/2,'x')); % Important to convert to integer or we have floating point issues carried over.

H0_1 = Rz0*Tz0*Rx0;

% Second joint
Rz1 = get_Hri(q1,'z');
Tx1 = get_Hti(l1,'x');

H1_2 = Rz1*Tx1;

% Third joint
Rz2 = get_Hri(q2,'z');
Tx2 = get_Hti(l2,'x');

H2_3 = Rz2*Tx2;

%% FKM

H0_2 = simplify(H0_1 * H1_2)
H0_3 = simplify(H0_1 * simplify(H1_2 * H2_3))