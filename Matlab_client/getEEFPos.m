%% This function is used to get the endeffector position and orientation of the KUKA iiwa 7 R 800.
function [ Pos ] = getEEFPos( t )
% This function is used to get the endeffector positions of the KUKA iiwa 7 R 800.
% t: is the TCP/IP connection
% Pos: is 1x6 cell array, of the linear and angular positions of the end
% effector, the first three elements are the X,Y and Z positions unit (mm) and the
% last three elements are the alpha, beta and gama angels of the end
% effector (orientation unit radians)
% Copy right, Mohammad SAFEEA, 3rd of May 2017

theCommand='Eef_pos';
fprintf(t, theCommand);
message=fgets(t);
%disp(message)
[Pos,N]=getDoubleFromString(message);

end

function [jPos,j]=getDoubleFromString(message)
n=max(max(size(message)));
j=0;
numString=[];
for i=1:n
    if message(i)=='_'
        j=j+1;
        jPos{j}=str2num(numString);
        numString=[];
    else
        numString=[numString,message(i)];
    end
end
end

