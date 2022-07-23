#! /bin/bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway

systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr

systemctl --user start pipewire-media-session

systemctl --user start xdg-desktop-portal.service
