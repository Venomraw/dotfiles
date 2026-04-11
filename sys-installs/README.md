# sys-installs

Scripts for installing system software and tools that require multiple commands or dependencies.

## Files

### install-awscli.sh

Installer script for the AWS Command Line Interface v2 on Ubuntu. The script performs the following safety checks before installing:

1. **Root check** - verifies the script is being run with `sudo` or as `root` (via `$EUID`). Exits if not.
2. **Package manager check** - verifies `apt` is available on the system. Exits if not.
3. **User confirmation** - displays what will be installed and prompts the user for `y/n` before proceeding.
4. **Name conflict check** - verifies that the command `aws` does not already exist on the system. Exits if found, to avoid clobbering existing binaries.
5. **Silent install** - installs dependencies (`curl`, `unzip`) quietly via `apt -y -qq`, downloads the official AWS CLI v2 zip, extracts it, and runs the installer.
6. **Completion message** - tells the user how to verify the install with `aws --version`.

Usage:

```bash
cd ~/dotfiles/sys-installs
chmod +x install-awscli.sh
sudo ./install-awscli.sh
```

After installation, verify with:

```bash
aws --version
```

## Citations

- [AWS Command Line Interface - Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - official AWS documentation for installing AWS CLI v2 on Linux. Provided the `curl` download URL, `unzip` step, and `./aws/install` command used in the script.
- **Claude (Anthropic, claude-opus-4-6)** - used to help structure the install script with the required safety checks (EUID, apt, name conflict) and generate this README. Prompt: "help me write a bash install script for AWS CLI v2 on Ubuntu that checks for root, checks for apt, prompts the user, checks for name conflicts, installs silently, and prints a completion message"