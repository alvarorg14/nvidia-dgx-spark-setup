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

1. Download the script:

```bash
curl -fsSL -o setup.sh https://alvarorg14.github.io/nvidia-dgx-spark-setup/scripts/setup.sh
```

2. Make it executable

```bash
chmod +x setup.sh
```

3. Run it
```bash
./setup.sh
```

### Quick Install (one-liner)

SSH into your DGX Spark and run:

```bash
curl -fsSL https://alvarorg14.github.io/nvidia-dgx-spark-setup/scripts/setup.sh | bash
```

### After Installation

Once `cloudflared` is installed, connect it to an existing tunnel from your Cloudflare Zero Trust dashboard.

1. Get your tunnel token from the [Cloudflare Zero Trust dashboard](https://one.dash.cloudflare.com/):
   - Go to **Networks** > **Tunnels**.
   - Select your tunnel (or create a new one).
   - Click **Configure** and copy the tunnel token.

2. Install the tunnel as a system service on your DGX Spark:

```bash
sudo cloudflared service install <TOKEN>
```

Replace `<TOKEN>` with the token copied from the dashboard.

> **Note:** The token is a sensitive value. Avoid storing it in scripts or version control. If you need to automate this step, pass it via an environment variable:
>
> ```bash
> sudo cloudflared service install "$CLOUDFLARE_TUNNEL_TOKEN"
> ```

3. Verify the service is running:

```bash
sudo systemctl status cloudflared
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


```bash
ps aux | grep -E 'apt|dpkg'
```

```bash
sudo kill -9 PID
```

```bash
sudo apt -f install
```

```bash
sudo apt-get update
```

```bash
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y cloudflared
```


