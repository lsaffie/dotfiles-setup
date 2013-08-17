#Update repos
sudo apt-get update

#exclude rdoc and ri
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc

#GIT
#git clone git://github.com/git/git.git ~/git
#cd ~/git
#git checkout v1.7.8
#make prefix=/usr/local all
#sudo make prefix=/usr/local install
#rm -fr ~/git

sudo apt-get -y install bash-completion

#TMUX
DOWNLOAD_URL="http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.6/tmux-1.6.tar.gz?r=http%3A%2F%2Ftmux.sourceforge.net%2F&ts=1326463650&use_mirror=jaist"
sudo apt-get -y install build-essential debhelper diffstat dpkg-dev fakeroot g++ g++-4.4 html2text intltool-debian libmail-sendmail-perl libncurses5-dev libstdc++6-4.4-dev libsys-hostname-long-perl po-debconf quilt xz-utils libevent-1.4-2 libevent-core-1.4-2 libevent-extra-1.4-2 libevent-dev
wget $DOWNLOAD_URL -O tmux-1.6.tar.gz
tar xvvf tmux-1.6.tar.gz
cd tmux-1.6/
./configure --prefix=/usr
make
sudo make install
rm -fr tmux-1.6*

#TMUXFILES
cd ~
git clone git://github.com/lsaffie/tmux.git .tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf

#VIM 7.3
sudo apt-get -y install libncurses-dev libgnome2-dev \
     libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev \
         libx11-dev libxpm-dev libxt-dev ruby-dev

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxf vim-7.3.tar.bz2
cd vim73/

#if using rbenv
./configure --with-features=huge --enable-gui=gnome2 --enable-rubyinterp --enable-pythoninterp

#if using rvm
#replace with-ruby-command with whatver ruby you want to build (which ruby will tell you)
#./configure --with-features=huge --enable-gui=gnome2 --enable-rubyinterp --enable-pythoninterp --with-ruby-command=/usr/local/rvm/rubies/ruby-1.9.3-p194/bin/ruby
make
sudo make install
sudo ln -s /usr/local/bin/vim /usr/local/bin/vi
cd ~ && rm -fr vim*

#VIMFILES
git clone git://github.com/lsaffie/vimfiles.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

#submodules
cd ~/.vim
git submodule init
git submodule update

#EXuberant tags
sudo apt-get -y install exuberant-ctags

#mysql packages
sudo apt-get -y install mysql-client libmysqlclient-dev mysql-server
