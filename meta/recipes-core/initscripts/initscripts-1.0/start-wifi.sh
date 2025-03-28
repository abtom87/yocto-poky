ifconfig wlan0 up
iw wlan0 scan
wpa_supplicant -B -i wlan0 -D wext -c /etc/wpa_supplicant.conf
