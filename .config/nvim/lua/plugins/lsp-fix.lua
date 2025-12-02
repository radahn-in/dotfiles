return {
  -- Add this before any other LSP-related configurations
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    priority = 100,
  },

  -- Keep your existing Mason config
  {
    "mason-org/mason.nvim",
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
