% Measure approximation error and compression ratio for several images.
%
% NOTE Images must be have .jpg ending and reside in the same folder.

%<<<<<<< HEAD
%IMAGE_DIR = '../test_images/';
%IMAGE_DIR = '../swissmountains/';
%=======

%IMAGE_DIR = '../photos/training/';
%IMAGE_DIR = '../photos/evaluation/';
%IMAGE_DIR = '../clipart/training/';
IMAGE_DIR = '../clipart/evaluation/';
%IMAGE_DIR = '../swissmountains/';
%>>>>>>> FETCH_HEAD
%IMAGE_DIR = './';

file_list = dir(IMAGE_DIR); 
k = 1;

Errors = []; % mean squared errors for each image would be stored here
Comp_rates = []; % compression rate for each image would be stored here

for i = 3:length(file_list) % runing through the folder
    
    file_name = file_list(i).name; % get current filename
    
    if(max(file_name(end-3:end) ~= '.jpg') && max(file_name(end-3:end) ~= '.png')) % check that it is an image
        continue;
    end
    
    % Read image, convert to double precision and map to [0,1] interval
    I = imread([IMAGE_DIR file_name]); 
    I = double(I) / 255; 
    
    size_orig = whos('I'); % size of original image
    
    I_comp = Compress(I, 4, 5, 32); % compress image
    I_rec = Decompress(I_comp, true); % decompress it
    
    % Measure approximation error
    Errors(k) = mean(mean(mean( ((I - I_rec) ).^2)));

    % Measure compression rate
    size_comp = whos('I_comp'); % size of compresseed image
    Comp_rates(k) = size_comp.bytes / size_orig.bytes; 
    
    k = k+1;
    
end

Result(1) = mean(Errors);
Result(2) = mean(Comp_rates);
Result(3) = var(Errors);
Result(4) = var(Comp_rates);

disp(['Average quadratic error: ' num2str(Result(1)) ' (variance ' num2str(Result(3)) ')'])
disp(['Average compression rate: ' num2str(Result(2)) ' (variance ' num2str(Result(4)) ')'])
