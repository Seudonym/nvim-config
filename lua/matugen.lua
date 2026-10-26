 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#151311', -- Default Background
     base01 = '#211f1d', -- Lighter Background (status bars)
     base02 = '#2c2a27', -- Selection Background
     base03 = '#988f84', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#cfc5b9', -- Dark Foreground (status bars)
     base05 = '#e7e1dd', -- Default Foreground
     base06 = '#e7e1dd', -- Light Foreground
     base07 = '#e7e1dd', -- Lightest Foreground
     -- Accent colors
     base08 = '#ffb4ab', -- Variables, XML Tags, Errors
     base09 = '#c4ccb0', -- Integers, Constants
     base0A = '#d0c5b6', -- Classes, Search Background
     base0B = '#dac6a7', -- Strings, Diff Inserted
     base0C = '#c2caae', -- Regex, Escape Chars
     base0D = '#d8c4a5', -- Functions, Methods
     base0E = '#d0c5b6', -- Keywords, Storage
     base0F = '#93000a', -- Deprecated, Embedded Tags
   }
 end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
