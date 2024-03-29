return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true,         -- sets vim.opt.number
    spell = false,         -- sets vim.opt.spell
    signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
    wrap = false,          -- sets vim.opt.wrap
    -- shell = "pwsh",
    -- shellcmdflag =
    -- "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    -- shellredir = "-RedirectStandardOutput %s -NoNewWindow - Wait",
    -- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    -- shellquote = "",
    -- shellxquote = "",
    tabstop = 4,
    shiftwidth = 4,
  },
  g = {
    mapleader = " ",                   -- sets vim.g.mapleader
    autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true,                -- enable completion at start
    autopairs_enabled = true,          -- enable autopairs at start
    diagnostics_enabled = true,        -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
    heirline_bufferline = false,       -- enable new heirline based bufferline (requires :PackerSync after changing)
    nord_italic = false,
  },
}
