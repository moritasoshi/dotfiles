local ok, neogit = pcall(require, "neogit")
if not ok then
  return
end

neogit.setup {
  disable_builtin_notifications = true,
  disable_commit_confirmation = true,
  integrations = {
    diffview = true,
  },
}
