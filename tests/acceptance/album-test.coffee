`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`
`import albumFactory from '../fixtures'`

App = null
testHelper = null
store = null
TestHelper = Ember.Object.createWithMixins(FactoryGuyTestMixin)

module 'Acceptance: Album',
  setup: ->
    App = startApp()
    testHelper = TestHelper.setup(App)
    store = testHelper.getStore()
    album = store.makeFixture('album', {tracks: store.makeList('track', 3)})

  teardown: ->
    Ember.run -> testHelper.teardown()
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
