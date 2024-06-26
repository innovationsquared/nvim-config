return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      '',
      '',
      '',
      '',
      '           ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      '           ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      '           ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      '           ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      '           ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      '           ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      '',
      '',
      '',
      '',
      '',
      '             ^^                   @@@@@@@@@                               ',
      '        ^^       ^^            @@@@@@@@@@@@@@@                       ',
      '                             @@@@@@@@@@@@@@@@@@              ^^       ',
      '                            @@@@@@@@@@@@@@@@@@@@                      ',
      '  ~~~~ ~~ ~~~~~ ~~~~~~~~ ~~ &&&&&&&&&&&&&&&&&&&& ~~~~~~~ ~~~~~~~~~~~ ~~~',
      '  ~         ~~   ~  ~       ~~~~~~~~~~~~~~~~~~~~ ~       ~~     ~~ ~   ',
      '    ~      ~~      ~~ ~~ ~~  ~~~~~~~~~~~~~ ~~~~  ~     ~~~    ~ ~~~  ~ ~~',
      '    ~  ~~     ~         ~      ~~~~~~  ~~ ~~~       ~~ ~ ~~  ~~ ~      ',
      '  ~  ~       ~ ~      ~           ~~ ~~~~~~  ~      ~~  ~             ~~',
      '        ~             ~        ~      ~      ~~   ~             ~       ',
      '',
      '',
      '',
    } -- Set buttons
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
      dashboard.button('w', '󰈭  Find Word', ':Telescope live_grep<CR>'),
      dashboard.button('b', '  Bookmarks', ':Telescope marks<CR>'),

      dashboard.button('u', '  Update plugins', ':Lazy sync<CR>'),
      dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
      dashboard.button('q', '󰩈  Quit Neovim', ':qa<CR>'),
    }

    -- Footer
    dashboard.section.footer.val = { "Cal's setup :)" }
    alpha.setup(dashboard.config)
    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = '󰈸 Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
