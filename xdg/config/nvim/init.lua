local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require("core")
require("core.utils")
require("core.options")
require("moritasoshi.commands")
require("moritasoshi.keymaps")

require("core.lazy").bootstrap()
local plugins = require("moritasoshi.plugins_lazy")
require("core.lazy").run(plugins)
