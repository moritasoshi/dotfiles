local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  pre_hook = function ()
    local ok, module = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    if not ok then
      return
    end

    module.create_pre_hook()
  end
}
