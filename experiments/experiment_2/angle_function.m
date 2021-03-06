function [ angle ] = angle_function( v1, v2 )
%UNTITLED Get angle between two vectors
%   Make use of the fact that for two vectors a and b, a.b = |a||b| cos
%   (theta)
% Therefore, cos (theta) = a.b / (|a||b|)

%    angle = dot (v1, v2) / ( norm(v1) * norm (v2) );
%    angle = acos (angle);

% Scrap that idea. This works out the angle of the difference vector
% between two input vectors v1 and v2
% When defining the angle, we always take our difference vector b - a, such
% that b has the greater x value

if (v1 == v2)
   angle = 0;
   return
end

if ( v1(1) > v2(1) )
   b = v1;
   a = v2;
else
   a = v1;
   b = v2;
end

if (v1(1) == v2(1) )
   if (v1(2) > v2(2) )
      b = v1;
      a = v2;
   else
      b = v2;
      a = v1;
   end
end


difference = b - a;
angle = atan ( difference(2) / difference(1) );


end

