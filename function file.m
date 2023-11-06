%%
%QUESTION 5 FUNCTION
% Function definition for gravityAcceleration

function z = func(height)
    % Constants
    G = 6.672e-11; % Gravitational constant (N m^2 / kg^2)
    M = 5.98e24;   % Mass of the Earth (kg)
    R = 6371e3;    % Mean radius of the Earth (m)
    
    % Anonymous function to calculate acceleration due to gravity
    acceleration = @(h) -G * (M ./ (R + h).^2);
    
    % Calculate acceleration due to gravity at the given height
    acc = acceleration(height);
    
    % Calculate z using the acceleration value
    z = sqrt(abs(acc));
end


%%




