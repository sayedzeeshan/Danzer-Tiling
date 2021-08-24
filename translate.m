function [ Y ] = translate( X, T )
Y(1,:) = X(1,:) + T(1);
Y(2,:) = X(2,:) + T(2);
end

