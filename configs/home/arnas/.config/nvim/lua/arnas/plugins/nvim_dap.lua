return {
    "mfussenegger/nvim-dap",
    config = function()
        -- Load up ./.vscode/launch.json file, so we have those too. see :h dap-launch.json
        require("dap.ext.vscode").load_launchjs()
    end,
}
