#!/bin/bash

read -p "Walletname: " walletname

output=$(0gchaind keys add $walletname --eth)
address=$(echo "$output" | grep -o -E 'address: [a-zA-Z0-9]+' | awk -F ': ' '{print $2}')
mnemonic_start=$(echo "$output" | awk '/It is the only way/ {print NR}')
mnemonic_end=$((mnemonic_start + 2))
mnemonic=$(echo "$output" | awk -v start=$mnemonic_start -v end=$mnemonic_end 'NR >= start && NR <= end {print $0}' | tr '\n' ' ')

privatekey=$(0gchaind keys unsafe-export-eth-key $walletname)

publickey=$(0gchaind debug addr $(0gchaind keys show $walletname -a) | grep 'Address (hex):' | awk -F ': ' '{print "0x" $2}')

echo "$address"
echo "$mnemonic"
echo "$privatekey"
echo "$publickey"
