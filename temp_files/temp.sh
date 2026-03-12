b64="${attachment#data:application/pdf;base64,}"
b64="${b64%\"}"
b64="${b64//$'\r'/}"
printf '%s' "$b64" | base64 -d > out.pdf
