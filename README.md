# Vutya styled Mac'n'cheese

## other people better set ups
+ http://sourabhbajaj.com/mac-setup/ - OG but very out of date
+ https://www.stuartellis.name/articles/mac-setup/
+ https://www.robinwieruch.de/mac-setup-web-development/
+ https://github.com/alexramirez/mac-setup

## STOP!
Before you do anything you MUST follow complete these steps
1. get coconut oil (extra virgin works best)
2. subscribe to primegean https://www.youtube.com/c/theprimeagen
3. clone this repo, we'll be symling to the right places as we go

## [brew](https://brew.sh/)
first u

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

add brew to path 
```
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
```

### dev
```
brew install \
  git \
  mas \
  nvm \
  tldr \
  thefuck
```

[Configure github](https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git)
```
brew tap microsoft/git
```
```
brew install --cask git-credential-manager-core
```

### mas
+  Amphetamine
```
mas install 937984704
```


### casks (GUIs)
now u
```
brew install --cask \
  google-chrome  \
  firefox \
  brave-browser \
  visual-studio-code \
  iterm2 \
  docker \
  rectangle \
  discord \
  zoom \
  microsoft-teams \
  telegram \
  dropbox \
  bitwarden \
  obsidian \
  vlc \
  imageoptim \
  maccy \
```

## non brew :/
[oh my zsh](https://ohmyz.sh/)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

non oh my zsh plugins
```
brew install \
  zsh \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  zsh-completions
```
for more detail 
+ https://github.com/zsh-users/zsh-syntax-highlighting/tree/master
+ https://github.com/zsh-users/zsh-autosuggestions/tree/master

symlink
```
ln -s code/dotfiles/.zshrc .zshrc
```

## NeoVim
```
TODO: symlink NVIm config
```
