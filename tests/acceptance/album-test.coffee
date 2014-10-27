`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`

App = null

module 'Acceptance: Album',
  setup: ->
    App = startApp()

  teardown: ->
    Ember.run App, 'destroy'

test 'visiting /album', ->
  visit '/album/1'

  andThen ->
    equal currentPath(), 'album'


test 'update playCount', ->
  visit '/album/1'
  click 'button.play-album'

  andThen ->
    equal find('#playCount').text(), "Played 1 times", "Updates the play count"
