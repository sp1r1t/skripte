#!/bin/bash

sudo journalctl -n 1000 | grep -v -e 'Logs begin' -e 'sudo' -e 'wl_cfg80211_get_tx_power : error' -e 'wl_dev_intvar_get : error'| sed 's/^[a-zA-Z]* [0-9]* ..:..:.. spiritguide //' | tail -n 5
