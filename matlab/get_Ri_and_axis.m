function [Ri_ret,axis] = get_Ri_and_axis(angle,i)
%get_Ri_and_axis Obtains the rotation matrix and axis for a given angle and
%axis index.
%   For an index \in ('x','y','z') returns the corresponding rotation
%   matrix and rotation axis.

    if i=='x'
        Ri_ret = [1, 0,           0;
                  0, cos(angle), -sin(angle);
                  0, sin(angle),  cos(angle)];
        axis   = [1;0;0];
    end
    if i=='y'
        Ri_ret = [cos(angle),   0, sin(angle);
                  0,            1, 0;
                 -sin(angle),   0, cos(angle)];
        axis   = [0;1;0];
    end
    if i=='z'
        Ri_ret = [cos(angle), -sin(angle), 0;
                  sin(angle),  cos(angle), 0;
                  0,                    0, 1];
        axis   = [0;0;1];
    end

end