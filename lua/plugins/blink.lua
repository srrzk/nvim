return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" },
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
  },
}
