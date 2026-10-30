#!/bin/bash
# temperature=$(sensors | sed -n '21p' | cut -d '+' -f 2)
temperature=$(sensors | grep -i tctl | awk '{print $2}')
echo "{\"text\":\"$temperature\"}"
