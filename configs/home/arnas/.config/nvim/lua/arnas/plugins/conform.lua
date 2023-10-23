return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    --[[
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>Fb",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  ]]
    --
    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black", "reorder-python-imports" },
            --javascript = { { "prettierd", "prettier" } },
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
        -- Customize formatters
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
                env = {
                    indent_type = "spaces",
                },
            },
            ["reorder-python-imports"] = {
                command = "reorder-python-imports",
                args = { "--exit-zero-even-if-changed", "--py36-plus", "-" },
                stdin = true,
                cwd = function()
                    return vim.fs.dirname(vim.api.nvim_buf_get_name(0))
                end,
                require_cwd = true,
            },
        },
    },
    --[[
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  ]]
    --
}
