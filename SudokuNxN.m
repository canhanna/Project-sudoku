clc
n = input('Nhap so n: ');
size = n * n;
A = zeros(size);
A_sol = SudokuBacktracker( A, 1, 1, size );
disp(A_sol)

function [ A ] = SudokuBacktracker( A, x, y, size )
if y == size + 1
   if x == size
        return
   else
       A = SudokuBacktracker( A, x + 1, 1, size);
   end
elseif A(x, y) == 0
    for k = 1:size
        if ConflictTest( A, x, y, k, sqrt(size) ) == 1
            A(x, y) = k;
            A = SudokuBacktracker( A, x, y + 1, size);
            if all(A(:) > 0)
                return
            end
            A(x, y) = 0;
        end
    end
else
    A = SudokuBacktracker( A, x, y + 1, size);
end


    

end

function [ flag ] = ConflictTest( A,row_i,col_j, x, n )
flag = 0;
size = n * n;
%% Column test
for ii = 1:size
   if ii~=row_i
      if A(ii,col_j) == x
          return
      end
   end
end

%% Row test
for jj = 1:size
    if jj~=col_j
        if A(row_i,jj) == x
           return 
        end
    end
end
%% 3x3 grid tests
modRow = mod(row_i-1,n);
modCol = mod(col_j-1,n);
row_l  = row_i - modRow;
col_l  = col_j - modCol;
for ii = row_l:row_l+n-1
    for jj = col_l:col_l+n-1
        if(ii~=row_i) || (jj~=col_j)
           if A(ii,jj) == x
              return 
           end
        end
    end
end
flag=1;

end
