# rosneuro_matlab

The package provides the Matlab build for the rosneuro messages along with a generic interface for processing them in Matlab.

## Requirements

This package has been tested with the following configuration:

* **Ubuntu 20.04.02 LTS Focal Fossa, ROS Noetic, Matlab R2020b, python 2.7.**

The choice of Python 2.7 is required by the Matlab Ros toolbox, newer versions of python are only supported for ROS2.

## Usage

For the instructions on how to use the messages of the  rosneuro_msgs package in Matlab please refer to the readme file contained in the [msgs](https://github.com/rosneuro/rosneuro_matlab/tree/main/msgs) folder and for a detailed description of each message refer to [rosneuro_msgs](https://github.com/rosneuro/rosneuro_msgs). The processing script reads **NeuroFrame** messages published by the rosneuro acquisition module ([rosneuro_acquisition](https://github.com/rosneuro/rosneuro_acquisition/tree/factory-plugins)) and publishes **NeuroOutput** messages to the '/neuroprediction' topic. The **NeuroOutput** message is used to output the soft and hard predictions decoded from the raw eeg data.

Once the processing script is launched it will keep listening to the 'neurodata' topic as long as ROS is running (or the script is shut down), in order to test it we used the [rosneuro_acquisition](https://github.com/rosneuro/rosneuro_acquisition/tree/factory-plugins) module to provide our script with data to process.

### Listened topics

* /neurodata ([rosneuro_msgs/NeuroFrame](https://github.com/rosneuro/rosneuro_msgs))

### Published topics

* /neuroprediction ([rosneuro_msgs/NeuroOutput](https://github.com/rosneuro/rosneuro_msgs))
