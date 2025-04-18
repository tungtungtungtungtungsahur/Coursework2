% Pengwei Huang
% ssyph2@nottingham.edu.cn
%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]



%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear, clc

a = arduino;
T_c = 0.01;
V_0 = 0.5;
duration = 600;
time = 1:duration;
temp = zeros(1, duration);

figure; %Plot Temperature time variation figure
h = plot(time, temp);
xlabel('Time(s)');
ylabel('Temperature(Celsius degree)');
title('Temperature Time Variation Table');
xlim([1 duration]);
ylim([0 50]); 

fileID = fopen('cabin_temperature.txt', 'w'); % Creat a file

disp('Data logging initiated - 5/3/2024')
disp('Location-Nottingham')

for i = 1:length(temp)
    A0_voltage = readVoltage(a, 'A0');
    temp(i) = (A0_voltage - 0.5) / 0.01;
    
  
    set(h, 'YData', temp);
    drawnow;
    
    if mod(i, 60) == 0
        fprintf('Minute\t%d\n', i/60);
        fprintf('Temperature\t%.2f C\n\n', temp(i));
        fprintf(fileID, 'Minute\t%d\n', i/60);
        fprintf(fileID, 'Temperature\t%.2f C\n\n', temp(i));
    end
    
    pause(1);
end

min_temp = min(temp);
max_temp = max(temp);
avg_temp = mean(temp);

fprintf('Max temp\t%.2f C\n', max_temp);
fprintf('Min temp\t%.2f C\n', min_temp);
fprintf('Average temp\t%.2f C\n', avg_temp);
fprintf('Data logging terminated\n');

fprintf(fileID, 'Max temp\t%.2f C\n', max_temp);
fprintf(fileID, 'Min temp\t%.2f C\n', min_temp);
fprintf(fileID, 'Average temp\t%.2f C\n', avg_temp);
fprintf(fileID, 'Data logging terminated\n');
fclose(fileID); %Close file
%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
a=arduino;
temp_monitor(a);
%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here
