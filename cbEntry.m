function [ output_args ] = cbEntry( src,event,h,ii,jj)


sudokugui = get(h,'UserData');

set(sudokugui.X(ii,jj), 'backgroundcolor',[0.2 0.7 0.7])
