# abuse-scripts
 
bash <(curl -s https://raw.githubusercontent.com/Designer0101/abuse-scripts/main/0g-install.sh)

0gchaind status | jq '{ latest_block_height: .sync_info.latest_block_height, catching_up: .sync_info.catching_up }'

0gchaind keys add wallet --eth
0gchaind keys unsafe-export-eth-key wallet
0gchaind debug addr $(0gchaind keys show wallet -a) | grep 'Address (hex):' | awk -F ': ' '{print "0x" $2}'

0gchaind q bank balances $(0gchaind keys show wallet -a)
