if ps -p $(pidof waybar) > /dev/null 2>&1
then
	kill $(pidof waybar)
else
	waybar &
fi
