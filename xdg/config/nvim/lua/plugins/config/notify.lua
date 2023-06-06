local present, notify = pcall(require, "notify")
if not present then
  return
end

local opt = {
  background_colour = "Normal",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 3, -- log_level: WARN
  minimum_width = 50,
  render = "minimal",
  stages = "fade_in_slide_out",
  timeout = 4000,
}
notify.setup(opt)
vim.notify = notify
