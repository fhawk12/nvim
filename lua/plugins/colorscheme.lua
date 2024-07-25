return {
  { "rose-pine/neovim", name = "rose-pine", lazy = false, opts = { styles = { italic = false } } },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    opts = {
      transparent = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "rose-pine-moon",
      colorscheme = "solarized-osaka",
    },
  },
}
