return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    config = function(_, opts)
        require("telescope").setup()

        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")
        vim.api.nvim_set_keymap(
            "n",
            "<leader>fF",
            "",
            { desc = "(Telescope) Find: Files (find_files)", callback = builtin.find_files }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>fg",
            "",
            { desc = "(Telescope) Find: Grep text in files (live_grep)", callback = builtin.live_grep }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>fb",
            "",
            { desc = "(Telescope) Find: Buffers (buffers)", callback = builtin.buffers }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>fh",
            "",
            { desc = "(Telescope) Find: Help docs (help_tags)", callback = builtin.help_tags }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>fk",
            "",
            { desc = "(Telescope) Find: Keymaps (keymaps)", callback = builtin.keymaps }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>ff",
            "",
            { desc = "(Telescope) Find: Git Files (git_files)", callback = builtin.git_files }
        )
    end,
}
