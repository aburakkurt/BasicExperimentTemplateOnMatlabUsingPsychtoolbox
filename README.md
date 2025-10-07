# Gabor Stimulus Presentation Template (Psychtoolbox)

This repository provides a clean, ready-to-run **MATLAB Psychtoolbox** template for displaying randomized **Gabor stimuli** on the screen.

## Features
- Uses Psychtoolbox to present **white Gaussian Gabors**
- Randomized stimulus locations each trial
- Adjustable parameters for viewing distance, size (in visual degrees), contrast, and duration
- Modular helper functions
- Placeholder for adding input collection or eye-tracking

## Folder Structure
```
gabor_template/
├── main_gabor_template.m
├── functions/
│   ├── size_scaler.m
│   ├── visuoangle.m
│   ├── create_example_conditions.m
└── README.md
```

## Usage
1. Install [Psychtoolbox-3](http://psychtoolbox.org/)
2. Open MATLAB and add this folder to your path:
   ```matlab
   addpath(genpath('gabor_template'));
   ```
3. Run the main file:
   ```matlab
   main_gabor_template
   ```

## Customization
- Change `trial_num`, `view_distance`, or `gabor_size_deg` in `main_gabor_template.m`
- Insert your input collection code at the marked section:
  ```matlab
  % === INSERT YOUR INPUT COLLECTION CODE HERE ===
  ```

## Author
Created as a general reusable template for psychophysical experiments using Psychtoolbox.
