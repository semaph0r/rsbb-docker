# Docker container for Refbox of European Robotics League

## Build status

[![Build Status](https://travis-ci.com/semaph0r/rsbb-docker.svg?branch=master)](https://travis-ci.com/semaph0r/rsbb-docker)

## Description

For running benchmarks and scoring, the organizers of the European robotics league (ERL) are using a referee box to
communicate with the robot and sending commands during benchmarking. This docker image decouples the host system from
the required Ubuntu OS.

## Prerequesites

To run this docker container please install the docker engine according to your running linux distribution.
The following commands are tested on Ubuntu 18.04 (Xenial):


## Usage
To start the actual refbox server within the docker container run the start script with:

```
./start.bash
```

If it can not be executed, change the execution bits with:

```
sudo chmod +x start.bash
```

