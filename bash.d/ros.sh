ros_setup_file="$HOME/ros/setup.bash"
if [ -f $ros_setup_file ]; then
  echo "exists"
  #export ROS_OS_OVERRIDE=osxbrew:lion
  #export ROS_NO_SUDO_PIP=True
  source "$ros_setup_file"
fi
