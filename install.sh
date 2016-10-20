if ! grep -q "source ~/tools/config/.bashrc" ~/.bashrc; then
	echo -e "\nsource ~/tools/config/.bashrc" >> ~/.bashrc
fi

ln -s ~/tools/config/.gitconfig ~/.gitconfig
ln -s ~/tools/config/.node-inspectorrc ~/.node-inspectorrc
ln -s ~/tools/config/.inputrc ~/.inputrc
ln -s ~/tools/config/.jshintrc ~/.jshintrc
ln -s ~/tools/config/.npmrc ~/.npmrc
ln -s ~/tools/tools/vimrc/_vimrc ~/.vimrc
ln -s ~/tools/tools/vimrc/_gvimrc ~/.gvimrc

#Notes:
#DPI on raspberrypi:
# open /etc/lightdm/lightdm.conf and add a parameter under [SeatDefaults] section:
# xserver-command=X -dpi 90
# http://askubuntu.com/questions/197828/how-to-find-and-change-the-screen-dpi
