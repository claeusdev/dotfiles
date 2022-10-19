require "nvim-treesitter.configs".setup(
  {
    highlight = {
      enable = true,
      disable = {}
    },
    indent = {
      enable = true,
      disable = {}
    },
    auto_install = true,
    ensure_installed = {
      "python",
      "rust",
      "sql",
      "scss",
      "graphql",
      "elixir",
      "dockerfile",
      "c",
      "cpp",
      "tsx",
      "lua",
      "json",
      "css",
      "ruby",
      "typescript",
      "html",
      "go",
      "yaml",
      "java",
      "javascript"
    },
    autotag = {
      enable = true,
    }
  }
)
