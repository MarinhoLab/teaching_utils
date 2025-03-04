function S = get_S(euler_angles_label)
%get_S Obtains the skew-symmetric matrix maping the Euler angle triplet to
%the angular velocities in the fixed frame.
%   Examples of input: 'zyz', 'xyz'. This is calculated symbolically using
%   the properties of the angles and its derivatives so that S =
%   \dot(R)*R^T.

a_label = euler_angles_label(1);
b_label = euler_angles_label(2);
c_label = euler_angles_label(3);

a = sym(a_label+"1","real");
a_dot = sym(a_label+"1_dot","real");
b = sym(b_label+"2","real");
b_dot = sym(b_label+"2_dot","real");
c = sym(c_label+"3","real");
c_dot = sym(c_label+"3_dot","real");

[Ra,~] = Ri(a,a_label);
[Rb,~] = Ri(b,b_label);
[Rc,~] = Ri(c,c_label);

R_dot_a = simplify(a_dot*diff(Ra)*Rb*Rc); 
R_dot_b = simplify(b_dot*Ra*diff(Rb)*Rc); 
R_dot_c = simplify(c_dot*Ra*Rb*diff(Rc)); 
R_dot = simplify(R_dot_a + R_dot_b + R_dot_c);
R = simplify(Ra*Rb*Rc);
 
S = simplify(R_dot*R');

end