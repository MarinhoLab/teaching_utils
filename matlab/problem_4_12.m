% Configuration space
q1 = sym("q1","real");
q2 = sym("q2","real");
q3 = sym("q3","real");

% Link Length Parameter
a1 = sym("a1","real");
a2 = sym("a2","real");
a3 = sym("a3","real");

%% Relative transformations

% First joint
Rz0 = simplify(get_Hri(q1 + pi/2,'z')); % Important to force the simplification here otherwise we don't have trigonometric simplifications
Tz0 = get_Hti(a1,'z');
Rx0 = int32(get_Hri(pi/2,'x')); % Important to convert to integer or we have floating point issues carried over.

H0_1 = Rz0*Tz0*Rx0;

% Second joint
Rz1 = get_Hri(q2,'z');
Tx1 = get_Hti(a2,'x');

H1_2 = Rz1*Tx1;

% Third joint
Rz2 = get_Hri(q3,'z');
Tx2 = get_Hti(a3,'x');

H2_3 = Rz2*Tx2;

%% FKM

H0_2 = simplify(H0_1 * H1_2);
H0_3 = simplify(H0_1 * simplify(H1_2 * H2_3))