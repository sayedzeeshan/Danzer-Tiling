function [ Y ] = tile1( p1,p2,p3 ) 
T = pi/7; %theta
a = 1;
b = a*(sin(2*T)/sin(T));
c = a*(sin(4*T)/sin(T));


[~,s1] = size(p1);
[~,s2] = size(p2);
[~,s3] = size(p3);

Y = zeros(2,3*s1+s2+4*s3);

i = 1;
Y(:,i:i+s2-1) = rotate(flipX(p2),-5*T);  
i = i + s2;
Y(:,i:i+s1-1) = translate(p1,[b;0]);
i = i + s1;
Y(:,i:i+s3-1) = translate(rotate(p3,6*T),[c*cos(2*T);c*sin(2*T)]);
i = i + s3;
Y(:,i:i+s3-1) = translate(rotate(flipX(p3),-6*T),[c*cos(2*T);c*sin(2*T)]);
i = i + s3;
Y(:,i:i+s1-1) = translate(rotate(p1,-T),[c*cos(3*T);c*sin(3*T)]);
i = i + s1;
Y(:,i:i+s1-1) = translate(translate(rotate(flipX(p1),T),[c*cos(2*T);c*sin(2*T)]),[a*cos(T);a*sin(T)]);
i = i + s1;
Y(:,i:i+s3-1) = translate(translate(rotate(p3,-pi),[c*cos(2*T);c*sin(2*T)]),[c*cos(3*T);c*sin(3*T)]);
i = i + s3;
Y(:,i:i+s3-1) = translate(translate(p3,[c*cos(2*T);c*sin(2*T)]),[c*cos(4*T);c*sin(4*T)]);


end

