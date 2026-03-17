# homefiles

Custom bash environment configuration files and an installer script.

## Files

### .bash_aliases

A collection of useful bash aliases and functions including:

- **Navigation** - shortcuts like `..`, `...`, `....` for quick directory traversal
- **Safer file operations** - `cp`, `mv`, `rm` with confirmation prompts and `--preserve-root` protection
- **Git shortcuts** - `gs`, `ga`, `gc`, `gp`, `gl` for common git commands
- **History** - `h` and `hgrep` for searching command history
- **Networking** - `myip`, `ports`, `ping5`, `update` for system administration
- **extract() function** - universal archive extractor that handles `.tar.gz`, `.zip`, `.7z`, `.rar`, and more
- **Colored man pages** - `LESS_TERMCAP` exports for easier reading of man pages

### install.sh

Installer script that:

1. Checks for recommended packages (`curl`, `git`, `nmap`) and tells you what to install
2. Backs up any existing `~/.bash_aliases` file
3. Creates a symbolic link from the dotfiles repo to `~/.bash_aliases`
4. Ensures `~/.bashrc` sources `~/.bash_aliases`
5. Reminds you to reload your shell

Usage:
```bash
cd ~/dotfiles/homefiles
chmod +x install.sh
./install.sh
source ~/.bashrc
```

The symbolic link means that when I update the repo and `git pull`, your aliases update automatically - no need to re-run the installer.

## Citations

- [Awesome Bash Aliases](https://github.com/ctrlaltvikas/awesome-bash-alias) - curated collection of bash aliases for navigation, git, networking, and system management
- [30 Handy Bash Shell Aliases For Linux / Unix / MacOS](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html) - covers safer file operations (`cp -i`, `mv -i`), `--preserve-root` protections, and `wget -c`
- [Linux: 70 Commands Aliases for Everyday Life](https://davidjguru.github.io/blog/linux-70-commands-aliases-for-everyday-life) - history search aliases, git log formatting, and file/folder navigation
- [The Ultimate .bashrc File by zachbrowne](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c) - source of the `extract()` function and colored man pages via `LESS_TERMCAP` variables
