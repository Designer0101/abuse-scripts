#!/bin/bash

read -p "Walletname: " walletname

output=$(0gchaind keys add $walletname --eth)
address=$(echo "$output" | grep -o -E 'address: [a-zA-Z0-9]+' | awk -F ': ' '{print $2}')

privatekey=$(0gchaind keys unsafe-export-eth-key $walletname)

publickey=$(0gchaind debug addr $(0gchaind keys show $walletname -a) | grep 'Address (hex):' | awk -F ': ' '{print "0x" $2}')

echo "$address"
echo "$privatekey"
echo "$publickey"
