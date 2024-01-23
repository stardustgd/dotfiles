return {
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    -- easily add new remotes to track
    remotes = {},
  },
  mappings = {
    n = {
      -- Recenter when page up/down
      ["<C-d>"] = {"<C-d>zz", desc = "Move page down"},
      ["<C-u>"] = {"<C-u>zz", desc = "Move page up"},
    },
  },
  -- Set colorscheme to use
  colorscheme = "nord",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        -- enable format on save for specified filetypes only
        allow_filetypes = {},
        -- disable format on save for specified filetypes
        ignore_filetypes = {},
      },
      -- disable formatting capabilities for the listed language servers
      disabled = {},
      timeout_ms = 1000, -- default format timeout
    },
    -- enable servers that you already have installed without mason
    servers = {},
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  polish = function()
  end,
    plugins = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astronvim.utils.status"

        opts.winbar = { -- create custom winbar
          -- store the current buffer number
          init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
          fallthrough = false, -- pick the correct winbar based on condition
          -- inactive winbar
          {
            condition = function() return not status.condition.is_active() end,
            -- show the path to the file relative to the working directory
            status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
            -- add the file name and icon
            status.component.file_info {
              file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
              file_modified = false,
              file_read_only = false,
              hl = status.hl.get_attributes("winbarnc", true),
              surround = false,
              update = "BufEnter",
            },
          },
          -- active winbar
          {
            -- show the path to the file relative to the working directory
            status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
            -- add the file name and icon
            status.component.file_info { -- add file_info to breadcrumbs
              file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
              file_modified = false,
              file_read_only = false,
              hl = status.hl.get_attributes("winbar", true),
              surround = false,
              update = "BufEnter",
            },
            -- show the breadcrumbs
            status.component.breadcrumbs {
              icon = { hl = true },
              hl = status.hl.get_attributes("winbar", true),
              prefix = true,
              padding = { left = 0 },
            },
          },
        }

        return opts
      end,
    },
  },
}
