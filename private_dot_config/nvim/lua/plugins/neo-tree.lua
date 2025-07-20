return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        window = {
            mappings = {
                ["l"] = "open",         -- open file/folder
                ["h"] = "close_node",   -- close folder
            }
        }
    },
    keys = {
        { '<C-S-e>', ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
        { '<C-e>', ':Neotree toggle position=left<CR>', silent = true, desc = 'Left File Explorer' }
    }
  }
