#!/bin/bash

set -e

###########################################################################
# Copyright 2018 IoT.bzh
#
# author:Frédéric Marec <frederic.marec@iot.bzh>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###########################################################################

# Init list

list="acceleration gyroscope compass"

# Configure iio_dummy
modprobe industrialio
modprobe industrialio-configfs

if ! test -d "/sys/kernel/config"
then
    mount -t configfs none /sys/kernel/config
fi

modprobe industrialio-sw-device
modprobe industrialio-sw-trigger
modprobe iio-trig-hrtimer
modprobe iio_dummy


# create one iio_dummy
for device in $list 
do
    if ! test -d "/sys/kernel/config/iio/triggers/hrtimer/instance_$device"
    then 
        mkdir -p "/sys/kernel/config/iio/triggers/hrtimer/instance_$device"
    else 
        echo "instance_$device was already created"
    fi

    if ! test -d "/sys/kernel/config/iio/devices/dummy/16-001d"
    then
        mkdir -p "/sys/kernel/config/iio/devices/dummy/16-001d"
    else
        echo "$device was already created"
    fi

    if ! test -d "/sys/kernel/config/iio/devices/dummy/16-006b"
    then
        mkdir -p "/sys/kernel/config/iio/devices/dummy/16-006b"
    else
        echo "$device was already created"
    fi
done