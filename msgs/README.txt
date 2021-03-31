********************************************************************************
*																			   *
*					ROSNEURO MATLAB R2020b Message Installation                       *
*																			   *
********************************************************************************

1) Open Matlab

2) Add the location of the 'm' folder to the MATLAB path:
   >> addpath('$HOME/Desktop/rosneuro_matlab2020b_msgs/m')

3) Save the new path (alternatively, add the path to the 'm' folder each time you open Matlab:
   >>savepath
   
4) Refresh all message class definition:
   >> clear classes
   >> rehash toolboxcache

5) Check the presence of the ROSNEURO messages:
   >> rosmsg('show', 'rosneuro_msgs/NeuroFrame')

