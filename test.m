clc


A = importdata('data.txt');
for ii = 1:9
    for jj = 1:9
        if(A(ii,jj)~=0)
            if (ConflictTest(A,ii,jj) == 0)
                disp("Conflict!")
                return
            end
        end
    end
end
A_sol = SudokuBacktracker(A, 1, 1);
disp(A_sol);