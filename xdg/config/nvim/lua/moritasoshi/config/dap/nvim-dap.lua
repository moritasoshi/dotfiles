local present, _ = pcall(require, "dap")
if not present then
  return
end

-- configured in `nvim-dap-go`
