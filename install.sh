# TODO: Change /usr/local/bin to ~/bin, and add path ~/bin to .zprofile

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ln -i -s $DIR/.vimrc $HOME/.vimrc
ln -i -s $DIR/.zprofile $HOME/.zprofile
ln -i -s $DIR/.gitignore_global $HOME/.gitignore_global
ln -s $DIR/.emacs.d $HOME/.emacs.d

ln -i -s $DIR/local-sync.sh /usr/local/bin/local-sync.sh
ln -i -s $DIR/auto-sync.sh /usr/local/bin/auto-sync.sh

git config --global core.excludesfile ~/.gitignore_global
