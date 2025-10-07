function scaled_size = size_scaler(view_distance, visual_degree)
%% size_scaler(view_distance, visual_degree)
% Converts a desired visual angle size (in degrees) to a physical size (in cm)
% that maintains the same visual angle at different viewing distances.

target_size = visual_degree;
if view_distance > 57
    while target_size > visuoangle(visual_degree, view_distance)
        visual_degree = visual_degree + 0.01;
    end
elseif view_distance < 57
    while target_size < visuoangle(visual_degree, view_distance)
        visual_degree = visual_degree - 0.01;
    end
end
scaled_size = visual_degree;
end
