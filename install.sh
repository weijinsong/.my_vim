#!sh
mkdir ~/.vim_bak_by_wjs
mv ~/.vimrc ~/.vim_bak_by_wjs/.vimrc
mv ~/.vim ~/.vim_bak_by_wjs
mkdir ~/.vim

mkdir ~/.config/nvim_bak_by_wjs
mv ~/.config/nvim ~/.config/nvim_bak_by_wjs
mkdir ~/.config/nvim

ln -s $(pwd)/vimrc ~/.config/nvim/init.vim
ln -s $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json

pwd
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/coc-settings.json ~/.vim/coc-settings.json

# source ./SoureMe
# cd ./local
# tar -xvf node-v14.8.0-linux-x64.tar.xz
# mv node-v14.8.0-linux-x64 node
# cd ../
# yarn config set registry 'https://registry.npm.taobao.org'
vim

# ln -s $(pwd)/vimrc ~/.vim/init.vim
# ln -s $(pwd)/coc-settings.json ~/.vim/coc-settings.json

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# open vim input :PlugInstall

