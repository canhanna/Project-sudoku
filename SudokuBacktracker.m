function [ A ] = SudokuBacktracker( A, x, y )
if y == 10
   if x == 9
        return
   else
       A = SudokuBacktracker( A, x + 1, 1);
   end
elseif A(x, y) == 0
    for k = 1:9
        if ConflictTest( A, x, y, k ) == 1
            A(x, y) = k;
            A = SudokuBacktracker( A, x, y + 1);
            if all(A(:) > 0)
                return
            end
            A(x, y) = 0;
        end
    end
else
    A = SudokuBacktracker( A, x, y + 1);
end


    

end

function [ flag ] = ConflictTest( A,row_i,col_j, x )
flag = 0;
A(row_i, col_j) = x;
%% Column test
demcol = zeros(9, 1);
for ii = 1:9
   if A(ii, col_j) ~= 0
       demcol(A(ii, col_j), 1) = demcol(A(ii, col_j), 1) + 1;
       if demcol(A(ii, col_j), 1) > 1
           return
       end
   end
end

%% Row test
demrow = zeros(1, 9);
for jj = 1:9
    if A(row_i,jj) ~= 0
        demrow(1, A(row_i,jj)) = demrow(1, A(row_i,jj)) + 1;
        if demrow(1, A(row_i,jj)) > 1
           return 
        end
    end
end
%% 3x3 grid tests
dem = zeros(1, 9);
modRow = mod(row_i-1,3);
modCol = mod(col_j-1,3);
row_l  = row_i - modRow;
col_l  = col_j - modCol;
for ii = row_l:row_l+2
    for jj = col_l:col_l+2
        if A(ii,jj) ~= 0
            dem(1, A(ii, jj)) = dem(1, A(ii, jj)) + 1;
           if dem(1, A(ii, jj)) > 1
              return 
           end
        end
    end
end
flag=1;

end
