function [max_x,max_y] = GlobalMax(m_1,m_2)

max_x_y_1 = max(m_1);
max_x_y_2 = max(m_2);

max_x = max(max_x_y_1(1),max_x_y_2(1));
max_y = max(max_x_y_1(2),max_x_y_2(2));
end