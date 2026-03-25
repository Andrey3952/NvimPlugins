-- 1. Менеджер плагінів lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Налаштування клавіш
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 3. Плагіни
require("lazy").setup({
  
  -- === ТЕМА (Гарний вигляд) ===
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000 
  },

  -- === ФАЙЛОВИЙ МЕНЕДЖЕР (Дерево збоку) ===
  {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup()
      end,
  },

  -- === ПІДСВІТКА КОДУ (Різні кольори для C++, Verilog) ===
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
      local configs = require("nvim-treesitter.config") 
      
      configs.setup({
          ensure_installed = { 
            "c", "cpp", "verilog", 
            "lua", "vim", "vimdoc", "javascript", "html", "css" 
          },
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },

})

-- 4. Базові налаштування редактора
vim.cmd.colorscheme "catppuccin"  -- Вмикаємо тему
vim.opt.clipboard = "unnamedplus" -- Спільний буфер обміну
vim.opt.number = true             -- Номери рядків
vim.opt.relativenumber = true     -- Відносні номери
vim.opt.mouse = "a"               -- Підтримка мишки
vim.opt.tabstop = 4               -- Табуляція = 4 пробіли
vim.opt.shiftwidth = 4
vim.opt.expandtab = true          -- Перетворювати таби в пробіли
