function [ Y ] = tile1( p1,p2,p3 ) 
T = pi/7; %theta
a = 1;
b = a*(sin(2*T)/sin(T));
c = a*(sin(4*T)/sin(T));


[~,s1] = size(p1);
[~,s2] = size(p2);
[~,s3] = size(p3);

Y = zeros(2,3*s1+2*s2+s3);

i = 1;
Y(:,i:i+s2-1) = rotate(flipX(p2),-5*T); 
i = i + s2;
Y(:,i:i+s1-1) = translate(p1,[b;0]);
i = i + s1;
Y(:,i:i+s1-1) = translate(rotate(p1,11*T),[a*cos(4*T);a*sin(4*T)]);
i = i + s1;
Y(:,i:i+s2-1) = translate(rotate(flipX(p2),-8*T),[(a+b)*cos(4*T);(a+b)*sin(4*T)]);
i = i + s2;
Y(:,i:i+s1-1) = translate(translate(rotate(p1,-6*T),[(a+b)*cos(4*T);(a+b)*sin(4*T)]),[(a)*cos(T);(a)*sin(T)]);
i = i + s1;
Y(:,i:i+s3-1) = translate(rotate(p3,T),[(a+b)*cos(4*T);(a+b)*sin(4*T)]);

end

