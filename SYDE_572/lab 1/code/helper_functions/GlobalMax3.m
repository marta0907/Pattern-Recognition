function [max_x,max_y] = GlobalMax3(m_1,m_2,m_3)
max_x_y_1 = max(m_1);
max_x_y_2 = max(m_2);
max_x_y_3 = max(m_3);

max_x_1 = max(max_x_y_1(1),max_x_y_2(1));
max_y_1 = max(max_x_y_1(2),max_x_y_2(2));

max_x = max (max_x_y_3(1), max_x_1);
max_y = max (max_x_y_3(2), max_y_1);
end