local present, hlslens = pcall(require, "hlslens")
if not present then
  return
end

hlslens.setup {
  override_lens = function(render, posList, nearest, idx, relIdx)
    local sfw = vim.v.searchforward == 1
    local indicator, text, chunks
    local absRelIdx = math.abs(relIdx)
    local prev, next = "N", "n"
    -- local prev, next = "▲", "▼"

    if absRelIdx > 1 then
      indicator = ("%d%s"):format(absRelIdx, sfw ~= (relIdx > 1) and prev or next)
    elseif absRelIdx == 1 then
      indicator = sfw ~= (relIdx == 1) and prev or next
    else
      indicator = ""
    end

    local lnum, col = unpack(posList[idx])
    if nearest then
      local cnt = #posList
      if indicator ~= "" then
        text = ("[%s %d/%d]"):format(indicator, idx, cnt)
      else
        text = ("[%d/%d]"):format(idx, cnt)
      end
      chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
    else
      -- text = ('[%s %d]'):format(indicator, idx)
      -- chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
      chunks = {}
    end
    render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
  end,
}
