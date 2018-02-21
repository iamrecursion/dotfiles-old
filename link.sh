# Create the symlinks for all files in the repo

# Script Configuration
status_prefix="INFO >>";

# General Stuff
echo "$status_prefix Linking user configuration"

ln -sf ~/.dotfiles/user/profile ~/.profile

# Zsh Stuff
echo "$status_prefix Linking ZSH configuration"

ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

# Bash Stuff
echo "$status_prefix Linking Bash configuration"

ln -sf ~/.dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/.dotfiles/bash/bash_profile ~/.bash_profile

# Neovim Stuff
echo "$status_prefix Linking Neovim configuration"

nvimrc_dir=~/.config/nvim
nvim_plugs_dir=~/.local/share/nvim/site

if [ ! -d  "$nvimrc_dir" ]; then
    echo "$status_prefix Creating directory "$nvimrc_dir" for Nvim \
configuration";
    mkdir -p "$nvimrc_dir"
fi

ln -sf ~/.dotfiles/nvim/init.vim "$nvimrc_dir"/init.vim

if [ ! -d "$nvim_plugs_dir" ]; then
    echo "$status_prefix Creating directory "$nvim_plugs_dir" for Nvim plugins";
    mkdir -p "$nvim_plugs_dir"
fi

echo "$nvim_plugs_dir/autoload"

if [ ! -e "$nvim_plugs_dir/autoload" ]; then
    ln -sf ~/.dotfiles/nvim/autoload "$nvim_plugs_dir/autoload"
fi

# Vim Stuff
echo "$status_prefix Linking Vim configuration"

ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc

vim_dir=~/.vim

if [ ! -e "$vim_dir" ]; then
    ln -s ~/.dotfiles/vim/vimplug ~/.vim
fi

# Tmux Stuff
echo "$status_prefix Linking Tmux configuration"

ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# GDB Init
echo "$status_prefix Linking GDB Configuration"

ln -sf ~/.dotfiles/tools/gdbinit ~/.gdbinit

