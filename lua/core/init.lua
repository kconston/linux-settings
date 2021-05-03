local function init()
  require "core.vim".init()
  require "plugins".init()
	require "core.theme".init()
  require "keymap".init()
end

return {
  init = init
}
