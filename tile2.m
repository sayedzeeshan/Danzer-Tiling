function [ Y ] = tile2( p1,p2,p3 ) 
T = pi/7; %theta
a = 1;
b = a*(sin(2*T)/sin(T));
c = a*(sin(4*T)/sin(T));


[~,s1] = size(p1);
[~,s2] = size(p2);
[~,s3] = size(p3);

Y = zeros(2,5*s1+3*s2+3*s3);


i = 1;
Y(:,i:i+s2-1) = translate(rotate(p2,5*T),[a+b;0]);
i = i + s2;
Y(:,i:i+s1-1) = translate(flipX(p1),[a;0]);
i = i + s1;
Y(:,i:i+s3-1) = translate(rotate(p3,4*T),[a+b+c;0]);
i = i + s3;
Y(:,i:i+s1-1) = translate(rotate(p1,-4*T),[a+b + a*cos(3*T);a*sin(3*T)]);
i = i + s1;
Y(:,i:i+s1-1) = translate(rotate(flipX(p1),3*T),[a+b + a*cos(3*T);a*sin(3*T)]);
i = i + s1;
Y(:,i:i+s2-1) =  translate(translate(rotate(p2,5*T),[a+b;0]),[c*cos(T),c*sin(T)]);
i = i + s2;
Y(:,i:i+s2-1) =  translate(translate(rotate(p2,8*T),[a+b;0]),[(a+b)*cos(3*T),(a+b)*sin(3*T)]);
i = i + s2;
Y(:,i:i+s1-1) =  translate(rotate(flipX(p1),-8*T),[(c+b)*cos(2*T),(c+b)*sin(2*T)]);
i = i + s1;
Y(:,i:i+s1-1) =  translate(translate(rotate(p1,7*T),[(a+b)*cos(4*T),(a+b)*sin(4*T)]),[a+b+c;0]);
i = i + s1;
Y(:,i:i+s3-1) =  translate(translate(p3,[a+b;0]),[(a+b)*cos(3*T),(a+b)*sin(3*T)]);
i = i + s3;
Y(:,i:i+s3-1) =  translate(translate(rotate(flipX(p3),-T),[(a+b)*cos(3*T),(a+b)*sin(3*T)]),[a+b;0]);



Y = rotate(flipX(Y),-5*T);

end

