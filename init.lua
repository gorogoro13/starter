-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("telekasten").setup({
  home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
})

--[[
local log = require("structlog").setup({

  configure({
    my_logger = {
      pipelines = {
        {
          level = level.INFO,
          processors = {
            log.processors.StackWriter({ "line", "file" }, { max_parents = 0, stack_level = 0 }),
            log.processors.Timestamper("%H:%M:%S"),
          },
          formatter = formatters.FormatColorizer( --
            "%s [%s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" },
            { level = log.formatters.FormatColorizer.color_level() }
          ),
          sink = sinks.Console(),
        },
        {
          level = level.WARN,
          processors = {},
          formatter = formatters.Format( --
            "%s",
            { "msg" },
            { blacklist = { "level", "logger_name" } }
          ),
          sink = sinks.NvimNotify(),
        },
        {
          level = level.TRACE,
          processors = {
            processors.StackWriter({ "line", "file" }, { max_parents = 3 }),
            processors.Timestamper("%H:%M:%S"),
          },
          formatter = formatters.Format( --
            "%s [%s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" }
          ),
          sink = log.sinks.File("./test.log"),
        },
      },
    },
  }),
})

local logger = log.get_logger("my_logger")
logger:info("A log message")
logger:warn("A log message with keyword arguments", { warning = "something happened" })
--]]
