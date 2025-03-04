function B = get_B(euler_angles_label)
%get_B Obtains the B matrix for a given set of Euler angles.
%   Examples of input: 'zyz', 'xyz'.
%   Using the methodology of https://ethz.ch/content/dam/ethz/special-interest/mavt/robotics-n-intelligent-systems/rsl-dam/documents/RobotDynamics2016/RD2016script.pdf

a_label = euler_angles_label(1);
b_label = euler_angles_label(2);
c_label = euler_angles_label(3);

a = sym(a_label+"1","real");
b = sym(b_label+"2","real");
c = sym(c_label+"3","real");

[Ra,axis_a] = get_Ri_and_axis(a,a_label);
[Rb,axis_b] = get_Ri_and_axis(b,b_label);
[~,axis_c] = get_Ri_and_axis(c,c_label);

b1 = axis_a;
b2 = Ra * axis_b;
b3 = Ra * Rb * axis_c;

B = [b1, b2, b3];

end


