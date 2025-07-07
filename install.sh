#! /bin/bash
gh release download --repo neovim/neovim  --pattern nvim-linux-x86_64.tar.gz
sudo mkdir /opt/nvim/
sudo tar xzvf nvim-linux-x86_64.tar.gz -C /opt/nvim
sudo ln -s /opt/nvim/nvim-linux-x86_64/bin/nvim /usr/bin/nvim
rm nvim-linux-x86_64.tar.gz
cp -r nvim ~/.config
