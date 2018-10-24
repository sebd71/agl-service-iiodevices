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

local devices = {"acceleration", "gyroscope", "compass"}
local testPrefix ="iiodevices_BasicAPITest_without_devices_"

for _, device in pairs(devices)
do
  -- This tests the 'subscribe' verb of the iiodevices API without any devices
  _AFT.testVerbStatusError(testPrefix.."subscribe-"..device,"iiodevices","subscribe", {event = device, args = "xy"})

  _AFT.testVerbStatusError(testPrefix.."subscribe-"..device.."-with-tree-axes","iiodevices","subscribe", {event = device, args = "abc"})

  _AFT.testVerbStatusError(testPrefix.."subscribe-"..device.."-with-wrong-argument","iiodevices","subscribe", {event = device, aaaaaaaaaaaaaaaaaaaaa = "xy"})

  _AFT.testVerbStatusSuccess(testPrefix.."subscribe-"..device.."-replace-argument","iiodevices","subscribe", {event = device, args = "xy", wrongarg = "test"})

  _AFT.testVerbStatusError(testPrefix.."subscribe-"..device.."-edge-effect","iiodevices","subscribe", {event = device, args = "xy"})


  -- This tests the 'unsubscribe' verb of the iiodevices API without any devices
  _AFT.testVerbStatusError(testPrefix.."unsubscribe-"..device.."","iiodevices","unsubscribe", {event = device})

  _AFT.testVerbStatusError(testPrefix.."unsubscribe-"..device.."-with-wrong-argument","iiodevices","unsubscribe", {event = device, aaaaaaaaaaaaaaaaaaaaa = "xy"})

  _AFT.testVerbStatusError(testPrefix.."unsubscribe-"..device.."-with-too-many-argument","iiodevices","unsubscribe", {event = device, args = "xy", wrongarg = "test"})

  _AFT.testVerbStatusError(testPrefix.."unsubscribe-"..device.."-edge-effect","iiodevices","unsubscribe", {event = device})
end

_AFT.exitAtEnd()
