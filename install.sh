sudo apt update -y && sudo apt upgrade -y
sudo apt install make gcc g++ automake autoconf pkg-config git gdb curl libevent-dev flex bison libncurses5-dev libncursesw5-dev lazygit stow -y

cd /tmp
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install
cd ../
rm -rf tmux

mkdir nivm && cd nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
# Add export PATH="$PATH:/opt/nvim-linux-x86_64/bin" to .bashrc
cd ../
rm -rf nvim

mkdir delta && cd delta
curl -LO https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
sudo dpkg -i git-delta_0.18.2_amd64.deb
cd ../ && rm -rf delta

mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/dotfiles
rm ~/.config/lazygit/config.yml
stow nvim
stow lazygit
stow tmux

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
