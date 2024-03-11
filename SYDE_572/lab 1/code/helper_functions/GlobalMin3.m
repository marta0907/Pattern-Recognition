function [min_x,min_y] = GlobalMin3(m_1,m_2,m_3)
min_x_y_1 = min(m_1);
min_x_y_2 = min(m_2);
min_x_y_3 = min(m_3);

min_x_1 = min(min_x_y_1(1),min_x_y_2(1));
min_y_1 = min(min_x_y_1(2),min_x_y_2(2));

min_x = min (min_x_y_3(1), min_x_1);
min_y = min (min_x_y_3(2), min_y_1);
end