if yay -v > /dev/null ; then
	echo "yay already installed"
else
	git clone https://aur.archlinux.org/yay.git
	yay
	cd yay
	makepkg -si
	cd ../
	rm -rf yay
fi
