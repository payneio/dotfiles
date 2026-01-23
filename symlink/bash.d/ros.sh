#!/bin/bash

ros_setup_file="$HOME/ros/setup.bash"
if [ -f "$ros_setup_file" ]; then
  source "$ros_setup_file"
  echo "ROS ready."
fi
