# Teensy

Class for MATLAB that allows communication with a Teensy microcontroller

# Instructions

The Teensy.m file must be included on the same path (i.e. in the same folder) as any script requiring the enclosed functions.

Initialize a Teensy object using Teensy(name, baud, auto), where the properties 'name' and 'baud' refer to the name and baud rate of the Teensy's serial port. The 'auto' property should not generally be provided:

    e.g. t = Teensy('COM1', 9600);

Note that depending on the serial port allocated to the Teensy, 'COM1' may need to be substituted for 'COM2', 'COM3', etc. Commands are sent to the Teensy using commandTeensy(Teensy, command, value):

    e.g. commandTeensy(t, 'angle', 360);

The following commands are available:

  angle, with value from 0 to 360 in degrees)
  speed, with values from 0 to 100 in percent)
  direction, with value 0 or 1 representing 'clockwise' and 'counterclockwise'
  continuous, with value 0 or 1 representing 'true' and 'false'
  rotate, with value 0 or 1 representing 'true' and 'false'

The stepper motor will not move until a rotate command is sent:

    e.g. commandTeensy(t, 'rotate', 1);

The rotate command can be sent as many times as required after configuring a rotation.
