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
              local function get_python_path(workspace)
                  -- OMFG so on windows python.exe is in Scripts dir, on unix there's a bin dir. fuck me
                  local pyExeDir = "bin" -- default to unix location
                  if vim.loop.os_uname()["sysname"] == "Windows_NT" then
                      pyExeDir = "Scripts"
                  end
                  local fs = vim.fs
                  -- currently, lua vim doesn't expose path join
                  local joinpath = require('lspconfig/util').path.join

                  -- Use activated venv.
                  if vim.env.VIRTUAL_ENV then
                      vim.print("virtual env activation!")
                      return fs.normalize(joinpath(vim.env.VIRTUAL_ENV, pyExeDir, "python"))
                  end

                  -- Find and use virtualenv in workspace directory.
                  for _, pattern in ipairs({'*', '.*'}) do
                    local match = vim.fn.glob(fs.normalize(joinpath(workspace, pattern, 'pyvenv.cfg')))
                    if match ~= '' then
                      vim.print("found activation!")
                      vim.print(fs.normalize(joinpath(fs.dirname(match), pyExeDir, 'python')))
                      return fs.normalize(joinpath(fs.dirname(match), pyExeDir, 'python'))
                    end
                  end

                  -- Fallback to system Python.
                  vim.print("Fallback activation!")
                  return vim.uv.exepath('python3') or vim.uv.exepath('python') or 'python'
              end
              require("lspconfig").pyright.setup({
                  before_init = function(_, config)
                      config.settings.python.pythonPath = get_python_path(vim.loop.cwd())
                  end,
              })
          end,
        }
      })
    end
  }
