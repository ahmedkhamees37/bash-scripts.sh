#!/bin/
SERVICE=nginx
if ! systemctl is-active --quiet $SERVICE; then
systemctl restart $SERVICE
echo "$SERVICE was down and has been restarted."
else
echo "$SERVICE is running."
fi
