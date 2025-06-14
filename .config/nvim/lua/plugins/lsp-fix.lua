return {
  -- Add this before any other LSP-related configurations
  {
    "williamboman/mason-lspconfig.nvim",
    version = "v1.18.0",
    lazy = false,
    priority = 100,
  },

  -- Keep your existing Mason config
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "gopls",
        "pyright",
        "gofumpt",
        "golangci-lint",
      })
    end,
  },
}
