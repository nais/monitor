#!/usr/bin/env bash
killall chromium-browser
DISPLAY:0.0 /usr/bin/chromium-browser --ignore-certificate-errors --no-first-run --disable-web-resources --disable-sync --disable-prompt-on-repost --disable-default-apps --disable-background-networking --app="https://grafana.adeo.no/d/cZBgeYVmz/nais-prod-fss-single-page-cluster-dashboard?refresh=30s&orgId=1&kiosk"
