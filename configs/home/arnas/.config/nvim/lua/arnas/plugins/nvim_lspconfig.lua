return {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {"lua_ls", "pyright"},
        -- :h mason-lspconfig.setup_handlers()
        handlers = {
          lsp_zero.default_setup, -- default handler.
          ["lua_ls"] = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
          ["pyright"] = function()
              local util = require("lspconfig/util")
              local path = util.path
              local function get_python_path(workspace)
                  -- Use activated venv.
                  if vim.env.VIRTUAL_ENV then
                      return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
                  end

                  -- Find and use virtualenv in workspace directory.
                  --[[
                  for _, pattern in ipairs({'*', '.*'}) do
                    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
                    if match ~= '' then
                      return path.join(path.dirname(match), 'bin', 'python')
                    end
                  end
                  --]]

                  -- Fallback to system Python.
                  return exepath('python3') or exepath('python') or 'python'
              end
              require("lspconfig").pyright.setup({
                  before_init = function(_, config)
                      config.settings.python.pythonPath = get_python_path(config.root_dir)
                  end,
              })
          end,
        }
      })
    end
  }
