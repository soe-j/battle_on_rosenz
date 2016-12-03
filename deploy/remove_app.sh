#!/bin/bash

kill -QUIT `(cat /service/battle_on_rosenz/tmp/pids/puma.pid)`
rm -rf /service/battle_on_rosenz
