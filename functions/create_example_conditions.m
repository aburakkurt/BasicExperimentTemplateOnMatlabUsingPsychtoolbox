function positions = create_example_conditions(trial_num, screen_rect, gabor_size_px)
%% create_example_conditions(trial_num, screen_rect, gabor_size_px)
% Generates random (x,y) positions for Gabor presentation within screen bounds.

screen_width = screen_rect(3);
screen_height = screen_rect(4);
margin = gabor_size_px / 2;

positions = zeros(trial_num, 2);
for i = 1:trial_num
    x = randi([margin, screen_width - margin]);
    y = randi([margin, screen_height - margin]);
    positions(i,:) = [x, y];
end
end
