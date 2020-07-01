#!sh
mkdir ~/.vim_bak_by_wjs
mv ~/.vimrc ~/.vim_bak_by_wjs/.vimrc
mv ~/.vim ~/.vim_bak_by_wjs
mkdir ~/.vim
pwd
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/vimrc ~/.vim/init.vim
ln -s $(pwd)/coc-settings.json ~/.vim/coc-settings.json

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# open vim input :PlugInstall

