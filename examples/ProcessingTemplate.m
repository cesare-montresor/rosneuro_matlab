%% Template ROSNeuro processing node
clearvars;

%% Generic parameters

% Global variables to be also exploited inside the callback
global NewMsg;
global MsgData;

% Flag to acknoweldge new message received
NewMsg  = false;
MsgData = [];

%% Initialization of ros tools
rosinit;
Rate       = rosrate(256);
publisher  = rospublisher('/neuroprediction','rosneuro_msgs/NeuroOutput');
subscriber = rossubscriber('/neurodata', 'rosneuro_msgs/NeuroFrame', @on_received_data, "BufferSize", 1);

%% Main loop
% The loop runs as long as ros is running
while (true)
    
    waitfor(Rate);
    
    %% Generic code
    % Check if roscore is still running
    try 
        rosnode list;
	catch exp
        disp('Ros was shut down, exiting.');
        break;
    end
    
    % If no message is available, keep waiting
    if(NewMsg == false)
        continue;
    end
    
    %% Start the processing
   
    % ... code ...
    % ... code ...
    % ... code ...
    % ... code ...
    % ... code ...
    
    %% Reset the new message flag
    NewMsg = false;
end

%% Shutdown Matlab ROS interface
rosshutdown;

%% Callback on received data
% Callback function to be called each time a new message is received from the listener on the topic \neurodata
function on_received_data(~,msg)

global NewMsg;
global MsgData;
    
NewMsg  = true; 
MsgData = msg.Eeg.Data;

end
