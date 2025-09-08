--print("==IN structlog.lua==")
return {
  "Tastyep/structlog.nvim",

  config = function()
    local log = require("structlog")

    log.configure({
      my_logger = {
        pipelines = {
          {
            level = log.level.INFO,
            processors = {
              log.processors.StackWriter({ "line", "file" }, { max_parents = 0, stack_level = 0 }),
              log.processors.Timestamper("%H:%M:%S"),
            },
            formatter = log.formatters.Format( --
              "%s [%s] %s: %-30s",
              { "timestamp", "level", "logger_name", "msg" }
            ),
            -- change for me.
            sink = log.sinks.File("/home/grgr13/log/structlog_info.log"),
          },
          {
            level = log.level.WARN,
            --[[
    processorsssors = {},
            foratter = log.formatters.Format( --
              "%s",
              { "msg" },
              { blacklist = { "level", "logger_name" } }
            ),
            sink = log.sinks.NvimNotify(),
            --]]
            --
            processors = {
              log.processors.StackWriter({ "line", "file" }, { max_parents = 1, stack_level = 0 }),
              log.processors.Timestamper("%H:%M:%S"),
            },
            formatter = log.formatters.Format( --
              "%s [%s] %s: %-30s",
              { "timestamp", "level", "logger_name", "msg" }
            ),
            sink = log.sinks.File("/home/grgr13/log/structlog_warn.log"),
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
            sink = log.sinks.File("/home/grgr13/log/structlog_trace.log"),
          },
        },
      },

      -- other_logger = {...}
    })

    --
    local logger = log.get_logger("my_logger")
    -- logger:info("A log message")
    --    logger:warn("A log message with keyword arguments", { warning = "something happened" })
    logger:trace("==== Trace Log. ====")
  end,
}
