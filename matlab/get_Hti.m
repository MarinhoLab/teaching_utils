function Hti_ret = get_Hti(length,i)
%get_Ti Obtains the translation matrix for a given length and
%axis index.
%   For an index \in ('x','y','z') returns the corresponding rotation
%   matrix and rotation axis.
    if i=='x'
        Hti_ret = [1, 0, 0, length;
                   0, 1, 0, 0;
                   0, 0, 1, 0;
                   0, 0, 0, 1];
    end
    if i=='y'
        Hti_ret = [1, 0, 0, 0;
                   0, 1, 0, length;
                   0, 0, 1, 0;
                   0, 0, 0, 1];
    end
    if i=='z'
        Hti_ret = [1, 0, 0, 0;
                   0, 1, 0, 0;
                   0, 0, 1, length;
                   0, 0, 0, 1];
    end

end