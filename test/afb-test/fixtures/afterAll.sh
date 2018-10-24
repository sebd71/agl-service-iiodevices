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

#set SUDO variable
SUDO=$(command -v sudo)

# delete dummy devices
if test -d "/sys/kernel/config/iio/devices/dummy/16-001d"
then
    "${SUDO}" rm -rf "/sys/kernel/config/iio/devices/dummy/16-001d"
else
    echo "devices 16-001d didn't exist"
fi

if test -d "/sys/kernel/config/iio/devices/dummy/16-006b"
then
    "${SUDO}" rm -rf "/sys/kernel/config/iio/devices/dummy/16-006b"
else
    echo "devices 16-006b didn't exist"
fi