local vim = require "core.vim"
local theme = require "core.theme"
local keymap = require "keymap"
local plugins = require "plugins"

local function init()
  vim.init()
  plugins.init()
  theme.init()
  keymap.init()
end

return {
  init = init
}
