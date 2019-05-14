<p align="center">
  <img src="https://github.com/jglovier/dotfiles-logo/blob/master/dotfiles-logo-stacked.png" alt="dotfiles stacked logo" width="100">
 </p>

# Dotfiles
This repo contains my dotfiles. It provides default configuration for the set of
applications that I use every day in the terminal, and works in a cross-platform
manner between MacOS and Linux. It provides configuration for the following:

- `git`: A sensible gitconfig where user name, email and GPG key can be set at
  install time.
- `hammerspoon`: A config with a few useful utilities (MacOS only).
- `neovim`: A detailed configuration containing years-worth of work to get the
  fluid editing of vim with comprehensive IDE features for Haskell, C++, Python,
  and a variety of other languages.
- `tmux`: A configuration that makes using tmux truly intuitive.
- `zsh`: A configuration that makes my favourite shell even better and more
  fluid to use.

All of this configuration is, of course, incredibly personal, so I don't expect
anybody to use it without making changes. Nevertheless, if you find yourself
taking a look at this readme, I hope you find the configuration instructive or
useful in some way.

## Installation
This repo comes with a simple install script that eases the installation process
and makes getting set up on a new machine fairly simple. As a prerequisite, you
will need the above listed programs installed to make use of the configuration.

1. Clone the repository into `~/.dotfiles`. The install script isn't precious
   about this location, but some of the configuration relies on it.

   ```
   git clone https://github.com/iamrecursion/dotfiles ~/.dotfiles
   ```
2. Execute the install script. You may need to explicitly tell it which bash to
   use if you fail the compatibility check.

   ```
   ~/.dotfiles/install.sh
   ```

3. When prompted, enter your name, email and GPG key for git.
4. Follow the final setup instructions printed to the terminal.

Most files will be symlinked from the repo, though some will be copied into
their final locations.

NB: This will overwrite any existing configuration that exists at the target
paths, so if you want to try these out please back up your configuration.

