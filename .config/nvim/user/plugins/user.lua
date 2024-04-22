return {
  { "shaunsingh/nord.nvim" },
  { "vladdoster/remember.nvim" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false
  },
  {
    "andweeb/presence.nvim",
    lazy = false,
    buttons = false,
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false
  },
  {
    "NStefan002/speedtyper.nvim",
    cmd = "Speedtyper",
    opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('nvim-ts-autotag').setup({
        -- your config
      })
    end,
    lazy = true,
    event = "VeryLazy"
  },
}
