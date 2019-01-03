# Create the symlinks for all files in the repo

# Script Configuration
status_prefix="INFO >>";

# Header
cat << STATUS

============================ SETTING UP ENVIRONMENT ===========================

STATUS

# Getting Script Directory
SOURCE="${BASH_SOURCE[0]}"

while [ -h "$SOURCE" ]; do # resolve $SOURCE until file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # resolve relative symlinks
done

DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# Cloning Submodules
echo "$status_prefix Cloning Submodules"

cd $DIR;
git submodule update --init --recursive;
cd $HOME;

# General Stuff
echo "$status_prefix Linking user configuration"

ln -sf $DIR/user/profile $HOME/.profile

# Zsh Stuff
echo "$status_prefix Linking ZSH configuration"

ln -sf $DIR/zsh/zshrc $HOME/.zshrc

# Bash Stuff
echo "$status_prefix Linking Bash configuration"

ln -sf $DIR/bash/bashrc $HOME/.bashrc
ln -sf $DIR/bash/bash_profile $HOME/.bash_profile

# Neovim Stuff
echo "$status_prefix Linking Neovim configuration"

nvimrc_dir="$HOME/.config/nvim"
nvim_plugs_dir="$HOME/.local/share/nvim/site"

if [ ! -d  "$nvimrc_dir" ]; then
    echo "$status_prefix Creating directory "$nvimrc_dir" for Nvim \
configuration";
    mkdir -p "$nvimrc_dir"
fi

ln -sf "$DIR/nvim/init.vim" "$nvimrc_dir/init.vim"

if [ ! -d "$nvim_plugs_dir" ]; then
    echo "$status_prefix Creating directory "$nvim_plugs_dir" for Nvim plugins";
    mkdir -p "$nvim_plugs_dir"
fi

if [ ! -e "$nvim_plugs_dir/autoload" ]; then
    ln -sf "$DIR/nvim/autoload" "$nvim_plugs_dir/autoload"
fi

# Vim Stuff
echo "$status_prefix Linking Vim configuration"

ln -sf "$DIR/vim/vimrc" "$HOME/.vimrc"

vim_dir="$HOME/.vim"

if [ ! -e "$vim_dir" ]; then
    ln -s "$DIR/vim/vimplug" "$vim_dir"
fi

# Tmux Stuff
echo "$status_prefix Linking Tmux configuration"

ln -sf "$DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# GDB Init
echo "$status_prefix Linking GDB Configuration"

ln -sf "$DIR/tools/gdbinit" "$HOME/.gdbinit"

# User Reminders
cat << EOM

================================= PLEASE READ =================================

If using TMUX, please start it and execute 'C-a' + 'I' to install plugins.

If using zsh, please source '~/.zshrc' and execute 'zplug install'.

If using nvim or vim, please open the respective editor and run ':PlugInstall'
to install the plugin configuration. This step will likely require system
dependencies for the various plugins. These include:

  - libboost
  - libclang
  - rustc
  - ghc
  - stack
EOM

