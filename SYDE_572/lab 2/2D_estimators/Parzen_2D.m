function [result,x,y] = Parzen_2D(al,bl,cl,res,win)
[p_al,x,y] = parzen(al,res,win);
[p_bl,x,y] = parzen(bl,res,win);
[p_cl,x,y] = parzen(cl,res,win);
result = zeros(length(y),length(x));
    for i =1:length(y)
        for j =1:length(x)
            if (p_al(i,j) > p_bl(i,j) && p_al(i,j)>p_cl(i,j))
                result(i,j) =1;
            elseif (p_bl(i,j) > p_al(i,j) && p_bl(i,j)>p_cl(i,j))
                result(i,j) = 2;
            else
                result(i,j) =3;
            end
        end
    end
end