del %USERPROFILE%\.bashrc
del %USERPROFILE%\.profile
del %USERPROFILE%\.gitconfig
del %USERPROFILE%\.node-inspectorrc
del %USERPROFILE%\.inputrc
del %USERPROFILE%\.jshintrc
del %USERPROFILE%\.eslintrc.js
del %USERPROFILE%\.tmux.conf
del %USERPROFILE%\.npmrc
del %USERPROFILE%\.vimrc
del %USERPROFILE%\.gvimrc
del %USERPROFILE%\.vsvimrc
del %USERPROFILE%\.ideavimrc
del %USERPROFILE%\AppData\Roaming\Code\User\settings.json
del %USERPROFILE%\AppData\Roaming\Code\User\keybindings.json

mklink %USERPROFILE%\.bashrc %USERPROFILE%\tools\config\.bashrc
mklink %USERPROFILE%\.profile %USERPROFILE%\tools\config\.profile
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\tools\config\.gitconfig
mklink %USERPROFILE%\.node-inspectorrc %USERPROFILE%\tools\config\.node-inspectorrc 
mklink %USERPROFILE%\.inputrc %USERPROFILE%\tools\config\.inputrc
mklink %USERPROFILE%\.jshintrc %USERPROFILE%\tools\config\.jshintrc
mklink %USERPROFILE%\.eslintrc.js %USERPROFILE%\tools\config\.eslintrc.js
mklink %USERPROFILE%\.tmux.conf %USERPROFILE%\tools\config\.tmux.conf
mklink %USERPROFILE%\.npmrc %USERPROFILE%\tools\config\.npmrc
mklink %USERPROFILE%\.vimrc %USERPROFILE%\tools\config\_vimrc
mklink %USERPROFILE%\.gvimrc %USERPROFILE%\tools\config\_gvimrc
mklink %USERPROFILE%\.vsvimrc %USERPROFILE%\tools\config\_vsvimrc
mklink %USERPROFILE%\.ideavimrc %USERPROFILE%\tools\config\_vsvimrc
mklink %USERPROFILE%\AppData\Roaming\Code\User\settings.json %USERPROFILE%\tools\config\settings.json
mklink %USERPROFILE%\AppData\Roaming\Code\User\keybindings.json %USERPROFILE%\tools\config\keybindings.json
