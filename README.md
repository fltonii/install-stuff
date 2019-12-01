# For the sake of laziness

Everytime I change distros (very often) or just reset my OS I do this process over and over to a point where i was starting to settle for non optimal developer/user experiences because of the work of installing it all again.

So here is a script that installs everything that I use in a Linux machine.

The way it works is, there is a CSV table on the repo containing the package name, the source to get it from (package manager) and a pre-install/post-install scripts).
This makes it much more distro-agnostic and very easy to customize.
The supported sources right now are:

- Yay
- Pacman
- Custom scripts

I'll be throwing some APT, deb, and yum here soon.

The idea is to increment on this anytime I find a vscode extension that I love, or a new app that i feel like is essential to my daily life or that I simply like and that I would have to reinstall every time I fell like changing my system (normally because I broke it or something).

I'm aware that this could be done in many different (and better) ways, so any contribution, either to the code, or just by talking to me is welcome.

#### TODOS
For now, as you can see, I've made the script specificaly for Arch based distros (such as Manjaro). It would be great to make this script distro-agnostic, so we wouldn't need to create a different script for different distros, and leaving only the bits that are extremely dependant on system context to be specific to a distro... 
