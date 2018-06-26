# IIODEVICES Service

## Overview

The iiodevices service provides access to data from industrial i/o devices.
For now it permits to get data from acceleration, gyroscope and electronic compass.

## General Scheme

As soon as a client subscribes to the agl-service-iiodevices binding,
the binding reads values from the sensors and sends it to subscribers as events.
Subscribers can choose their frequency and indicate what values they want at
subscription.

## Verbs

| Name               | Description                                 | JSON Parameters                                                   |
|:-------------------|:--------------------------------------------|:---------------------------------------------------------------   |
| subscribe          | subscribe to 9 axis events                  | *Request:* {"event": "accel", "args":"xy", "frequency": "10" }|
| unsubscribe        | unsubscribe to accelero events              | *Request:* {"event": "accel" } |

## Events

For now, there are 3 different events matching with the different available sensors.

* "accel": is for acceleration data
* "magn": is for gyroscope data
* "anglvel": is for electronic compass data

## Frequency

The frequency is in Hertz, if the frequency is not set, events are triggered via a file descriptor.

## Remaining issues

- Provide a json config file so that it configures the device name and the channel name.
- Handle several values simultaneously, see triggers.
- Update it to other iiodevices.
- only read channel values at the maximum frequency.

## M3ULCB Kingfisher

M3ULCB Kingfisher is equipped with a 9 axis sensor device (LSM9DS0) and the R-Car Starter
Kit can read sensor values via I2C interface and iiodevices are provided for
these sensors.
