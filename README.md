# NVIDIA DGX Spark Setup

Setup scripts for NVIDIA DGX Spark systems, served via GitHub Pages for a stable download URL.

## Available Scripts

| Script | Description |
|--------|-------------|
| [setup.sh](scripts/setup.sh) | Installs `cloudflared` on Ubuntu-based DGX Spark |

## Cloudflare Tunnel Setup

### What it does

The `setup.sh` script performs the following steps:

1. Adds the Cloudflare GPG signing key to `/usr/share/keyrings/`.
2. Registers the official Cloudflare apt repository.
3. Installs the `cloudflared` package.

### Prerequisites

- An NVIDIA DGX Spark running Ubuntu (or any Debian-based distro).
- `sudo` privileges.
- Internet access to reach `pkg.cloudflare.com`.

### Manual Install (review before running)

If you prefer to inspect the script first:

```bash
# 1. Download the script
curl -fsSL -o setup.sh \
  https://alvarorg14.github.io/nvidia-dgx-spark-setup/scripts/setup.sh

# 2. Review it
cat setup.sh

# 3. Make it executable and run
chmod +x setup.sh
./setup.sh
```

### Quick Install (one-liner)

SSH into your DGX Spark and run:

```bash
curl -fsSL https://alvarorg14.github.io/nvidia-dgx-spark-setup/scripts/setup.sh | bash
```

### After Installation

Once `cloudflared` is installed you can create a tunnel:

```bash
# Authenticate with your Cloudflare account
cloudflared tunnel login

# Create a new tunnel
cloudflared tunnel create my-dgx-spark

# Route traffic (replace with your hostname and tunnel ID)
cloudflared tunnel route dns my-dgx-spark my-dgx-spark.example.com

# Run the tunnel
cloudflared tunnel run my-dgx-spark
```

For full documentation see the [Cloudflare Tunnel docs](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/).

## Enabling GitHub Pages

To serve the scripts from a stable URL, GitHub Pages must be enabled on this repository:

1. Go to **Settings** > **Pages** in the GitHub repository.
2. Under **Source**, select **Deploy from a branch**.
3. Choose the **main** branch and **/ (root)** folder.
4. Click **Save**.

After a minute or two the site will be live at:

```
https://alvarorg14.github.io/nvidia-dgx-spark-setup/
```

## Adding New Scripts

1. Place new scripts in the `scripts/` directory.
2. Update the **Available Scripts** table above.
3. Push to `main` — GitHub Pages will automatically deploy.
