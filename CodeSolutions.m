%%
%written by Aubrey Carew 
% ODD NUMBERS QUESTIONS (1,3,5,7,9)
%%

%%
%QUESTION 1
% Given equations : f(x)=16x^5-18x^3+3x^2-2  g(x)=6x^4+11x^3-19x^2
% declaring these in matlab
Fval = [16,0,-18,3,0,-2];
Gval = [6,11,-19,0,0];

% Part a) : Find the roots of polynomial f(x)
%roots here is a predefined function in matlab syntax and
% froots is the variable that stores the answer for part a
froots = roots(Fval);

% Part b) : Multiply and plot polynomials f(x) and g(x)
%conv is a predefined function in matlab syntax to multiply two polynomials
% multiF_and_G stores the answer of the multiplication
multiF_and_G = conv(Fval, Gval);

%xrange stores values from -10 to 20 with an incremental value of 0.1
xrange = -10:0.1:20;
%polyval evaluates the whole polynomial at specific points
 pointval = polyval(multiF_and_G, xrange);
 %ploting the values in a graph
plot(xrange, pointval), xlabel('X values'), ylabel('Multiplied values')
title('Polynomial f(x) and g(x) graph');


%%
%QUESTION 3
% 3by4 Matrix called A
% declaring matrix A
A = [ 14 1 6 1; ...
    -2 16 14 -6.2; ...
     19 -1.5 9 8];

% Part a) :  Form a new vector containing last three numbers in the second row
%i will create a new variable to store the values from matrix A
newV = A(2, 2:4);

% Part b): Sum of largest numbers in each column in Matrix A 
% key- Matrix_name(row,column)
maxCol1 = max(A(1:3, 1));
maxCol2 = max(A(1:3, 2));
maxCol3 = max(A(1:3, 3));
maxCol4 = max(A(1:3, 4));
%maxCol1 to maxCol4 stores the max value in each column
%sumAll stores the summation answer of the 4 columns
sumAll = maxCol1 + maxCol2 + maxCol3 + maxCol4;

% Part c) : Form a 2x3 matrix containing first and last rows of A
% this code merges two different ranges in matrix A
new2by3M = [A(1, 1:3); A(3, 1:3)];

% A(1, 1:3) means in Matrix A, take the first row and 3 columns 
%from 1 to 3 in row 1 of matrix A
% A(3, 1:3) means in Matrix A, take the third row and 3 columns 
%from 1 to 3 in row 3 of matrix A

%%
%QUESTION 5
%formula: g=-G(M)/((R+h)^2)

% Height alues from 0 km to 40,000 km in 500 km increments
% the values given for G is in meters so everything will be converted to
% meters
% 500km = 500000 meters
heights = 0:500000:40000000; 

% Call the func function to calculate z values for the given heights
% func is the name of the file which this script here will call 
zValues = func(heights);

% Plot the z values
plot(heights, zValues);
xlabel('Height(m) values');
ylabel('z values');
title('z vs Height');


%Function creation code is at the end of this script

%%
%QUESTION 7
% Read x and y vectors from Excel file
extractd = xlsread('data.xlsx', 'Sheet1');
x = extractd(:, 1);
y = extractd(:, 2);


% Calculate z using the user-defined function
z = calculatZ(x, y);

% Write results to another sheet in the same Excel file
xlswrite('data.xlsx', z, 'ResultsSheet');

disp('Results have been written to ResultsSheet in the data.xlsx file.');

%function call at the end of the script

%%
%QUESTION 9
%Structure declaration
% Creating the structure array to store engineer details
%engineer 1 details
engineer(1).Name = 'Michael Jordan';
engineer(1).Expertise = 'Software';
engineer(1).Experience = 10;
%vector to store number of project completed in the last three months
engineer(1).ProjectsCompleted = [6, 6, 10]; 

%engineer 2 details
engineer(2).Name = 'Giannis Antetenkounpo';
engineer(2).Expertise = 'Biomedical';
engineer(2).Experience = 8;
engineer(2).ProjectsCompleted = [1, 7, 9];

%engineer 3 details
engineer(3).Name = 'Luka Doncic';
engineer(3).Expertise = 'Computer';
engineer(3).Experience = 4;
engineer(3).ProjectsCompleted = [9, 3, 4];



% To access the last engineer's last number of projects completed
lastEngineerProjects = engineer(3).ProjectsCompleted(1:3);
disp(['Last engineer`s last number of projects completed are: ', num2str(lastEngineerProjects)]);

%%
%FUNCTION for QUESTION 7
% User-defined function to calculate z
function z = calculatZ(x, y)
    % Check the length of x and y, use the minimum length
    N = min(length(x), length(y));
    x = x(1:N);
    y = y(1:N);
    disp(['Inputs modified: Used first ', num2str(N), ' values from x and y.']);
    
    % Calculate z using the given formula
    z = sqrt(sin(x.^2) .* cos(y.^2 - 2));
end

