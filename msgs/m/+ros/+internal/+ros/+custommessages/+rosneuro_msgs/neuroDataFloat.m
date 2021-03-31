function [data, info] = neuroDataFloat
%NeuroDataFloat gives an empty data for rosneuro_msgs/NeuroDataFloat
% Copyright 2019-2020 The MathWorks, Inc.
data = struct();
[data.info, info.info] = ros.internal.ros.custommessages.rosneuro_msgs.neuroDataInfo;
info.info.MLdataType = 'struct';
[data.data, info.data] = ros.internal.ros.messages.ros.default_type('single',NaN);
info.MessageType = 'rosneuro_msgs/NeuroDataFloat';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,11);
info.MatPath{1} = 'info';
info.MatPath{2} = 'info.nsamples';
info.MatPath{3} = 'info.nchannels';
info.MatPath{4} = 'info.stride';
info.MatPath{5} = 'info.unit';
info.MatPath{6} = 'info.transducter';
info.MatPath{7} = 'info.prefiltering';
info.MatPath{8} = 'info.isint';
info.MatPath{9} = 'info.minmax';
info.MatPath{10} = 'info.labels';
info.MatPath{11} = 'data';
