return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    explorer = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          layout = {
            preset = "vertical",
            preview = false,
          },
          hidden = true,
          auto_close = true,
        },
        buffers = {
          hidden = true,
        },
        files = {
          hidden = true,
          layout = {
            preset = "ivy_split",
          },
        },
        grep = {
          hidden = true,
          layout = {
            preset = "ivy_split",
          },
        },
        grep_word = {
          hidden = true,
        },
      },
    },
  },
}
