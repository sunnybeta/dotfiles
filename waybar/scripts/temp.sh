#!/bin/bash
temperature=$(sensors | sed -n '3p' | cut -d '+' -f 2)
echo "{\"text\":\"$temperature\"}"
