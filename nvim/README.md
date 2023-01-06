# nvim-config

This repo contains my baseline plugins and remaps to get a comfortable nvim config off the ground.

If you'd like to utilize anything here, I am following nvim directory standards. If you're not sure
where to put the contents of this repo, open up neovim and run `:h rtp` for a list of runtime paths.
I'm running neovim on Arch and OOB neovim is looking for a config in `~/.config/nvim/`.

Inside your config directory, have an empty folder called `nvim` and clone the contents of this
repo. Using my example, I'd run:

```
git clone git@github.com:suedoh/nvim-config.git ~/.config/nvim/
```

I am using [rose-pine](https://github.com/rose-pine/neovim) for the colorscheme and have a small
lua function inside `nvim/after/plugins/colormypencil.lua` to set styles. You can execute this 
function at any time using `:lua ColorMyPencil()`.

With respect to plugins and dependencies I am using [packer.nvim](https://github.com/wbthomason/packer.nvim) for management.
Packer.nvim requires Neovim v0.5.0+ so please make sure you have >=v0.5.0 installed.

On Unix/Linux you can quickly install packer.nvim with the following snippet:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Once installed run `:PackerSync` inside nvim and it will install the following plugins:
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) 
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Undotree](https://github.com/mbbill/undotree)

Along with a pretty nice lsp using [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim). To see the
configurations for each plugin, visit the `nvim/after/plugin` directory of this repo.

