
# Install Vim-Plug package manager for nvim from (https://github.com/junegunn/vim-plug).
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Install COC
cd .local/share/nvim/plugged/coc.nvim
yarn install
yarn build