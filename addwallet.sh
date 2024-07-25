#!/bin/bash

read -p "Wallet Name: " walletname

output=$(0gchaind keys add $walletname --eth)
address=$(echo "$output" | awk -F ': ' '/address/ {print $2}')
mnemonic=$(echo "$output" | awk '/It is the only way/ {for (i=6; i<=NF; i++) printf "%s ", $i}')

privatekey=$(0gchaind keys unsafe-export-eth-key $walletname)

publickey=$(0gchaind debug addr $(0gchaind keys show $walletname -a) | grep 'Address (hex):' | awk -F ': ' '{print "0x" $2}')

echo "address: $address"
echo "mnemonic: $mnemonic"
echo "privatekey: $privatekey"
echo "publickey: $publickey"
