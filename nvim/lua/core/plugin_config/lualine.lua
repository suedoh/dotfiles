require('lualine').setup {
  options = {
    icons_enabled = true,
    -- ... your lualine config
    theme = 'tokyonight',
    -- ... your lualine config
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
