%{
          Title : Golden Section Method
    Description : Implementation of Golden Section Method for minimizing the
                  function f(x) = x^2 + x*sin(x) + cos(x) + 6 over the
                  interval [-10 10] with error less than 0.1%.
  Obj. function : f(x) = x^2 + x*sin(x) + cos(x) + 6 
       interval : [-10 10]
        
        Note: f(x) is implemented in a separate matlab function script and
              is simply invoked here

     Written by : Muleta Kalkidan Deme, ID : 2017712139,
                   Sungkyunkwan University
           Date : Jun 1, 2020
%}

clear
clc
%interval
lower = -10;                % Lower boundary(a0)
upper = 10;                 % Upper boundary(b0)
error = upper - lower;      % Initialize the error equal to full range
Interval = [lower upper];   % Initial interval

%initilize
p = 0.3820;                 % The Golden Ratio
                                    % First iteration
a  = lower + p*(upper-lower);       % a1 
b = lower + (1-p)*(upper-lower);    % b1 
f_a = f(a);                         % f(a1)
f_b = f(b);                         % f(b1)

% keep iteration records to be used in tables later
As(1,1) = lower;
As(2,1) = a;
Bs(1,1) = upper;
Bs(2,1) = b;
Es(1,1) = error;
Es(2,1) = b-a;
f_As(1,1) = f(lower);
f_As(2,1) = f_a;
f_Bs(1,1) = f(upper);
f_Bs(2,1) = f_b;
Intervals(1,1:2) = Interval;
Intervals(2,1:2) = [a b];

while error > 0.01          % until acceptable error
   if f_a < f_b             % if f(ai) < f(bi), on each iteration
      upper = b;            % new upper boundary
      b = a;                % next value of b
      f_b = f_a;
      a = lower + p*(upper-lower);% next value of a,
      f_a = f(a);
      
   else                     % if f(ai) >= f(bi)
       lower = a;           % new lower boundary
       a = b;               % next value of a, a(i+1) = b(i) 
       f_a = f_b;
       b = lower + (1-p)*(upper-lower); % next value of b
       f_b = f(b);
   end
   error = b-a;    % error of the current iteration
   Interval = [lower upper]; % updated interval
   
   % table values
   As(end+1,1) = a;
   Bs(end+1,1) = b;
   Es(end+1,1) = error;
   f_As(end+1,1) = f_a;
   f_Bs(end+1,1) = f_b;
   Intervals(end+1,1:2) = Interval;
end
table(As,Bs,f_As,f_Bs,Es,Intervals)

% plots
figure('Name','Golden Section Method','NumberTitle','off');
subplot(2,2,1)
plot(As)
title('Converging of Golden section vs iteration')
hold on
plot(Bs)
plot(Es)
hold off
xlabel('Iteration')
ylabel('x')
legend('a','b','error')

subplot(2,2,2)
plot(f_As)
title('f(a) and f(b) vs iterations')
hold on
plot(f_Bs)
xlabel('Iteration')
ylabel('f(x)')
legend('f(a)','f(b)')

subplot(2,2,3)
plot(Intervals)
title('converging of lower and upeer bounds vs iterations')
xlabel('Iteration')
ylabel('x')
legend('lower','upper')
