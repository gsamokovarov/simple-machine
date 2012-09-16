do (root = if typeof('exports') is 'undefined' then window else exports) ->
  class root.SimpleMachine
    class @InvalidEvent extends Error

    constructor: (@state) ->
      @transitions = {}
      @callbacks = []

    on: (event, callback, context) ->
      if context?
        callback = -> callback.call(context)

      if @callbacks[event]?
        @callbacks[event].push(callback)
      else
        @callbacks[event] = [callback]
      
      this

    when: (event, transitions) ->
      @transitions[event] = transitions
      this

    trigger: (event) ->
      if @canTrigger(event)
        @state = @transitions[event][@state]
        callbacks = @callbacks[@state] + @callbacks['any']
        callback() for callback in callbacks
        true
      else
        false

    canTrigger: (event) ->
      throw new SimpleMachine.InvalidEvent unless @transitions[event]?
      @transitions[event][@state]?

    events: ->
      event for event of @transitions

    in: (other) ->
      @state is other
