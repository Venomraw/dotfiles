## Folders

### homefiles/

Custom bash aliases sourced from popular community collections. Includes navigation shortcuts, safer file operations, git shortcuts, networking aliases, a universal `extract()` function, and colored man pages. Comes with an install script that creates a symbolic link from the repo to `~/.bash_aliases`.

### sys-installs/

Install script for AWS CLI v2 on Ubuntu. Includes safety checks for root permissions, `apt` availability, user confirmation, and command name conflicts before installing.

### vim-config/

Vim configuration using Vundle as the plugin manager. Includes the Jellybeans colorscheme, Fugitive (git wrapper), and Indent-Guides plugins. Comes with an install script that sets up Vundle and installs plugins automatically.

## Usage

Clone the repo and run the install scripts:

```bash
git clone https://github.com/Venomraw/dotfiles.git
cd dotfiles

# Set up bash aliases
cd homefiles && chmod +x install.sh && ./install.sh
source ~/.bashrc

# Set up vim config
cd ../vim-config && chmod +x install.sh && ./install.sh

# Install AWS CLI (requires sudo)
cd ../sys-installs && chmod +x install-awscli.sh && sudo ./install-awscli.sh
```

## Author

Venomraw
