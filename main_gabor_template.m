%% Gabor Stimulus Presentation Template (Psychtoolbox)
% This script displays white Gaussian Gabor patches at random positions
% on the screen for a specified number of trials. It serves as a general
% template for visual psychophysics experiments.
%
% Dependencies: Psychtoolbox-3
% Optional: Extend with your own input collection, eye-tracking, or data logging code.

clear; clc; close all;
Screen('Preference', 'SkipSyncTests', 1);

try
    %% ======================= Experiment Parameters =======================
    view_distance = 60;             % cm, example viewing distance
    gabor_size_deg = 3;             % visual degrees
    trial_num = 10;                 % total number of trials
    stim_duration = 1.0;            % seconds (1000 ms)
    background_color = [127 127 127]; % mid-gray background
    contrast = 1;                   % 0–1 range

    %% ========================== Screen Setup =============================
    PsychDefaultSetup(2);
    screens = Screen('Screens');
    screen_id = max(screens);
    [window, rect] = Screen('OpenWindow', screen_id, background_color);
    [screen_width_mm, screen_height_mm] = Screen('DisplaySize', window);
    [screen_width_px, screen_height_px] = Screen('WindowSize', window);

    % Compute pixels-per-cm conversion
    cm_per_pixel = (screen_width_mm/10) / screen_width_px;
    pixel_per_cm = 1 / cm_per_pixel;

    % Convert Gabor size from degrees to pixels (keeps constant visual angle)
    gabor_size_cm = size_scaler(view_distance, gabor_size_deg);
    gabor_size_px = round(gabor_size_cm * pixel_per_cm);

    % Screen center
    [x_center, y_center] = RectCenter(rect);

    %% ========================= Gabor Parameters ==========================
    sigma = gabor_size_px / 7;  % Gaussian spread
    phase = 90;                 % phase of sine grating
    freq = 0;                   % cycles per pixel (0 = single Gaussian)
    aspectRatio = 0;            % 0 = symmetric
    disableNorm = 1;
    backgroundOffset = [0 0 0 0]; % transparent background

    % Create procedural Gabor texture
    gabor_tex = CreateProceduralGabor(window, gabor_size_px, gabor_size_px, [], backgroundOffset, disableNorm);
    properties_mat = [phase, freq, sigma, contrast, aspectRatio, 0, 0, 0]';

    %% ===================== Random Position Generation ====================
    rng('shuffle');
    positions = create_example_conditions(trial_num, rect, gabor_size_px);

    %% ============================ Instructions ===========================
    Screen('TextSize', window, 30);
    DrawFormattedText(window, 'Press SPACE to start.', 'center', 'center', [255 255 255]);
    Screen('Flip', window);
    KbWait([], 2); % wait for key press

    %% ============================== Trials ===============================
    for t = 1:trial_num
        % Clear background
        Screen('FillRect', window, background_color);

        % Draw Gabor at randomized location
        dst_rect = CenterRectOnPointd([0 0 gabor_size_px gabor_size_px], positions(t,1), positions(t,2));
        Screen('DrawTexture', window, gabor_tex, [], dst_rect, 0, [], [], [], [], kPsychDontDoRotation, properties_mat);

        % Display stimulus
        Screen('Flip', window);
        WaitSecs(stim_duration);

        % Clear screen between trials
        Screen('FillRect', window, background_color);
        Screen('Flip', window);

        % === INSERT YOUR INPUT COLLECTION CODE HERE ===
        % e.g., KbWait, mouse input, etc.
    end

    %% ============================ Cleanup ================================
    Screen('CloseAll');
    ShowCursor;
    disp('Experiment finished successfully.');

catch ME
    Screen('CloseAll');
    ShowCursor;
    rethrow(ME);
end
