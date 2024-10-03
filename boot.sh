set -e

echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Dotfiles..."
# rm -rf ~/src/dotfiles
# git clone https://github.com/moritasoshi/dotfiles.git ~/src/dotfiles >/dev/null

echo "Installation starting..."
~/src/dotfiles/bootstrap.sh -i
