FROM osrf/ros:indigo-desktop-trusty

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-indigo-desktop-full=1.1.6-0* \
    && rm -rf /var/lib/apt/lists/*

# install rsbb dependencies
RUN apt-get update && apt-get install -q -y \
    build-essential \
    cmake \
    libboost-all-dev \
    libprotoc-dev \
    protobuf-compiler \
    libssl-dev \
    ros-$ROS_DISTRO-map-server

RUN easy_install python-Levenshtein

# setup catkin workspace

RUN mkdir -p /catkin_ws/src

WORKDIR /catkin_ws

RUN /bin/bash -c "source /opt/ros/indigo/setup.bash; \
catkin_make"

# download and build rsbb
WORKDIR /refbox/catkin_ws/src

RUN git clone https://github.com/rockin-robot-challenge/rsbb.git

RUN cd rsbb/ && git pull && git submodule update --init

WORKDIR /refbox/catkin_ws/

RUN /bin/bash -c "source /opt/ros/indigo/setup.bash; \
catkin_make; \
source $(pwd)/devel/setup.bash;\
roslaunch rsbb_etc rsbb.launch"

