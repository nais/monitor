#!/usr/bin/env bash
killall chromium-browser
DISPLAY=:0.0 /usr/bin/chromium-browser --ignore-certificate-errors --no-first-run --disable-web-resources --disable-sync --disable-prompt-on-repost --disable-default-apps --disable-background-networking --app="https://nais.io/monitor?hostname=${hostname}"
