#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Cloudflare Tunnel (cloudflared) on NVIDIA DGX Spark..."

echo "==> Adding Cloudflare GPG key..."
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-public-v2.gpg \
  | sudo tee /usr/share/keyrings/cloudflare-public-v2.gpg >/dev/null

echo "==> Adding Cloudflare apt repository..."
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-public-v2.gpg] https://pkg.cloudflare.com/cloudflared any main' \
  | sudo tee /etc/apt/sources.list.d/cloudflared.list

echo "==> Installing cloudflared..."
sudo apt-get update && sudo apt-get install -y cloudflared

echo "==> cloudflared installed successfully!"
cloudflared --version
