function [class] = Classify_point_MICD(m,S,point)
 len = length(m);
 dist = zeros(1,len);
 for i = 1:len
     S_i = squeeze(S(i,:,:));  
     m_i = m(i,:);
     dist(i) = (point - m_i) * (S_i\(point - m_i)');
 end
 [~,class] = min(dist);
end