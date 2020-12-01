clc; close all
fprintf('================================\n');
fprintf('Welcome to Toziterate machine XD\n');
fprintf('================================\n');

% Inputing image file %
In = input('please input your image file:', 's');
In = imread(In);
x  = rgb2gray(In);
[m,n]= size(x);

% Inputing reference matrix %
fprintf('Please input reference matrix - (Col/Row)\n');
y=zeros(3,3);
y(1,1)=input('(1/1)');
y(1,2)=input('(1/2)');
y(1,3)=input('(1/3)');
y(2,1)=input('(2/1)');
y(2,2)=input('(2/2)');
y(2,3)=input('(2/3)');
y(3,1)=input('(3/1)');
y(3,2)=input('(3/2)');
y(3,3)=input('(3/3)');

% Showing 3x3 matrix u inputed %
fprintf('\n');
fprintf('This is matrix u inputed:\n');
y

% Setting up kernel matrix %
kernel = zeros(m,n);

% Iteration %
fprintf('Start calculating...\n');
fprintf('Loading...\n');
for j = 2 : n-1
    for i = 2 : m-1
        dif = 0;
        dif = dif+abs(x(i-1,j-1)-y(1,1));
        dif = dif+abs(x(i,j-1)-y(1,2));
        dif = dif+abs(x(i+1,j-1)-y(1,3));
        dif = dif+abs(x(i-1,j)-y(2,1));
        dif = dif+abs(x(i,j)-y(2,2));
        dif = dif+abs(x(i+1,j)-y(2,3));
        dif = dif+abs(x(i-1,j+1)-y(3,1));
        dif = dif+abs(x(i,j+1)-y(3,2));
        dif = dif+abs(x(i+1,j+1)-y(3,3));
        kernel(i,j)=dif;
    end
end

% Results %
figure;
subplot(1,3,1);imshow(In);
subplot(1,3,2);imshow(x);
subplot(1,3,3);imshow(kernel);

fprintf('Finished\n');