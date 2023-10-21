#       _       _ _            
# __  _(_)_ __ (_) |_ _ __ ___ 
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__ 
# /_/\_\_|_| |_|_|\__|_|  \___|
#                              

# Root Name Display
xsetroot -name "☃"

# Hide Mouse Pointer
unclutter -root -idle 3 &

# # Set Wallpaper
feh --no-fehbg --bg-scale $XDG_CONFIG_HOME/wallpaper
 
# Restore AlsaMixer Settings
alsactl --file $XDG_CONFIG_HOME/alsa/asound.state restore

# Load X Resources
xrdb -load $XDG_CONFIG_HOME/x11/xresources

# Start X
exec $WM > /dev/null 2>&1
