%% Example
% An example script, it is used to show how to use the different
% functions of the KUKA Sunrise matlab toolbox
% First start the server on the KUKA iiwa controller
% Then run the following script in Matlab

% Mohammad SAFEEA, 3rd of May 2017

close all;clear all;clc

ip='172.31.1.147'; % The IP of the controller
% start a connection with the server
t=net_establishConnection( ip );

if ~exist('t','var') || isempty(t)
  warning('Connection could not be establised, script aborted');
  return;
else
   
%% Move to some initial position
    pinit={0,pi*20/180,0,-pi*70/180,0,pi*90/180,0}; % joints angles of initial confuguration
    relVel=0.15; % relative velocity
    movePTPJointSpace( t , pinit, relVel); % point to point motion in joint space

%% Point to point motion in joint space

      homePos={};
      [ jPos ] = getJointsPos( t ); % get current joints position
    
      fprintf('\nCurrent joints positions of robot are \n')
      jPos
      
           
      for ttt=1:7  % home position
          homePos{ttt}=0;
      end
      
      pause(0.1)
      relVel=0.15;
      movePTPJointSpace( t , homePos, relVel); % go to home position
      pause(0.1)
      movePTPJointSpace( t , jPos, relVel); % return back to original position
      
      %% turn off the server
       net_turnOffServer( t );


       fclose(t);
end

