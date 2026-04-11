#!/bin/bash
# =============================================================================
# install-awscli.sh - Install AWS Command Line Interface v2 on Ubuntu
# =============================================================================
# Source: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# =============================================================================

# --- Check 1: Must be run as root ---
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root."
    echo "Please run again with: sudo $0"
    exit 1
fi

# --- Check 2: apt package manager must be available ---
if ! command -v apt &>/dev/null; then
    echo "ERROR: This script requires the 'apt' package manager."
    echo "This system does not appear to use apt."
    exit 1
fi

# --- Inform user and ask for confirmation ---
echo "============================================"
echo "  AWS CLI v2 Installer"
echo "============================================"
echo ""
echo "This script will install the following:"
echo "  - curl        (dependency, via apt)"
echo "  - unzip       (dependency, via apt)"
echo "  - AWS CLI v2  (from https://awscli.amazonaws.com)"
echo ""
read -p "Do you want to proceed? [y/n] " answer
if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi

# --- Check 3: Name conflict - is 'aws' already a command? ---
if command -v aws &>/dev/null; then
    echo "ERROR: The command 'aws' already exists at: $(which aws)"
    echo "Installation aborted to avoid a name conflict."
    exit 1
fi

# --- Silently install dependencies ---
echo ""
echo "Installing dependencies (curl, unzip)..."
apt update -qq
apt install -y -qq curl unzip

# --- Download and install AWS CLI v2 ---
echo "Downloading AWS CLI v2..."
cd /tmp
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "Extracting installer..."
unzip -q awscliv2.zip

echo "Installing AWS CLI v2..."
./aws/install

# --- Cleanup ---
rm -rf /tmp/awscliv2.zip /tmp/aws

# --- Done ---
echo ""
echo "============================================"
echo "  Installation complete!"
echo "============================================"
echo ""
echo "Try it out by running:"
echo "    aws --version"
echo ""