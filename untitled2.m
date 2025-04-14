% Pengwei Huang
% ssyph2@nottingham.edu.cn
%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]



%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear, clc
%b)
a=arduino;
T_c = 0.01;
V_0 = 0.5;
duration = 600;
time = 1:duration;
temp = zeros(1, duration);

for i=1:length(temp)
A0_voltage = readVoltage(a,'A0');
temp(i) = (A0_voltage - 0.5)/ 0.01;
pause(1); 
end
min_temp = min(temp);
max_temp = max(temp);
avg_temp = mean(temp);


plot(time, temp);
xlabel('Time(s)');
ylabel('Temprature(Celsius degree)');
title('Temperature Time Variation Table');

disp('Data logging initiated - 5/3/2024')
disp('Location-Nottingham')

for i=1:60:600
    fprintf('Minute\t%d\n', i/60);
    fprintf('Temperature\t%.2f C\n\n', temp(i));
end


fprintf('Max temp\t%.2f C\n', max_temp);
fprintf('Min temp\t%.2f C\n', min_temp);
fprintf('Average temp\t%.2f C\n', avg_temp);
fprintf('Data logging terminated\n');
%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]

% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here