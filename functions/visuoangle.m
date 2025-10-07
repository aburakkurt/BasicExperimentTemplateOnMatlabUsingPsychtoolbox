function angle_deg = visuoangle(size_cm, distance_cm)
%% visuoangle(size_cm, distance_cm)
% Calculates the visual angle (in degrees) subtended by an object
% of physical size 'size_cm' viewed at distance 'distance_cm'.

angle_deg = 2 * rad2deg(atan(size_cm / (2 * distance_cm)));
end
