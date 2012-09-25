{SimpleMachine} = require '..'
{expect} = require 'moodswing'

machine = new SimpleMachine '0',
  A: {'0': 'A', B: 'A', C: 'A'}
  B: {'0': 'B', C: 'B', A: 'B'}
  C: {'0': 'C', A: 'C', B: 'C'}
,
  A: -> console.log 'A'
  B: -> console.log 'B'
  C: -> console.log 'C'

expect(machine.trigger 'A').to be: true
expect(machine.trigger 'B').to be: true
expect(machine.trigger 'C').to be: true
expect(machine.trigger 'all').to be: false