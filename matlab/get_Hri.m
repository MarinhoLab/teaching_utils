function [Hri_ret] = get_Hri(angle,i)
%get_Ri Obtains the rotation matrix for a given angle and
%axis index.
%   For an index \in ('x','y','z') returns the corresponding rotation
%   matrix.
    if i=='x'
        Hri_ret = [1, 0,           0,         0;
                   0, cos(angle), -sin(angle),0;
                   0, sin(angle),  cos(angle),0;
                   0, 0,           0,         1];
    end
    if i=='y'
        Hri_ret = [cos(angle),   0, sin(angle),0;
                   0,            1, 0,         0;
                  -sin(angle),   0, cos(angle),0;
                   0,            0, 0,         1];
    end
    if i=='z'
        Hri_ret = [cos(angle), -sin(angle), 0,0;
                   sin(angle),  cos(angle), 0,0;
                   0,           0,          1,0;
                   0,           0,          0,1];
    end

end