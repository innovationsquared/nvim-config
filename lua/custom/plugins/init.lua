return {
  'edluffy/hologram.nvim',
  config = function()
    -- Call the setup function for hologram.nvim if required
    require('hologram').setup {
      auto_display = true, -- Automatically display images
    }
  end,
}
