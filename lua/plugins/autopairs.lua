return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- Enables Treesitter-based pairing
                fast_wrap = {},
            })
        end,
    },
}
