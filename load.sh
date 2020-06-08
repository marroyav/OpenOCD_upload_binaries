#!/bin/bash

openocd -f digilent_nexys_video.cfg -c "init;xc7_program xc7.tap;pld load 0 top.bit;"
