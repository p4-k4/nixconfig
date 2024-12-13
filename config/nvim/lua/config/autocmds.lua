-- Set up custom autocommands
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Custom AsyncResult coloring
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Define the highlight group
    vim.api.nvim_set_hl(0, "CustomPastelRed", {
      fg = "#ff7a93",
    })
    -- Use match instead of syntax keyword
    vim.cmd([[match CustomPastelRed /AsyncResult/]])
  end,
})
