# Phoenix
A Z80 assembly source code, derived from 'https://computerarcheology.com/Arcade/Phoenix/Code.html'.

This code refers to the "maincpu" section of the ROM region from the ROM set: Phoenix (Amstar, set 1).

The primary purpose of this source code is for testing and reverse engineering with MAME.

The game's executable code and data are defined at their original offsets.
The unused code and data are skipped and are not part of this project.

Usage: uz80as.exe -x Phoenix.asm

The obj file represents the bin code for the maincpu.

Split the resulting obj file into 8 parts with size 2048.

Name it: ic45, ic46, ic47, ic48, h5-ic49.5a, h6-ic50.6a, h7-ic51.7a, h8-ic52.8a.

See: https://mame.spludlow.co.uk/Machine.aspx?name=phoenix

Copy to a folder named 'phoenix', together with the rest of the needed eprom files.

Zip that folder, copy the zip file to: 'mame\roms' and start at debug mode. (Ignore the wrong CRC).
