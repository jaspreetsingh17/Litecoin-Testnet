#!/usr/bin/env bash
set -e

# Litecoin version
VERSION="0.21.4"
INSTALL_DIR="/usr/local/bin"
DATA_DIR="/data/litecoin"

echo "=== Installing Litecoin Core v$VERSION ==="

# Update and install dependencies
sudo apt update -y
sudo apt install -y wget tar

# Download Litecoin Core
cd /tmp
wget https://download.litecoin.org/litecoin-${VERSION}/linux/litecoin-${VERSION}-x86_64-linux-gnu.tar.gz

# Extract
tar -xvf litecoin-${VERSION}-x86_64-linux-gnu.tar.gz

# Install binaries
sudo install -m 0755 -o root -g root -t ${INSTALL_DIR} litecoin-${VERSION}/bin/*

# Create data directory
sudo mkdir -p ${DATA_DIR}
sudo chown -R $USER:$USER ${DATA_DIR}

# Create configuration file
cat <<EOF > ${DATA_DIR}/litecoin.conf
# Litecoin testnet configuration

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
EOF

# Start the Litecoin daemon with the custom data directory
echo "=== Starting Litecoin testnet node ==="
litecoind -datadir=${DATA_DIR} -daemon

# Wait a few seconds for it to start
sleep 5

# Check blockchain info
litecoin-cli -datadir=${DATA_DIR} getblockchaininfo

echo "=== Litecoin testnet node installed successfully! ==="
echo "Data directory: ${DATA_DIR}"
