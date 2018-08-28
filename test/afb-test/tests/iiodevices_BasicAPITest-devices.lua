--[[
   Copyright (C) 2018 "IoT.bzh"
   Author Frédéric Marec <frederic.marec@iot.bzh>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.


   NOTE: strict mode: every global variables should be prefixed by '_'
--]]

local testPrefix ="iiodevices_BasicAPITest_without_devices_"

-- This tests the 'subscribe' verb of the iiodevices API without any devices
_AFT.testVerbStatusError(testPrefix.."subscribe-acceleration","iiodevices","subscribe", {event = "acceleration", args = "xy"})
_AFT.testVerbStatusError(testPrefix.."subscribe-compass","iiodevices","subscribe", {event = "compass", args = "xy"})
_AFT.testVerbStatusError(testPrefix.."subscribe-gyroscope","iiodevices","subscribe", {event = "gyroscope", args = "xy"})

_AFT.testVerbStatusError(testPrefix.."subscribe-acceleration-with-wrong-argument","iiodevices","subscribe", {event = "acceleration", aaaaaaaaaaaaaaaaaaaaa = "xy"})
_AFT.testVerbStatusError(testPrefix.."subscribe-compass-with-wrong-argument","iiodevices","subscribe", {event = "compass", bbbbbbbbbbbbbbbb = "xy"})
_AFT.testVerbStatusError(testPrefix.."subscribe-gyroscope-with-wrong-argument","iiodevices","subscribe", {event = "gyroscope", cccccccccccccccccc = "xy"})

_AFT.testVerbStatusError(testPrefix.."subscribe-acceleration-replace-argument","iiodevices","subscribe", {event = "acceleration", args = "xy", wrongarg = "test"})
_AFT.testVerbStatusError(testPrefix.."subscribe-compass-replace-argument","iiodevices","subscribe", {event = "compass", args = "xy", wrongarg = "test"})
_AFT.testVerbStatusError(testPrefix.."subscribe-gyroscope-replace-argument","iiodevices","subscribe", {event = "gyroscope", args = "xy", wrongarg = "test"})

_AFT.testVerbStatusError(testPrefix.."subscribe-acceleration-edge-effect","iiodevices","subscribe", {event = "acceleration", args = "xy"})
_AFT.testVerbStatusError(testPrefix.."subscribe-compass-edge-effect","iiodevices","subscribe", {event = "compass", args = "xy"})
_AFT.testVerbStatusError(testPrefix.."subscribe-gyroscope-edge-effect","iiodevices","subscribe", {event = "gyroscope", args = "xy"})

-- This tests the 'unsubscribe' verb of the iiodevices API without any devices
_AFT.testVerbStatusError(testPrefix.."unsubscribe-acceleration","iiodevices","unsubscribe", {event = "acceleration"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-compass","iiodevices","unsubscribe", {event = "compass"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-gyroscope","iiodevices","unsubscribe", {event = "gyroscope"})

_AFT.testVerbStatusError(testPrefix.."unsubscribe-acceleration-with-wrong-argument","iiodevices","unsubscribe", {event = "acceleration", aaaaaaaaaaaaaaaaaaaaa = "xy"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-compass-with-wrong-argument","iiodevices","unsubscribe", {event = "compass", bbbbbbbbbbbbbbbb = "xy"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-gyroscope-with-wrong-argument","iiodevices","unsubscribe", {event = "gyroscope", cccccccccccccccccc = "xy"})

_AFT.testVerbStatusError(testPrefix.."unsubscribe-acceleration-with-too-many-argument","iiodevices","unsubscribe", {event = "acceleration", args = "xy", wrongarg = "test"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-compass-with-too-many-argument","iiodevices","unsubscribe", {event = "compass", args = "xy", wrongarg = "test"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-gyroscope-with-too-many-argument","iiodevices","unsubscribe", {event = "gyroscope", args = "xy", wrongarg = "test"})

_AFT.testVerbStatusError(testPrefix.."unsubscribe-acceleration-edge-effect","iiodevices","unsubscribe", {event = "acceleration"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-compass-edge-effect","iiodevices","unsubscribe", {event = "compass"})
_AFT.testVerbStatusError(testPrefix.."unsubscribe-gyroscope-edge-effect","iiodevices","unsubscribe", {event = "gyroscope"})

_AFT.exitAtEnd()
