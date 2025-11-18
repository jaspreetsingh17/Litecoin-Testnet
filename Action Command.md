Action	Command


Start node	litecoind -datadir=/data/litecoin -daemon
Stop node	litecoin-cli -datadir=/data/litecoin stop
Check sync	litecoin-cli -datadir=/data/litecoin getblockchaininfo
Show block height	litecoin-cli -datadir=/data/litecoin getblockcount
Show peers	litecoin-cli -datadir=/data/litecoin getpeerinfo
Tail logs	tail -f /data/litecoin/testnet4/debug.log



system file

#/etc/systemd/system/litecoin.service

[Unit]
Description=Litecoin Testnet Node
After=network.target

[Service]
ExecStart=/usr/local/bin/litecoind -datadir=/data/litecoin
ExecStop=/usr/local/bin/litecoin-cli -datadir=/data/litecoin stop
User=litecoin
Group=litecoin
Type=forking
Restart=always
TimeoutStopSec=30s

[Install]
WantedBy=multi-user.target



To auto start if it stops

sudo systemctl daemon-reload
sudo systemctl enable litecoin
sudo systemctl start litecoin
sudo systemctl status litecoin


