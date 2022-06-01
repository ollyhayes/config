#!/bin/bash

for PROFILE_DIR in ~/.mozilla/firefox/* ~/snap/firefox/common/.cache/firefox/*
do
	if [ -d "$PROFILE_DIR" ] && [[ $(basename "$PROFILE_DIR") =~ ^[a-z0-9]{8}\. ]] # e.g o2tfcnw7.default-release
	then
		mkdir -p "$PROFILE_DIR/chrome"
		ln -fs ~/tools/config/userChrome.css $PROFILE_DIR/chrome
	fi
done

echo "Go to about:config and enable: toolkit.legacyUserProfileCustomizations.stylesheets"
