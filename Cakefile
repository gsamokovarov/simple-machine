{exec} = require 'child_process'

task 'compile', 'Compiles the project to JS.', (options) ->
  options.to ?= 'lib/'
  exec "coffee -b -o #{options.to} -c src/"

task 'document', 'Uses docco to annotate the source', (options) ->
  exec 'docco src/*.coffee'

task 'watch', 'Compiles the project to JS on the fly.', (options) ->
  options.to ?= 'lib/'
  exec "coffee -w -b -o #{options.to} -c src/"

task 'test', 'Tests the library.', (options) ->
  options.to ?= 'lib/'
  exec "coffee -b -o #{options.to} -c src/", ->
    exec 'coffee test/moodswing.coffee'