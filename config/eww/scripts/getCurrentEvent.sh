#!/usr/bin/env bash

gcalcli agenda "$(date '+%b %d %Y %H:%m')" "$(date -d "$date +1 hour" '+%b %d %Y %H:%m')" --details url --tsv