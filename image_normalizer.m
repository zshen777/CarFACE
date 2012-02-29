close all; 
clear all;

current_raw_image=imread('2006_Honda_Civic.jpg');

% figure
% imagesc(current_raw_image)

B=rgb2gray(current_raw_image);
B=double(B);
BW = edge(B);

%%%%%%%& Plot the Edged Vehicle %%%%%%%&
%%%%%%%% Play here with the Edge Detection Tolerances
figure(1)
imagesc(BW); %,colorbar;
colormap(gray(256));
hold on;

%%%%%%%% Find all the edges in the logical %%%%%%%%%%
[row col] = find(BW);

%%%%%%%% Find the extreme values %%%%%%%%%%
[left_val left_indexes] = min(col);
[right_val right_indexes] = max(col);
[top_val top_indexes] = min(row);
[bottom_val bottom_indexes] = max(row);

vehicle_width = col(right_indexes)-col(left_indexes);
vehicle_height = row(bottom_indexes)-row(top_indexes);

crop_vector=[col(left_indexes), row(top_indexes), vehicle_width, vehicle_height];
scale_factor=800/vehicle_width;


cropped_image=imcrop(A,crop_vector);
resized_image=imresize(cropped_image,[scale_factor*vehicle_width scale_factor*vehicle_height]);

% plot(col(left_indexes),row(left_indexes),'ro','MarkerSize',14)
% plot(col(top_indexes),row(top_indexes),'ro','MarkerSize',14)
% plot(col(right_indexes),row(right_indexes),'ro','MarkerSize',14)
% plot(col(bottom_indexes),row(bottom_indexes),'ro','MarkerSize',14)