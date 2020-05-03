#!/bin/bash
rclone mount gdrive:/tmp /home/pavel/tmp &&
sleep 10 &&
mkdir -p /home/pavel/tmp/`date +%y-%m-%d` 
