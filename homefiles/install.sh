#!/bin/bash
# =============================================================================
# install.sh - Symlinks .bash_aliases from dotfiles repo to home directory
# =============================================================================

# Get the directory where this script lives (the dotfiles/homefiles folder)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_FILE="${SCRIPT_DIR}/.bash_aliases"
TARGET="${HOME}/.bash_aliases"
BASHRC="${HOME}/.bashrc"

# --- Check for recommended packages ---
echo "Checking for recommended packages..."
MISSING=()
for pkg in curl git nmap; do
    if ! command -v "$pkg" &>/dev/null; then
        MISSING+=("$pkg")
    fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
    echo "The following packages are recommended but not installed: ${MISSING[*]}"
    echo "Install them with: sudo apt install ${MISSING[*]}"
    echo ""
fi

# --- Backup existing .bash_aliases if it exists and is not a symlink ---
if [ -f "$TARGET" ] && [ ! -L "$TARGET" ]; then
    BACKUP="${TARGET}.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing .bash_aliases to $BACKUP"
    mv "$TARGET" "$BACKUP"
elif [ -L "$TARGET" ]; then
    echo "Removing old symlink at $TARGET"
    rm "$TARGET"
fi

# --- Create symbolic link ---
ln -s "$REPO_FILE" "$TARGET"
echo "Symlink created: $TARGET -> $REPO_FILE"

# --- Make sure .bashrc sources .bash_aliases ---
if grep -q "bash_aliases" "$BASHRC" 2>/dev/null; then
    echo ".bashrc already sources .bash_aliases."
else
    echo "" >> "$BASHRC"
    echo "# Source custom bash aliases" >> "$BASHRC"
    echo "if [ -f ~/.bash_aliases ]; then" >> "$BASHRC"
    echo "    . ~/.bash_aliases" >> "$BASHRC"
    echo "fi" >> "$BASHRC"
    echo "Added sourcing block to .bashrc."
fi

echo ""
echo "========================================"
echo "  Installation complete!"
echo "========================================"
echo ""
echo ">>> Reload your shell to activate changes:"
echo "    source ~/.bashrc"
echo "  OR"
echo "    log out and log back in"
echo ""