-- -- DAP (Debug Adapter Protocol) client implementation configuration.
-- -- Using one config file for all DAP related plugins.
--
-- -- Set debug-specific key mappings
-- vim.api.nvim_set_keymap("n", "<F5>", ":lua require('dap').continue()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F1>", ":lua require('dap').step_over()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F2>", ":lua require('dap').step_into()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F3>", ":lua require('dap').step_out()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<localleader>b", ":lua require('dap').toggle_breakpoint()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap(
--   "n",
--   "<localleader>B",
--   ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
--   { noremap = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<localleader>lp",
--   ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')<cr>",
--   { noremap = true }
-- )
-- vim.api.nvim_set_keymap("n", "<localleader>dr", ":lua require('dap').repl.open()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<localleader>dt", ":lua require('dap-go').debug_test()<cr>", { noremap = true })
--
-- -- nvim-dap-go plugin configuration
-- require("dap-go").setup()
--
-- -- nvim-dap-ui plugin configuration
-- require("dapui").setup()
--
-- -- nvim-dap-virtual-text configuration
-- require("nvim-dap-virtual-text").setup()
--
-- local dap = require("dap")
--
-- dap.adapters.go = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
-- }
-- dap.configurations.go = {
--   {
--     type = "go",
--     name = "Debug",
--     request = "launch",
--     showLog = true,
--     program = "${file}",
--     dlvToolPath = os.getenv("HOME") .. "/go/bin/dlv", -- Adjust to where delve is installed
--   },
-- }
--
-- -- use nvim-dap events to open/close nvim-dap-ui windows automatically

require("dap-go").setup()
local dap = require("dap")
dap.set_log_level("TRACE")
dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(function()
    callback { type = "server", host = "127.0.0.1", port = port }
  end, 100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
    showLog = true,
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
    showLog = true,
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    showLog = true,
    program = "./${relativeFileDirname}",
  },
}

require("dapui").setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
}
