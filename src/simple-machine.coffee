#       .~~~~~~~~~~~~~~~.
#      /                 \
#     .===================.
#     |                   |
#     |   .-----------.   |
#     |   |.,.,.,.,.,.|   |
#     |   |,.,.,.,.,.,|   |
#     |   |.,.,.,.,.,.|   |
#     |   |,.,.,.,.,.,|   |
#     |   '-----------'   |
#     |                 O |
#     |===================|
#     | ~~~~~~~~~~~~~~~~~ |
#     |  simple  machine  |
#     | ~~~~~~~~~~~~~~~~~ |
#     '==================='

do (root = if typeof('exports') is 'undefined' then window else exports) ->
  class root.SimpleMachine
    constructor: (@state, @transitions = {}) ->
      @callbacks = []

    on: (event, callback, context) ->
      if context?
        callback = -> callback.call(context)

      if @callbacks[event]?
        @callbacks[event].push(callback)
      else
        @callbacks[event] = [callback]

      this

    trigger: (event) ->
      if event is 'all' or @transitions?[event]?[@state]?
        return false

      @state = @transitions[event][@state]
      callbacks = @callbacks[@state] + @callbacks['all']
      callback() for callback in callbacks

      true