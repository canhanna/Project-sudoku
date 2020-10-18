clear all
close all
clc

%T?o m?t GUI window
% window = figure('position', [0 0 400 500],...
%         'unit', 'pixels',...
%         'name', 'Sudoku Solver',...
%         'visible', 'on');
% movegui(window, 'center');

fileID1 = fopen('input.txt','r');

while true
    line = fgetl(fileID1);
    if line == -1
        break;
    end
    disp(line);
end

fclose(fileID1);

fileID2 = fopen('output.txt','w');
arr = [ 4, 6 ,73, 90,20, 4,7,2,9];
for i = 1:length(arr)
    fprintf(fileID2, 'arr{%d} = %d \n', i, arr(i));
end

fprintf(fileID2, 'hello');
fclose(fileID2);


