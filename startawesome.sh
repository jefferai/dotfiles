#!/usr/bin/env bash
cd ~jeff
export DISPLAY="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0"
export LIBGL_ALWAYS_INDIRECT=1
awesome
