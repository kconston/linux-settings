local function init()
  require "core.vim".init()
  require "core.theme".init()
  require "keymap".init()
  require "plugins".init()
end

return {
  init = init
}
