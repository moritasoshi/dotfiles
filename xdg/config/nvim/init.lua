local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require("core")
require("core.utils")
require("core.options")
require("core.commands")
require("core.keymaps")

require("core.lazy").bootstrap()
require("core.lazy").run(require("plugins.plugins_lazy"))
