#!sh
mkdir ~/.vim_bak_by_wjs
mv ~/.vimrc ~/.vimrc_bak_by_wjs
mv ~/.vim ~/.vim_bak_by_wjs
mkdir .vim
cp vimrc ~/.vimrc
cp coc_vim ~/.vim/
cp ./coc-settings.json ~/.vim/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# open vim input :PlugInstall
