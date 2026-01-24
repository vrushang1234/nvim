return {
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Lua
          null_ls.builtins.formatting.stylua,

          -- JS / TS / Web
          null_ls.builtins.formatting.prettier,

          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,

          -- C / C++
          null_ls.builtins.formatting.clang_format,

          -- Misc
          null_ls.builtins.completion.spell,

          -- ESLint diagnostics
          require("none-ls.diagnostics.eslint"),
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          vim.lsp.buf.format({
            bufnr = args.buf,
            filter = function(client)
              return client.name == "null-ls"
                or client.name == "rust_analyzer"
            end,
            timeout_ms = 2000,
          })
        end,
      })
    end,
  },
}

