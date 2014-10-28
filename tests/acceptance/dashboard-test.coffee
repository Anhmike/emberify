`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`
`import albumFactory from '../fixtures'`

App = null
testHelper = null
store = null
TestHelper = Ember.Object.createWithMixins(FactoryGuyTestMixin)

module 'Acceptance: Dashboard',
  setup: ->
    App = startApp()
    testHelper = TestHelper.setup(App)
    store = testHelper.getStore()
    albums = FactoryGuy.buildList('album', 7)
    testHelper.stubEndpointForHttpRequest('/api/albums',  albums: albums )

    tracks = FactoryGuy.buildList('track', 10)
    testHelper.stubEndpointForHttpRequest('/api/tracks',  tracks: tracks )


  teardown: ->
    Ember.run -> testHelper.teardown()
    Ember.run App, 'destroy'

test 'visiting /dashboard', ->
  visit '/dashboard'

  andThen ->
    equal currentPath(), 'dashboard'

test 'displays top albums', ->
  visit '/dashboard'

  andThen ->
    equal(find('.top-albums li').length, 5, "Displays the top 5 albums")

test 'displays top tracks', ->
  visit '/dashboard'

  andThen ->
    equal(find('.top-tracks li').length, 5, "Displays the top 5 tracks")

test 'top albums links to the album page', ->
  visit('/dashboard').then ->
    click('a:contains("Album1")')

  andThen ->
    equal(currentPath(), 'album', "Should display the first album")
