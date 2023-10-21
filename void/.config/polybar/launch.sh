#!/bin/bash

polybar-msg cmd quit
polybar beta 2>&1 | tee -a /tmp/beta.log & disown
