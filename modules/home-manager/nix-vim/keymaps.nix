{ pkgs, config, inputs, ... }: 
{
  options = {
    backup = false;
    cmdheight = 1;
    completeopt = { "menuone", "noselect" };
    conceallevel = 0;
    fileencoding = "utf-8";
    hlsearch = true;
    ignorecase = true;
    mouse = "a";
    pumheight = 10;
    showmode = false;
    showtabline = 2;
    smartcase = true;
    smartindent = true;
    splitbelow = true;
    splitright = true;
    swapfile = false;
    termguicolors = true;
    timeoutlen = 1000;
    undofile = true;
    updatetime = 300;
    writebackup = false;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    cursorline = true;
    number = true;
    relativenumber = true;
    numberwidth = 4;
    signcolumn = "yes";
    wrap = false;
    scrolloff = 8;
    guifont = { "JetBrainsMonoNL Nerd Font Mono", "h12" };
    sidescrolloff = 8;
  };
}
