
vim.g.lazygit_config_file_path = '~/.config/lazygit/config.yml' -- table of custom config file paths

vim.g.gutentags_add_default_project_roots = false
vim.g.gutentags_project_root = { 'package.json', '.git' }
vim.g.gutentags_cache_dir = vim.fn.stdpath("data") .. '/ctags'
vim.g.gutentags_generate_on_new = true
vim.g.gutentags_generate_on_missing = true
vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_empty_buffer = true
vim.g.gutentags_modules = true
vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', }

if vim.loop.os_uname().sysname == "Darwin" then
    vim.g.gutentags_ctags_executable = "/opt/homebrew/bin/ctags"
end


-- custom
vim.g.gutentags_modules = { 'ctags'--[[ , 'gtags_cscope'  ]]}

-- Lualine and Onedark theme setup
require('lualine').setup {
  options = { theme = 'onedark' }
}
require('onedark').setup { style = 'darker' }
require('onedark').load()

-- Mac paste keymaps (if you use a Mac GUI)
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

  -- nvim-gerrit configuration
  require("nvim-gerrit").setup({
      url = "https://gerrit.corp.arista.io/a",
      digest_authentication = false,
      username = 'manank',
      password = 'hgWLulwFVZeN5++61wzJZ0AyWjRa+WygevSYOIFF8g', -- WARNING: Consider externalizing sensitive data!
    })
  vim.keymap.set("n", "<leader>gr", require("nvim-gerrit").list_changes,
    { desc = "Gerrit: List Changes" })

  -- Outline configuration
  require('outline').setup()

  -- Bufterm configuration for integrated terminal splits
  require('bufterm').setup({
      save_native_terms = true,
      start_in_insert = true,
      remember_mode = true,
      enable_ctrl_w = true,
      terminal = {
        buflisted = false,
        termlisted = true,
        fallback_on_exit = true,
        auto_close = true,
      }
    })

  -- Telescope configuration with live_grep_args & coc extension
  local lga_actions = require("telescope-live-grep-args.actions")
  require("telescope").setup({
      extensions = {
        coc = {
          -- theme = 'dropdown',
          prefer_locations = true,
          push_cursor_on_edit = true,
          timeout = 3000,
        },
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-space>"] = lga_actions.to_fuzzy_refine,
            }
          }
        }
      }
    })
  require('telescope').load_extension('coc')
  require('telescope').load_extension('live_grep_args')

  -- Harpoon configuration
  local harpoon = require('harpoon')
  harpoon:setup()
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
  end
  require("telescope").load_extension('harpoon')
  vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open Harpoon list" })
  vim.keymap.set("n", "<leader>a", function() harpoon:add_file() end, { desc = "Add File to Harpoon" })
  vim.keymap.set("n", "<leader>m", function() harpoon:remove_file() end, { desc = "Remove File from Harpoon" })

  -- Treesitter configuration for highlighting and textobjects
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
            ["if"] = "@parameter.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner class" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer'] = 'V',
                ['@class.outer'] = '<c-v>',
              },
              include_surrounding_whitespace = true,
            },
          },
        }

        -- alpha dashboard
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set a custom header
        dashboard.section.header.val = {
          " ███╗   ██╗ ██████╗ ███████╗███████╗",
          " ████╗  ██║██╔════╝ ██╔════╝██╔════╝",
          " ██╔██╗ ██║██║  ███╗█████╗  ███████╗",
          " ██║╚██╗██║██║   ██║██╔══╝  ╚════██║",
          " ██║ ╚████║╚██████╔╝███████╗███████║",
          " ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝",
        }

        -- Set menu options (customize as needed)
        dashboard.section.buttons.val = {
          dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
          dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
          dashboard.button("g", "  Open LazyGit", ":LazyGit<CR>"),
          dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        -- Footer (optional)
        dashboard.section.footer.val = { "Welcome to Neovim!" }

        -- Apply the configuration
        alpha.setup(dashboard.config)



        vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
          vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window

