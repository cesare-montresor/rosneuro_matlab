%% Dummy processing
clearvars;

% TO BE ADD: Description of what the script does

%% Generic parameters
BufferSize = 512;
SelChannel = 2;

% Instantiation of the buffer class
buffer = RingBuffer(BufferSize);

% Parameters used to check the messages upon arrival
global NewMsg;
global MsgData;
NewMsg = false;

%% Initialization of ros tools
rosinit;
Rate = rosrate(256);
publisher   = rospublisher('/neuroprediction','rosneuro_msgs/NeuroOutput');
subscriber  = rossubscriber('/neurodata', 'rosneuro_msgs/NeuroFrame', @on_received_data, "BufferSize", 1);
neuromsg    = rosmessage('rosneuro_msgs/NeuroOutput');
neuro_float = rosmessage('rosneuro_msgs/NeuroDataFloat');

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
    
    % Add the new message to the ring buffer
    add(buffer, transpose(MsgData));
    
	% If the buffer is not full keep waiting
	if(not(buffer.isFull()))
        disp('The buffer is not full.');
        continue
	end
    
	%% Start the data processing
 
	% Take the data from the buffer
	data   = buffer.buffer;
    dvec   = abs(data(:,SelChannel));
    maxval = max(dvec);
    output = mean(dvec / maxval);
    
    % Create the message
    neuromsg.Header.Stamp = rostime('now');
    neuro_float.Data      = [output, 1-output];
    neuromsg.Softpredict  = neuro_float;
    
    % Publish the message
    send(publisher, neuromsg);
    
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

    MsgData = reshape(msg.Eeg.Data, [msg.Eeg.Info.Nchannels, msg.Eeg.Info.Nsamples]);
    NewMsg = true;
end
