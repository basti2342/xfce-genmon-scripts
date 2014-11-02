#!/bin/bash

oldValue=$(xfconf-query -c xfce4-panel -p /plugins/plugin-31/include-all-monitors)

if [[ "$oldValue" == "true" ]]; then
	val="false"
else
	val="true"
fi

xfconf-query -c xfce4-panel -p /plugins/plugin-31/include-all-monitors -s $val

