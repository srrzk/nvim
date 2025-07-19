return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  cmd = {
    "SupermavenUsePro",
  },
  opts = {
    keymaps = {
      accept_suggestion = "<M-f>",
      accept_word = "<M-w>",
      clear_suggestion = "<M-c>",
    },
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  },
}
