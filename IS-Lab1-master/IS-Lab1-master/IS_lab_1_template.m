%Classification using perceptron

%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[1;-1;-1;1;-1];

%% train single perceptron with two inputs and one output

%Test = [1 1 1 -1 -1];
%count = 0;
%for a = 1:10
% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);
n = 0.05 ;
%count1=0;
% calculate wieghted sum with randomly generated parameters
%v1 = <...>; % write your code here
% calculate current output of the perceptron 
e = zeros(5);
for x =1:1:5
    v =  w1*x1(x) + w2*x2(x) + b;
    if v > 0
        y = 1;
    else
        y = -1;
    end
    e(x) = T(x) - y;
end 

% calculate the total error for these 5 inputs 
er = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
epoch = 0;
% write training algorithm
while er ~= 0 && epoch < 1000
    % executes while the total error is not 0
	% here should be your code of parameter update
epoch = epoch + 1;

    for x = 1:5
%   calculate output for current example
        v = w1*x1(x) + w2*x2(x) + b;
        if v > 0
            y = 1;
        else
            y = -1;
        end
%   calculate error for current example
        e(x) = T(x) - y;
%   update parameters using current inputs ant current error
        w1 = w1 + n * e(x) * x1(x);
        w2 = w2 + n * e(x) * x2(x);
        b = b + n * e(x); 

% 
%   Test how good are updated parameters (weights) on all examples used for training
%   calculate outputs and errors for all 5 examples using current values of the parameter set {w1, w2, b}
%   calculate 'v1', 'v2', 'v3',... 'v5'
% 
%   calculate 'y1', ..., 'y5'
%     
%   calculate 'e1', ... 'e5'    
     end
    er = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
end
%disp(w1);
%disp(w2);
%disp(b);


% Test feature matrix
x1_test = [hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_P3 hsv_value_P4];
x2_test = [metric_A4 metric_A5 metric_A6 metric_P3 metric_P4];

% Classifying test images
for i = 1:5
    % Calculate weighted sum (v) for each test image
    v_test = x1_test(i) * w1 + x2_test(i) * w2 + b;
    
    % Determine perceptron output (1 = Apple, -1 = Pear)
    if v_test > 0
        y_test = 1;
        fprintf('Testinis paveikslas %d yra: Obolis\n', i);
        %if y_test ==  Test(x)
        %    count1 = count1 + 1;
    else
        y_test = -1;
        fprintf('Testinis paveikslas %d yra: Kriausis\n', i);
        %if y_test ==  Test(x)
           % count1 = count1 + 1;
    end
end
%end
%a=a+1;
%if count1 == 5
%    count = count +1;
%end
%end
%disp(count)