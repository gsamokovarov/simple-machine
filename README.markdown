```shell
  .~~~~~~~~~~~~~~~.
 /  VERSION 0.1.0  \
.===================.
|                   |
|   .-----------.   |
|   |.,.,.,.,.,.|   |
|   |,.,.,.,.,.,|   |
|   |.,.,.,.,.,.|   |
|   |,.,.,.,.,.,|   |
|   '-----------'   |
|                 O |
|===================|
| ~~~~~~~~~~~~~~~~~ |
|  simple  machine  |
| ~~~~~~~~~~~~~~~~~ |
'==================='
```

How many lines of code you need for a finite state machine? *16*... of
[CoffeeScript][cs] that is.

Simple Machine
==============

A a minimal finite state machine implementation for the [Node][nd] and the
Browser. There is no DSLs and no bloat. Just draw and trigger states.

Installation
============

If you are running on [Node][nd], use [NPM][np]:

    npm install simple-machine

If you are running on the Browser, use this [this link][dw].

Usage
=====

```coffeescript
machine = new SimpleMachine '0',
  A: {'0': 'A', B: 'A', C: 'A'}
  B: {'0': 'B', C: 'B', A: 'B'}
  C: {'0': 'C', A: 'C', B: 'C'}
,
  A: -> console.log 'A'
  B: -> console.log 'B'
  C: -> console.log 'C'

machine.trigger 'A'
machine.trigger 'B'
machine.trigger 'C'
```

License
=======

Simple machine is licensed under MIT.

[nd]: [http://nodejs.org/]
[np]: [http://npmjs.org/]
[cs]: [http://coffeescript.org/]
[dw]: [https://raw.github.com/gsamokovarov/simple-machine/master/simple-machine.min.js]