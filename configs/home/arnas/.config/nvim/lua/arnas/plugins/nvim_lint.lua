return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost" },
    config = function()
        -- Declare linters
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "ruff" },
            lua = { "selene" },
        }

        -- Custom settings per linter
        local linters = lint.linters
        -- On Windows, have to specify the extension too, otherwise we get can't find error.
        if vim.loop.os_uname()["sysname"] == "Windows_NT" then
            -- I can't figure out how to loop over all linters and append '.cmd' to each .cmd field.
            linters.ruff.cmd = linters.ruff.cmd .. ".cmd"
            linters.selene.cmd = linters.selene.cmd .. ".cmd"
        end

        -- Auto activate
        -- Note: TextChanged event can be expensive, only suitable for stdin supported linters.
        vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "TextChanged", "FocusGained" }, {
            callback = function()
                vim.defer_fn(require("lint").try_lint, 1)
            end,
        })
    end,
}
