local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.lua"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = { notify = false },
  git = {
    timeout = 120,
    url_format = "https://github.com/%s.git",
  },
})
