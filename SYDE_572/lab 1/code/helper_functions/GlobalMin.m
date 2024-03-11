function [min_x,min_y] = GlobalMin(m_1,m_2)

min_x_y_1 = min(m_1);
min_x_y_2 = min(m_2);

min_x = min(min_x_y_1(1),min_x_y_2(1));
min_y = min(min_x_y_1(2),min_x_y_2(2));
end
