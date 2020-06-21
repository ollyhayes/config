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
ln -s ~/tools/config/_vimrc ~/.vimrc
ln -s ~/tools/config/_gvimrc ~/.gvimrc
ln -s ~/tools/config/_vsvimrc ~/.ideavimrc
ln -s ~/tools/config/ssh_config ~/.ssh/config
ln -s ~/tools/config/settings.json ~/.config/Code/User/settings.json
ln -s ~/tools/config/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ~/tools/config/gtk.css ~/.config/gtk-3.0/gtk.css
ln -s ~/tools/config/launch-programs.desktop ~/.config/autostart/launch-programs.desktop

#echo "Cloning tpm..."
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

read -p "Install vim-plug?" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Cloning vim-plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/vimfiles/autoload
	cp ~/.vim/autoload/plug.vim ~/vimfiles/autoload/plug.vim
else
	echo
fi

read -p "Install programs with apt?" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt install git tmux orpie fzf silversearcher-ag curl xclip ranger
else
	echo
fi

# use this command for a keyboard shortcut to orpie: 'gnome-terminal --title="calc" --geometry=80x26 -- tmux new-session orpie'
# could totally automate the keybindings with this: https://askubuntu.com/a/597414/883419
