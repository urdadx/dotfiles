local function files() Snacks.picker.files() end
local function search_buffer() Snacks.picker.lines() end
local function search_project() Snacks.picker.grep() end
local function toggle_cursorline() vim.opt_local.cursorline = not vim.opt_local.cursorline:get() end
local function save_file() vim.cmd.write() end
local function duplicate_line_down() vim.cmd "normal! yyp" end
local function duplicate_line_up() vim.cmd "normal! yyP" end
local function duplicate_selection_down() vim.cmd "normal! y`>p" end
local function duplicate_selection_up() vim.cmd "normal! y`<P" end

---@type LazySpec
return {
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Visual All"] = "<C-d>",
      }
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<C-b>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
          ["<C-p>"] = { files, desc = "Find files" },
          ["<C-e>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
          ["<C-l>"] = { toggle_cursorline, desc = "Toggle current line highlight" },
          ["<C-s>"] = { save_file, desc = "Save file" },
          ["<C-f>"] = { search_buffer, desc = "Search current file" },
          ["<C-S-f>"] = { search_project, desc = "Search project" },
          ["<S-Up>"] = { "v<Up>", desc = "Select up" },
          ["<S-Down>"] = { "v<Down>", desc = "Select down" },
          ["<S-Left>"] = { "v<Left>", desc = "Select left" },
          ["<S-Right>"] = { "v<Right>", desc = "Select right" },
          ["<C-S-Up>"] = { duplicate_line_up, desc = "Duplicate line up" },
          ["<C-S-Down>"] = { duplicate_line_down, desc = "Duplicate line down" },
        },
        i = {
          ["<C-b>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
          ["<C-p>"] = { files, desc = "Find files" },
          ["<C-e>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
          ["<C-l>"] = { toggle_cursorline, desc = "Toggle current line highlight" },
          ["<C-s>"] = { save_file, desc = "Save file" },
          ["<C-f>"] = { search_buffer, desc = "Search current file" },
          ["<C-S-f>"] = { search_project, desc = "Search project" },
          ["<S-Up>"] = { "<Esc>v<Up>", desc = "Select up" },
          ["<S-Down>"] = { "<Esc>v<Down>", desc = "Select down" },
          ["<S-Left>"] = { "<Esc>v<Left>", desc = "Select left" },
          ["<S-Right>"] = { "<Esc>v<Right>", desc = "Select right" },
          ["<C-S-Up>"] = { duplicate_line_up, desc = "Duplicate line up" },
          ["<C-S-Down>"] = { duplicate_line_down, desc = "Duplicate line down" },
        },
        v = {
          ["<C-s>"] = { save_file, desc = "Save file" },
          ["<S-Up>"] = { "<Up>", desc = "Extend selection up" },
          ["<S-Down>"] = { "<Down>", desc = "Extend selection down" },
          ["<S-Left>"] = { "<Left>", desc = "Extend selection left" },
          ["<S-Right>"] = { "<Right>", desc = "Extend selection right" },
          ["<C-S-Up>"] = { duplicate_selection_up, desc = "Duplicate selection up" },
          ["<C-S-Down>"] = { duplicate_selection_down, desc = "Duplicate selection down" },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { mappings = { s = function() vim.cmd "normal! l" end, m = function() vim.cmd "normal! j" end } },
      filesystem = { window = { mappings = { n = "add", f = "add_directory", d = "delete" } } },
    },
  },
}
