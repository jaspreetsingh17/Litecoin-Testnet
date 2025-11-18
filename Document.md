wget https://download.litecoin.org/litecoin-0.21.4/linux/litecoin-0.21.4-x86_64-linux-gnu.tar.gz
tar -xvf litecoin-0.21.4-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin litecoin-0.21.4/bin/*

mkdir -p ~/.litecoin
nano ~/.litecoin/litecoin.conf



# Litecoin testnet configuration file

# Global settings
server=1
daemon=1
txindex=1
listen=1
maxconnections=40

# Enable testnet
testnet=1

# Network-specific settings
[test]
port=19335
rpcport=19332
rpcbind=127.0.0.1
rpcuser=litecoinrpc
rpcpassword=strongpassword123

# Testnet peers
addnode=testnet-seed.litecointools.com
addnode=dnsseed-testnet.thrasher.io
addnode=seed-b.litecoin.loshan.co.uk
addnode=testnet-seed.litecoinspace.org
addnode=testnet.ltc.xurious.com
addnode=testnet.litecoinpool.org


litecoind -daemon

litecoin-cli getblockchaininfo

