#!/bin/bash
# Answer 1: Use built-in commands and don't care about place. 
grep '"symbol": "TSLA"' transaction-log.txt | grep '"side": "sell"' | \
grep -E '("symbol": "TSLA".*"side": "sell")|("side": "sell".*"symbol": "TSLA")' transaction-log.txt | \
awk -F'"order_id": "' '{print $2}' | cut -d '"' -f1 | xargs -I {} curl -s "https://example.com/api/{}" >> ./output.txt

# Answer 2: Use jq, this command must be installed before. (not built-in command)
jq -r 'select(.symbol=="TSLA" and .side=="sell") | .order_id' ./transaction-log.txt | xargs -I {} curl -s "https://example.com/api/{}" >> ./output.txt
