return {
  -- local tcs = require('sirasagi62/toggle-cheatsheet.nvim').setup(true)
  "sirasagi62/toggle-cheatsheet.nvim",
  spec ={ true },

  -- make your own cheat sheet
  -- function()
    createCheatSheetFromSubmodeKeymap(
  conf{
    {"h","←"},
    {"j","↓"},
    {"k","↑"},
    {"l","→"},
    {"gg","Go to the top"},
    {"G","Go to the bottom"},
    {"%","Go to matching bracket"}
  },
),
}

