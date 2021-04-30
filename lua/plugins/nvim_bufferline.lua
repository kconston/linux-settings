local function load_nvim_bufferline()
  require'bufferline'.setup{ options = { mappings = true } }
end

local function init()
 load_nvim_bufferline()
end

return {
 init = init
}

