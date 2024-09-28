-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everforest_light",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.mason = {
    cmd = true,
    -- REGISTRY: https://mason-registry.dev/registry/list?search=
    pkgs = {
        "asm-lsp",
        "asmfmt",

        "clangd",
        "cmake-language-server",
        "cmakelang",

        "rust-analyzer",

        "bash-language-server",
        "shfmt",
        "shellcheck",

        "pyright",
        "black",    -- Python Formatter

        "lua-language-server",
        "stylua",   -- Lua Formatter

        "html-lsp",
        "css-lsp",

        "ansible-language-server",
        "ansible-lint",

        "docker-compose-language-service", -- docker-compose.yml
        "dockerfile-language-server",      -- Dockerfile
        "taplo",    -- Toml

        "texlab",

    --[[TODO:
      - sonarlint (https://github.com/SonarSource/sonarlint-language-server)
]]
    },
}

return M
