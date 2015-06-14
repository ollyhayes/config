if ! grep -q "source ~/tools/config/.bashrc" ~/.bashrc; then
	echo -e "\nsource ~/tools/config/.bashrc" >> ~/.bashrc
fi

ln -s ~/tools/config/.gitconfig ~/.gitconfig
ln -s ~/tools/config/.inputrc ~/.inputrc
ln -s ~/tools/config/.jshintrc ~/.jshintrc
ln -s ~/tools/config/vimrc/.vimrc ~/.vimrc
ln -s ~/tools/config/vimrc/.gvimrc ~/.gvimrc
