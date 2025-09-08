return {
  "Tastyep/structlog.nvim",
  --[[202509050536-----

  print("==IN structlog.lua=="),
  --local log = require("structlog"),

  --log.configure({
  opts = {
    my_logger = {

      pipelines = {
        level = "INFO",
      },
    },
  },
  --[[-------------
        processors = {
          log.processors.StackWriter({ "line", "file" }, { max_parents = 0, stack_level = 0 }),
          log.processors.Timestamper("%H:%M:%S"),
        },
        formatter = log.formatters.FormatColorizer( --
          "%s [%s] %s: %-30s",
          { "timestamp", "level", "logger_name", "msg" },
          { level = log.formatters.FormatColorizer.color_level() }
        ),
        sink = log.sinks.Console(),
      },
      {
        level = log.level.WARN,
        processors = {},
        formatter = log.formatters.Format( --
          "%s",
          { "msg" },
          { blacklist = { "level", "logger_name" } }
        ),
        sink =  log.sinks.NvimNotify(),
      },
      {
        level = log.level.TRACE,
        processors = {
          log.processors.StackWriter({ "line", "file" }, { max_parents = 3 }),
          log.processors.Timestamper("%H:%M:%S"),
        },
        formatter = log.formatters.Format( --
          "%s [%s] %s: %-30s",
          { "timestamp", "level", "logger_name", "msg" }
        ),
        sink = log.sinks.File("/home/grgr13/test.log"),
      },
    },
  },
  },
  -- other_logger = {...}
--})
}

local logger = log.get_logger("my_logger"),
logger:info("A log message"),
logger:warn("A log message with keyword arguments", { warning = "something happened" }),
--]]
}
