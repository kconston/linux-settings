local function init()
  require "core.vim".init()
  require "plugins".init()
  require "keymap".init()
  require "core.theme".init()
end

return {
  init = init
}
