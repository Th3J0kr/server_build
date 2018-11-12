# Scripts and accompying configs for server build

#### _Currently still very early in development_

#### _Author: Th3J0kr_

#### _Version: 0.1_

## Usage

All config files are stored in <type of machine>/config/

### Servers

Currently only supports Debian based servers (debian and ubuntu)

Configures everything as if the root user is the primary user (Yes insecure but it's how I roll)

Goes through and downloads the packages I use the most on servers `zsh vim glances python3 php apache2 tmux curl wget git openssh-server`

Then it configures: 

* zsh using oh-my-zsh and basic custom `zshrc` file
* tmux using oh-my-tmux and basic `tmux.conf.local` file
* SSH server to allow root login with password (Yes it's insecure, adding key management soon)

### Workstations

Coming soon...

## Additional tid bits

Feel free to add your own config files to the `config` directory just make sure to keep the same structure
