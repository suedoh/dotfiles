require('core.keymaps')
require('core.plugins')
require('core.plugin_config')

local colors = {
  fg = "#76787d",
  bg = "#252829",
}

-- Scrolling
vim.opt.guicursor = ""
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remove Whitespace on Exit
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- open telescope when neovim starts only if no other plugin is opening
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("silent! lua require('telescope.builtin').find_files()")
  end,
})

function GitBranch()
  local ok, _ = os.rename(vim.fn.getcwd() .. '/.git', vim.fn.getcwd() .. '/.git')
  if not ok then
    return ''
  end

  local fp = io.popen('git branch --show-current')
  local branch = fp:read('*a')
  if not branch then
    return ''
  end

  branch = string.gsub(branch, '\n', '')
  return [[ ]] .. branch
end

function LSPStatus()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  if errors > 0 then
    return '  ' .. errors .. ' '
  elseif warnings > 0 then
    return '  ' .. warnings .. ' '
  else
    return ''
  end
end

function StatusLine()
  local status = ''

  -- left side
  status = status .. [[ %-{luaeval("GitBranch()")}]]
  status = status .. [[ %-F]]
  status = status .. [[ %{luaeval("LSPStatus()")}]]
  -- right side
  status = status .. [[ %= %y LN %l/%L]]

  return status
end

vim.wo.statusline = '%!luaeval("StatusLine()")'
vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.bg, fg = colors.fg })
