#!sh
# this sh need root 
cd ~/
mkdir setup
cd setup

# change CentOS-Base.repo 
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Base.repo

# change epel.repo
yum install epel-release
cp /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak
sed -e 's!^metalink=!#metalink=!g' \
    -e 's!^#baseurl=!baseurl=!g' \
    -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
    -e 's!http://mirrors\.tuna!https://mirrors.tuna!g' \
    -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo

# Install python
yum -y install yum-utils
yum-builddep python
yum install python3
vi /etc/profile.d/python.sh
alias python='/usr/local/bin/python3.6'
source /etc/profile.d/python.sh
yum install python python-devel python3 python3-devel

# update vim7 -> vim8
yum -y install gcc-c++ ncurses-devel ruby ruby-devel lua lua-devel luajit luajit-devel ctags python python-devel python3 python3-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed cscope gtk3-devel libSM-devel libXt-devel libXpm-devel libappstream-glib libacl-devel gpm-devel
rpm -e --nodeps vim-minimal
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
 --enable-pythoninterp=yes \
 --with-python-config-dir=/usr/lib64/python2.7/config \
 --enable-python3interp=yes \
 --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu \
 --enable-perlinterp=yes \
 --disable-tclinterp \
 --with-x=yes \
 --enable-gui=gtk3 --enable-multibyte \
 --enable-cscope \
 --with-tlib=ncurses \
 --enable-fail-if-missing \
 --disable-darwin --enable-luainterp=yes \
 --enable-rubyinterp=yes --enable-terminal \
 --enable-fontset --with-luajit --with-python3-command=python3.6 \
 --enable-gtk3-check \
 --prefix=/usr/local/vim \
 --with-compiledby="weijinsong"
echo "export PATH=/usr/local/vim/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
cd ..

# install my_vimrc
git clone https://github.com/weijinsong/my_vim.git
cd my_vim
sh install.sh
cd ..

# open vim input :PlugInstall
echo -e "[language.cpp]\ncommand = \"ccls\"\nargs = [\"--init={\\\"cacheDirectory\\\":\\\"\${project_root}/.ccls\\\"}\"]\nsynchronous_triggers = [\".\"]\nsynchronous_timeout_ms = 200\nnum_server_instances = 2\nalways_prefer = false" >> ~/.config/TabNine/TabNine.toml
#

# install ccls
yum install epel-release
yum install snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
snap install ccls --classic

# install cmake 
yum list installed | grep -i CMake
git clone https://github.com/Kitware/CMake.git
cd CMake
$ ./bootstrap && make && sudo make install

# install g++ 7.4
yum -y install centos-release-scl
yum -y install devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-binutils
scl enable devtoolset-7 bash
echo "source /opt/rh/devtoolset-7/enable" >>~/.bashrc

# install vscode 
wget https://vscode.cdn.azure.cn/stable/5763d909d5f12fe19f215cbfdd29a91c0fa9208a/code-1.45.1-1589445456.el7.x86_64.rpm
yum -y install ./code-1.45.1-1589445456.el7.x86_64.rpm

#include vncviewer 
wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.113-Linux-x64.rpm
yum -y install ./VNC-Viewer-6.20.113-Linux-x64.rpm

# add ic_server config
echo -e "alias icss=\"ssh -X -p 22 weijinsong@10.0.109.206\"" >> ~/.bashrc
echo -e "alias icsf=\"ssh -p 22 weijinsong@10.0.109.206\"" >> ~/.bashrc

# modify /etc/rc.d/rc.load 
# This script will be executed after all the other init scripts.
mount /dev/sda4 ./WinD
mount /dev/sda5 ./winE
