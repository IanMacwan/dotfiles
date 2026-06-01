return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",

  dependencies = {
    "nvim-lua/plenary.nvim",

  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = "/home/ian/notes/ianvault",
      },
    },

    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = nil
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    new_notes_location = "current_dir",

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    picker = {
      name = "telescope.nvim",
    },

    ui = {
      enable = false,
    },

  },
}



