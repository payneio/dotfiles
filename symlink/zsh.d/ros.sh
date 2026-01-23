#!/bin/zsh

ros_setup_file="$HOME/ros/setup.zsh"
if [ -f "$ros_setup_file" ]; then
  source "$ros_setup_file"
  echo "ROS ready."
fi
