local download_packer = function()
  local fn = vim.fn
  if fn.input("Download Packer? (y) ") ~= "y" then
    return
  end

  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    local out = fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }

    print(out)
    print("Installing packer...")
    print("Restart and Execute `:PackerSync`.")
    print(" ")
  end
end

if not pcall(require, "packer") then
  download_packer()
  return true
end
return false
