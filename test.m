clc


A = importdata('data.txt');
A_sol = SudokuBacktracker(A, 1, 1);
disp(A_sol);