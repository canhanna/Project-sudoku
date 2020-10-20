clc



A = randi([0, 9], 9);
for i = 1:9
    for j = 1:9
        if check(A, i, j) == 0
            A(i, j) = 0;
        end
    end
end
A

b = SudokuBacktracker( A, 1, 1 );

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




function [ flag ] = check( A,row_i,col_j )
flag = 0;
%% Column test
for ii = 1:9
   if ii~=row_i
      if A(ii,col_j) == A(row_i,col_j)
          return
      end
   end
end

%% Row test
for jj = 1:9
    if jj~=col_j
        if A(row_i,jj) == A(row_i,col_j)
           return 
        end
    end
end
%% 3x3 grid tests
modRow = mod(row_i-1,3);
modCol = mod(col_j-1,3);
row_l  = row_i - modRow;
col_l  = col_j - modCol;
for ii = row_l:row_l+2
    for jj = col_l:col_l+2
        if(ii~=row_i) || (jj~=col_j)
           if A(ii,jj) == A(row_i,col_j)
              return 
           end
        end
    end
end
flag=1;
end


function [ flag ] = ConflictTest( A,row_i,col_j, x )
flag = 0;
%% Column test
for ii = 1:9
   if ii~=row_i
      if A(ii,col_j) == x
          return
      end
   end
end

%% Row test
for jj = 1:9
    if jj~=col_j
        if A(row_i,jj) == x
           return 
        end
    end
end
%% 3x3 grid tests
modRow = mod(row_i-1,3);
modCol = mod(col_j-1,3);
row_l  = row_i - modRow;
col_l  = col_j - modCol;
for ii = row_l:row_l+2
    for jj = col_l:col_l+2
        if(ii~=row_i) || (jj~=col_j)
           if A(ii,jj) == x
              return 
           end
        end
    end
end
flag=1;

end