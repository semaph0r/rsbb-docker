#!/bin/bash

set -i

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/refbox/catkin_ws/devel/setup.bash"

exec "$@"
