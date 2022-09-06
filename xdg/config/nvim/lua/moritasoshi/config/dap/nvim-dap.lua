local present, dap = pcall(require, "dap")
if not present then
  return
end

dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = { os.getenv('HOME') .. '/src/vscode-go/dist/debugAdapter.js' };
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('/Users/morita/.local/bin/dlv') -- Adjust to where delve is installed
  },
}
