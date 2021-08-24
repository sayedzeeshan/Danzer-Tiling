% Author: Sayed Zeeshan Asghar
% Copyright 2021
% Aperiodic Danzer Tiling generator

% Danzer
close all;

T = pi/7; %theta


a = 1;
b = a*(sin(2*T)/sin(T));
c = a*(sin(4*T)/sin(T));

SF = a / (a+b) ;  %scaling factor

% Prototile I:

p00 = [0,0];
p01 = [a,0];
p02 = [b*cos(4*T),b*sin(4*T)];

p1 = [p00' p01' p02' p00'];

figure,
subplot(1,3,1)
plot([p00(1,1),p01(1,1),p02(1,1),p00(1,1)],[p00(1,2),p01(1,2),p02(1,2),p00(1,2)],'k-');
title('Title 1 (Level 0)');

% Prototile II:
p10 = [0,0];
p11 = [c,0];
p12 = [b*cos(2*T),b*sin(2*T)];

p2 = [p10' p11' p12' p10'];

subplot(1,3,2)
plot([p10(1,1),p11(1,1),p12(1,1),p10(1,1)],[p10(1,2),p11(1,2),p12(1,2),p10(1,2)],'k-');
title('Title 2 (Level 0)');

% Prototile II:
p20 = [0,0];
p21 = [a,0];
p22 = [c*cos(3*T),c*sin(3*T)];

p3 = [p20' p21' p22' p20'];

subplot(1,3,3)
plot([p20(1,1),p21(1,1),p22(1,1),p20(1,1)],[p20(1,2),p21(1,2),p22(1,2),p20(1,2)],'k-');
title('Title 3 (Level 0)');


%Calculate indices for Level 1 tiles, Lij satands for tile i of level j
L31 = tile3(p1,p2,p3); 
L11 = tile1(p1,p2,p3); 
L21 = tile2(p1,p2,p3); 


%Calculate indices for Level 2 tiles, Lij satands for tile i of level j
L11 = L11*SF;
L21 = L21*SF;
L31 = L31*SF;

L32 = tile3(L11,L21,L31); 
L12 = tile1(L11,L21,L31); 
L22 = tile2(L11,L21,L31); 

%Calculate indices for Level 3 tiles, Lij satands for tile i of level j
L12 = L12*SF;
L22 = L22*SF;
L32 = L32*SF;

L33 = tile3(L12,L22,L32); 
L13 = tile1(L12,L22,L32); 
L23 = tile2(L12,L22,L32); 

%Calculate indices for Level 3 tiles, Lij satands for tile i of level j
L13 = L13*SF;
L23 = L23*SF;
L33 = L33*SF;

L34 = tile3(L13,L23,L33); 
L14 = tile1(L13,L23,L33); 
L24 = tile2(L13,L23,L33); 

%Calculate indices for Level 4 tiles, Lij satands for tile i of level j

L14 = L14*SF;
L24 = L24*SF;
L34 = L34*SF;

L35 = tile3(L14,L24,L34); 
L15 = tile1(L14,L24,L34); 
L25 = tile2(L14,L24,L34); 


%% Plots examples of different levels

figure,
hold on;
for j = 0:7
plot(L31(1,4*j+1:4*j+4),L31(2,4*j+1:4*j+4),'k-');
end
hold off;
title('Title 3 (Level 1)');


figure,
hold on;
for j = 0:10
plot(L21(1,4*j+1:4*j+4),L21(2,4*j+1:4*j+4),'k-');
end
hold off;
title('Title 2 (Level 1)');


figure,
hold on;
for j = 0:5
plot(L11(1,4*j+1:4*j+4),L11(2,4*j+1:4*j+4),'k-');
end
hold off;
title('Title 1 (Level 1)');


Z = L13; 
[~,l] = size(Z);
figure,
hold on;
for j = 0:l/4-1 
plot(Z(1,4*j+1:4*j+4),Z(2,4*j+1:4*j+4),'k-');
end
hold off;
title('Title 1 (Level 3)');

Z = L23; 
[~,l] = size(Z);
figure,
hold on;
for j = 0:l/4-1 
plot(Z(1,4*j+1:4*j+4),Z(2,4*j+1:4*j+4),'k-');
end
hold off;
title('Title 2 (Level 3)');

Z = L34; 
[~,l] = size(Z);
figure,
hold on;
for j = 0:l/4-1 
plot(Z(1,4*j+1:4*j+4),Z(2,4*j+1:4*j+4),'k-');
end
hold off;
title('Title 3 (Level 4)');





