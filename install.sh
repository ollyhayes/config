if ! grep -q "source ~/tools/config/.bashrc" ~/.bashrc; then
	echo -e "\nsource ~/tools/config/.bashrc" >> ~/.bashrc
fi

if ! grep -q "source ~/tools/config/.profile" ~/.profile; then
	echo -e "\nsource ~/tools/config/.profile" >> ~/.profile
fi

ln -s ~/tools/config/.gitconfig ~/.gitconfig
ln -s ~/tools/config/.node-inspectorrc ~/.node-inspectorrc
ln -s ~/tools/config/.inputrc ~/.inputrc
ln -s ~/tools/config/.jshintrc ~/.jshintrc
ln -s ~/tools/config/.eslintrc.js ~/.eslintrc.js
ln -s ~/tools/config/.npmrc ~/.npmrc
ln -s ~/tools/config/.tmux.conf ~/.tmux.conf
ln -s ~/tools/vimrc/_vimrc ~/.vimrc
ln -s ~/tools/vimrc/_gvimrc ~/.gvimrc
ln -s ~/tools/vimrc/_vsvimrc ~/.ideavimrc

#Notes:
#DPI on raspberrypi:
# open /etc/lightdm/lightdm.conf and add a parameter under [SeatDefaults] section:
# xserver-command=X -dpi 90
# http://askubuntu.com/questions/197828/how-to-find-and-change-the-screen-dpi
