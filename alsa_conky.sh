#!/bin/bash
amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "muted" } else { printf sprintf($2)}}'
