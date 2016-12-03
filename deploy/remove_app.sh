#!/bin/bash

kill -QUIT `(cat /service/battle_on_rosenz/tmp/pids/server.pid)`
rm -rf /service/battle_on_rosenz
