return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        require("dap").defaults.fallback.exception_breakpoints = { "uncaught" }

        -- Load up ./.vscode/launch.json file, so we have those too. see :h dap-launch.json
        require("dap.ext.vscode").load_launchjs()

        -- keymap
        local kset = vim.api.nvim_set_keymap
        kset("n", "<leader>dd", "", {
            desc = "Debug: Start/Continue",
            callback = function()
                require("dap").continue()
            end,
        })
        kset("n", "<leader>dr", "", {
            desc = "Debug: Restart",
            callback = function()
                require("dap").restart()
            end,
        })
        kset("n", "<leader>dt", "", {
            desc = "Debug: Terminate",
            callback = function()
                require("dap").terminate()
            end,
        })
        kset("n", "<leader>db", "", {
            desc = "Debug: Breakpoint toggle",
            callback = function()
                require("dap").toggle_breakpoint()
            end,
        })
        kset("n", "<leader>dbs", "", {
            desc = "Debug: Breakpoint Set",
            callback = function()
                require("dap").set_breakpoint()
            end,
        })
        kset("n", "<leader>dbl", "", {
            desc = "Debug: Breakpoint list",
            callback = function()
                require("dap").list_breakpoints()
            end,
        })
        kset("n", "<leader>dbc", "", {
            desc = "Debug: Breakpoints Clear (all)",
            callback = function()
                require("dap").clear_breakpoints()
            end,
        })
        kset("n", "<leader>dbe", "", {
            desc = "Debug: Breakpoint set Exception version",
            callback = function()
                require("dap").set_exception_breakpoints()
            end,
        })
        kset("n", "<leader>dso", "", {
            desc = "Debug: Step Over",
            callback = function()
                require("dap").step_over()
            end,
        })
        kset("n", "<leader>dsi", "", {
            desc = "Debug: Step Into",
            callback = function()
                require("dap").step_into()
            end,
        })
        kset("n", "<leader>dsu", "", {
            desc = "Debug: Step out (Up)",
            callback = function()
                require("dap").step_out()
            end,
        })
        kset("n", "<leader>dsb", "", {
            desc = "Debug: Step Back",
            callback = function()
                require("dap").step_back()
            end,
        })
        kset("n", "<leader>dp", "", {
            desc = "Debug: Pause (thread)",
            callback = function()
                require("dap").pause()
            end,
        })
        kset("n", "<leader>dp", "", {
            desc = "Debug: Pause (thread)",
            callback = function()
                require("dap").pause()
            end,
        })
    end,
}
