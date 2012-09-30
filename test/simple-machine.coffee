{SimpleMachine} = require '..'
{expect} = require 'moodswing'

machine = new SimpleMachine 'S',
  A: {S: 'A', B: 'A', C: 'A'}
  B: {S: 'B', C: 'B', A: 'B'}
  C: {S: 'C', A: 'C', B: 'C'}
,
  A: (previous) -> expect(previous).to be: 'S' 
  B: (previous) -> expect(previous).to be: 'A'
  C: (previous) -> expect(previous).to be: 'B'

expect(machine.trigger 'A').to be: true
expect(machine.trigger 'B').to be: true
expect(machine.trigger 'C').to be: true
expect(machine.trigger 'all').to be: false