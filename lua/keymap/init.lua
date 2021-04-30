local keymapbind =require "keymap.bind"


local function init()
  keymapbind.init()
end

return {
  init = init
}

