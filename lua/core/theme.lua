function ThemeInit()
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

  vim.cmd[[colorscheme tokyonight]]
end

local function init()
  ThemeInit()
end

return {
  init = init
}
