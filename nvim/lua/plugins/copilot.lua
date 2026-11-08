---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-y>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
    cmd = {
      "CopilotChat", "CopilotChatOpen", "CopilotChatToggle", "CopilotChatExplain",
      "CopilotChatReview", "CopilotChatFix", "CopilotChatOptimize", "CopilotChatDocs", "CopilotChatTests",
    },
    opts = {},
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>aa"] = { "<Cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot chat" },
              ["<Leader>ae"] = { "<Cmd>CopilotChatExplain<CR>", desc = "Explain code" },
              ["<Leader>af"] = { "<Cmd>CopilotChatFix<CR>", desc = "Fix code" },
              ["<Leader>ar"] = { "<Cmd>CopilotChatReview<CR>", desc = "Review code" },
            },
            v = {
              ["<Leader>aa"] = { "<Cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot chat" },
              ["<Leader>ae"] = { "<Cmd>CopilotChatExplain<CR>", desc = "Explain code" },
              ["<Leader>af"] = { "<Cmd>CopilotChatFix<CR>", desc = "Fix code" },
              ["<Leader>ar"] = { "<Cmd>CopilotChatReview<CR>", desc = "Review code" },
            },
          },
        },
      },
    },
  },
}
