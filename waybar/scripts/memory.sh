#!/bin/bash
mem=$(df -h | grep n1p3 | cut -d ' ' -f 8)
echo "{\"text\":\"$mem\"}"
