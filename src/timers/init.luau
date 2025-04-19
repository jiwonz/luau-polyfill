local Object = require("../collections/Object")
local task = require("@pkg/task")

local makeTimerImpl = require("./makeTimerImpl")
local makeIntervalImpl = require("./makeIntervalImpl")

export type Timeout = makeTimerImpl.Timeout
export type Interval = makeIntervalImpl.Interval

return Object.assign({}, makeTimerImpl(task.delay), makeIntervalImpl(task.delay))
