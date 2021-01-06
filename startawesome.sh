#!/usr/bin/env bash
cd ~jeff
export DISPLAY="$(ip route get 8.8.8.8 | head -n 1 | cut -d ' ' -f 3 | awk '{print $1}'):0.0"
export LIBGL_ALWAYS_INDIRECT=1
awesome
