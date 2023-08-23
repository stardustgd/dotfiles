return {
  {
    "shaunsingh/nord.nvim",
    -- require('nord').set()
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" }
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false
  }
}
