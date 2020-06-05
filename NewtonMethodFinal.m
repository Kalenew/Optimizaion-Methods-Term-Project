%{
          Title : Newton Method
    Description : Implementation of Newton Method for minimizing the
                  function f(x) = x^2 + x*sin(x) + cos(x) + 6 with initial
                  points being 1) x_i = -10 or 2) x_i = 10,  with error 
                  less than 0.1%.
  Obj. function : f(x) = x^2 + x*sin(x) + cos(x) + 6 
  initial point : 1) x_i = -10 
                  2) x_i = 10
        
        Note: f(x, f'(x) and f"(x) are implemented in three separate matlab
                function script, and are simply invoked in this script

     Written by : Muleta Kalkidan Deme, ID : 2017712139,
                   Sungkyunkwan University
           Date : Jun 1, 2020
%}

clear 
clc

%Initialize
x_start = [-10 10];                 % two starting points

for i=1:length(x_start)
    %clear
    error = 2;                      % reset error for new starting point
    x = x_start(i);                 % current starting point
    iter = 0;
    Xs(1,i) = x;                    % records the x, used for table & plots
    f_Xs(1,i) = f(x);               % records the f(x)
    while error > 0.01
        x_new = x - fPrime(x)/f2Prime(x);   % new x
        error  = abs(x_new - x);            % error
        x = x_new;
        if i  == 1                          % for the first starting point
            Xs(end+1,i) = x_new;
            f_Xs(end+1,i) = f(x_new);
        else
            Xs(iter+1,i) = x_new;
            f_Xs(iter+1,i) = f(x_new);
        end
        iter = iter +1;
    end
    % table
    table(Xs(:,i),f_Xs(:,i))
    
end
% plots
figure('Name','Newton Method ','NumberTitle','off');
hold on

subplot(2,2,1)
plot(Xs(:,1))
title('Newton Method, x_start = -10 ')
ylabel('x')
xlabel('Iteration')
legend('x')

subplot(2,2,2)
plot(f_Xs(:,1))
title('Newton Method, x_start = -10')
ylabel('f(x)')
xlabel('Iteration')
legend('f(x)')

subplot(2,2,3)
plot(Xs(:,2))
title('Newton Method, x_start = 10 ')
ylabel('x')
xlabel('Iteration')
legend('x')

subplot(2,2,4)
plot(f_Xs(:,2))
title('Newton Method, x_start = 10 ')
ylabel('f(x)')
xlabel('Iteration')
legend('f(x)')


