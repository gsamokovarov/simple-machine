#   .~~~~~~~~~~~~~~~.
#  /  VERSION 0.1.0  \
# .===================.
# |                   |
# |   .-----------.   |
# |   |.,.,.,.,.,.|   |
# |   |,.,.,.,.,.,|   |
# |   |.,.,.,.,.,.|   |
# |   |,.,.,.,.,.,|   |
# |   '-----------'   |
# |                 O |
# |===================|
# | ~~~~~~~~~~~~~~~~~ |
# |  simple  machine  |
# | ~~~~~~~~~~~~~~~~~ |
# '==================='

do (root = if typeof('exports') is 'undefined' then window else exports) ->
  class root.SimpleMachine
    constructor: (@state, @transitions = {}, @callbacks = {}) ->

    on: (event, callback, context) ->
      if context?
        callback = -> callback.call(context)
      @callbacks[event] = [callback].concat(@callbacks[event])
      this

    trigger: (event) ->
      if @transitions[event]?[@state]? and event isnt 'all'
        @state = @transitions[event][@state]
        for callback in [@callbacks.all].concat(@callbacks[@state])
          callback?()
        true
      else
        false