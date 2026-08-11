return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff = {
          on_attach = function(client, bufnr)
            if client.server_capablities then
              client.server_capablities.hoverProvider = false
            end
          end,
        },
      },
    },
  },
}
