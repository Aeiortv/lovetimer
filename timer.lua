local timer = {}
local timers =  {}

function timer.create(name, interval, action, repetition)
  timers[name] = {goal = interval, action = action, repetition = repetition, finished = false}
  timers[name].progress = interval
  if not repetition then
    timers[name].progress = 0
  end
end

function timer.update(name, dt)
  local cTimer = timers[name] -- (c)urrent (Timer)
  cTimer.progress = cTimer.progress + dt
  if cTimer.progress >= cTimer.goal and not cTimer.finished then
    cTimer.progress = 0
    cTimer.action()
    if not cTimer.finished and not cTimer.repetition then
      cTimer.finished = true
      return true
    else
      return false
    end
  end
end

return timer
