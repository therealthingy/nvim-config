return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        -- DOC: TSInstallInfo,
        opts = {
            ensure_installed = {
                "csv",
                "awk",
                "gnuplot",
                "diff", "passwd", "udev", "tmux",
                "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
                "latex",
                "python",
                "c", "cpp", "cmake", "doxygen",
                "rust",
                "nasm", "llvm",
                -- "disassebmly",
                "objdump", "strace",
                "lua", "luadoc",
                "ninja",
                "dockerfile",
                "toml",
                "yaml",
                "markdown",
                "http", "html", "css"
            },
        },
    },
}
