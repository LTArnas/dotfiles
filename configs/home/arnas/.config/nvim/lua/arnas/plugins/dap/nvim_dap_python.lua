return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    ft = { "python" },
    config = function()
        -- OMFG so on windows python.exe is in Scripts dir, on unix there's a bin dir. fuck me
        local pyExeDir = "bin" -- default to unix location
        if vim.loop.os_uname()["sysname"] == "Windows_NT" then
            pyExeDir = "Scripts"
        end

        local masonPythonPath =
            vim.fs.normalize(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/" .. pyExeDir .. "/python")

        require("dap-python").setup(masonPythonPath)

        -- Some generic configs:
        -- See :h dap-configuration on how to set up real nice generic. Can do some input too.
        -- What if we just do upwards search for launch.json, including for '.vscode/launch.json'. but not looking at all subdirs in each dir, so it's fast. much like gitconfig or whatever. have the list of found... nvm, just go with the first found lol. could be fancy and provide a picker for a list, but nah.
        --[[
        table.insert(require('dap').configurations.python, {
            type = 'python',
            request = 'launch',
            name = "Generic Launch File",
            program = '${file}',
            python = function()
                -- find and return virtual env path
            end,
        })
        --]]

        -- Try to find launch.json file and ingest it automatically. Checking upwards the path.
        -- currently only checks at every parent dir (including current dir) for launch.json or
        -- the dap default location '.vscode/launch.json'
        local foundLaunchPath = vim.fs.find(function(name, path)
            if name == "launch.json" then
                return true
            else
                --local vscodePath = vim.fs.normalize(path .. "/" .. name .. "/launch.json")
                if vim.fn.filereadable(vim.fs.normalize(path .. "/" .. name .. "/launch.json")) == 1 then
                    return true
                end
            end
        end, {
            upward = true,
            limit = 1,
            path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
        })
        -- fix result into a usable value ...annoyingly.
        foundLaunchPath = foundLaunchPath[1]
        if foundLaunchPath ~= nil then
            if vim.fn.matchend(foundLaunchPath, "launch.json$", nil, 1) == -1 then
                foundLaunchPath = vim.fs.normalize(foundLaunchPath .. "/launch.json")
            end
            -- finally, add custom config to the list
            -- Note! this overwrites the config list if the name is the same! ...i think it's on the name
            require("dap.ext.vscode").load_launchjs(foundLaunchPath)
        end
    end,
}
