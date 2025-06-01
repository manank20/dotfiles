#! /bin/bash
echo -en "{\"text\":\""
sensors | rg Core | awk '/^Core /{++r; gsub(/[^[:digit:]]+/, "", $3); s+=$3} END{PREC=2; printf "%.0f%s", s/(10*r), "°C"}' && echo -en "\"}"
