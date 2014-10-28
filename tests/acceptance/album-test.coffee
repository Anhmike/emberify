`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`
`import Pretender from 'pretender'`

ALBUMS = [
        {
            id: 1,
            name: 'Bleach',
            artist: 'Nirvana',
            coverImage: 'images/nirvana-bleach.jpg',
            playCount: 0

        },{
            id: 2,
            name: 'Ten',
            artist: 'Pearl Jam',
            coverImage: 'images/pearl-jam-ten.jpg',
            playCount: 0
        }]

App = null
pretender = null

module 'Acceptance: Album',
  setup: ->
    pretender = new Pretender( ->
      @get('/api/albums/:id', (request) ->
        album = JSON.stringify({album: ALBUMS[request.params.id]});
        [200, {"Content-Type": "application/json"}, album])

      @put('/api/albums/:id', (request) ->
        album = JSON.stringify({album: ALBUMS[request.params.body]});
        [200, {"Content-Type": "application/json"}, album])
    )
    pretender.unhandledRequest = (verb, path, request) ->  ok(false, "Unhandled server request"+verb)
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
