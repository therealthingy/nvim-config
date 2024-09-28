-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

--[[NOTE:
   - DOC: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
   - DEBUG: `:LspLog`
]]

-- lsps with default config
local servers = {
    "asm_lsp",

    "clangd",
    "cmake",      -- cmake-language-server

    "bashls",     -- bash-language-server

    "pyright",

    "html",       -- html-lsp
    "cssls",      -- css-lsp

    "ansiblels", -- ansible-language-server    -- TODO: Requires `:set ft=yaml.ansible`

--    "docker_compose_language_service", -- docker-compose-language-service     -- TODO: DOESN'T WORK ( `:set ~~filetype~~ft=yaml.docker-compose` )
    "dockerls",   -- dockerfile-language-server
    "taplo",

    "texlab",
}
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

--[[Rust
     DOC: https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc]]
lspconfig["rust_analyzer"].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
        ["rust-analyzer"] = {
          diagnostics = {
              enable = true;
          },
          -- Add clippy lints for Rust.
          checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = {
                  "--",
                  "--no-deps",
                  "-Dclippy::correctness",
                  "-Dclippy::complexity",
                  "-Wclippy::perf",
                  "-Wclippy::pedantic",
              },
          },
        }
    },
}

--[[Lua
  "If you primarily use lua-language-server for Neovim, and want to provide completions, analysis,
   and location handling for plugins on runtime path, you can use the following settings":]]
lspconfig["lua_ls"].setup {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
            -- Depending on the usage, you might want to add additional paths here.
            -- "${3rd}/luv/library"
            -- "${3rd}/busted/library",
          }
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = vim.api.nvim_get_runtime_file("", true)
        }
      })
    end,
    settings = {
      Lua = {}
    }
  }
