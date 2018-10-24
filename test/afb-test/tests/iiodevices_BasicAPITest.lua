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

-- Init ddevices

local devices = {"acceleration", "gyroscope", "compass"}

_AFT.setBeforeAll(function()
    if not os.execute("/bin/bash ".._AFT.bindingRootDir.."/var/beforeAll.sh") then
        print("Fail to create iio_dummy_device")
        return -1
    else
        return 0
    end
end)

_AFT.setAfterAll(function()
    if not os.execute("/bin/bash ".._AFT.bindingRootDir.."/var/afterAll.sh") then
        print("Fail to remove dummy devices")
        return -1
    else
        return 0
    end
end)

local testPrefix ="iiodevices_BasicAPITest_"

for _, device in pairs(devices)
do
    _AFT.describe(testPrefix.."receive-subscribe event", function()
        local timeout = 2000000
        local evt = "iiodevices/"..device.."0"
        _AFT.callVerb("iiodevices","subscribe",{event= device})
        _AFT.addEventToMonitor(evt)
        _AFT.assertEvtReceived(evt, timeout)
        _AFT.callVerb("iiodevices","unsubscribe",{event= device})
    end
    ,nil, nil)

    -- This tests the 'subscribe' verb of the iiodevices API without frequency
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe-without-frequency_"..device,"iiodevices","subscribe", {event = device, args = "xy"}, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event= device})
        end)

    -- This tests the 'subscribe' verb of the iiodevices API without frequency
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe-with-3-axes_"..device,"iiodevices","subscribe", {event = device, args = "xyz"}, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event= device})
        end)

    -- This tests the 'subscribe' verb of the iiodevices API with null frequency
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe-with-null-frequency_"..device,"iiodevices","subscribe", {event = device, args = "xy", frequency = 0 }, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event= device})
        end)

    -- This tests the 'subscribe' verb of the iiodevices API with high frequency
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe-with-100000000000-frequency_"..device,"iiodevices","subscribe", {event = device, args = "xy", frequency = 100000000000 }, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event= device})
        end)

    -- This tests the 'subscribe' verb of the iiodevices API with negative frequency
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe-with-negative-frequency_"..device,"iiodevices","subscribe", {event = device, args = "xy", frequency = -1 }, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event= device})
        end)

    -- This tests the 'subscribe' verb of the iiodevices API with floating frequency
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe-with-floating-frequency_"..device,"iiodevices","subscribe", {event = device, args = "xy", frequency = -3.141592654 }, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event= device})
        end)

    -- This tests the 'subscribe' verb of the iiodevices API
    _AFT.testVerbStatusSuccess(testPrefix.."subscribe_"..device,"iiodevices","subscribe",{event = device, args = "xy", frequency = 10 }, nil,
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event = device})
        end)

    -- This tests the 'unsubscribe' verb of the iiodevices API
    _AFT.testVerbStatusSuccess(testPrefix.."unsubscribe_"..device,"iiodevices","unsubscribe",{event = device},
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event = device, args = "xy"})
        end, nil)

    -- This tests the 'unsubscribe' verb of the iiodevices API when we are not actually subscribed to a device
    _AFT.testVerbStatusSuccess(testPrefix.."doubleUnsubscribe_"..device,"iiodevices","unsubscribe",{event = device},
        function()
            _AFT.callVerb("iiodevices","unsubscribe",{event = device})
        end,nil)

    -- This tests the 'unsubscribe' verb of the iiodevices API when unsubscribing from a non-existing device
    _AFT.testVerbStatusSuccess(testPrefix.."unsubscribeNonExistingdevice_"..device,"iiodevices","unsubscribe",{event = device})

    -- This tests the 'unsubscribe' verb of the iiodevices API when unsubscribing with null device
    _AFT.testVerbStatusError(testPrefix.."unsubscribe-with-null-event_"..device,"iiodevices","unsubscribe",{event = null})

    -- This tests the 'subscribe' verb of the iiodevices API when subscribing whith device
    _AFT.testVerbStatusError(testPrefix.."subscribe-with-null-event_"..device,"iiodevices","subscribe",{event = null})

    -- This tests the 'unsubscribe' verb of the iiodevices API when unsubscribing with null argument
    _AFT.testVerbStatusError(testPrefix.."unsubscribe-with-null-arg_"..device,"iiodevices","unsubscribe",{event = device, args = null})

    -- This tests the 'subscribe' verb of the iiodevices API when subscribing whith null argument
    _AFT.testVerbStatusError(testPrefix.."subscribe-with-null-arg_"..device,"iiodevices","subscribe",{event = device, args = null})

end

_AFT.exitAtEnd()
