return {
  -- Util
  {
    "pocco81/auto-save.nvim",
    enabled = false,
    opts = {
      enabled = true,
      execution_message = {
        message = "",
      },
      events = { "InsertLeave", "TextChanged" },
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = { "java" },
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = true,
      clean_command_line_interval = 500,
      debounce_delay = 215,
    },
  },
}
