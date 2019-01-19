#!/bin/bash

export MYROBOT_NAME="moveo_urdf"
rosrun collada_urdf urdf_to_collada "$MYROBOT_NAME".urdf "$MYROBOT_NAME".dae
export IKFAST_PRECISION="5"
cp "$MYROBOT_NAME".dae "$MYROBOT_NAME".backup.dae  # create a backup of your full precision dae.
rosrun moveit_kinematics round_collada_numbers.py "$MYROBOT_NAME".dae "$MYROBOT_NAME".dae "$IKFAST_PRECISION"
openrave.py --database inversekinematics --robot=moveo_urdf.xml --iktype=translationdirection5d --iktests=100 



