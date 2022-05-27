{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true; # coc needs js

    plugins = with pkgs.vimPlugins; [
      auto-pairs
      vim-nix
      vim-airline
      vim-airline-themes
      nerdtree
      tabular
      vim-css-color
      vim-parinfer 
      vim-closetag
      indentLine
      vim-devicons
      vim-toml
      jsonc-vim
      vim-smoothie
      (tender-vim.overrideAttrs (oldAttrs: rec {
        version = "2022-5-27";
        src = pkgs.fetchFromGitHub {
          owner = "helium18";
          repo = "tender.vim";
          rev = "18c44bd8b67af8aba4ab8ca22317d202db7584d0";
          sha256 = "sha256-/7zM9VgQmtn7oxXX8YVbkdEF6VOdOYHYLFVmrC5sCzU=";
        };
      }))

      # coc plugins
      coc-pyright
      coc-rust-analyzer
      coc-tsserver
      coc-html
      coc-json
      coc-css
      coc-lua
    ]; 

    extraConfig = builtins.readFile ../config/neovim/init.vim;

    # coc
    coc = {
      enable = true;

      package = (pkgs.vimPlugins.coc-nvim.overrideAttrs (oldAttrs: rec {
        version = "2022-5-27";
        src = pkgs.fetchFromGitHub {
          owner = "neoclide";
          repo = "coc.nvim";
          rev = "325fbcec571e00c51546fb743e85be1fca8baf1a";
          sha256 = "sha256-BS/HJE6aBn0yMY7WADQyF61kwGHznekdM33rkUg682I=";
        };
      }));

      settings = builtins.readFile ../config/neovim/coc-settings.json;
    };
  };
}


