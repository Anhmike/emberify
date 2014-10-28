`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`
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
        }, {
            id: 3,
            name: 'Siamese Dream',
            artist: 'Smashing Pumpkins',
            coverImage: 'images/smashing-pumpkins-siamese-dream.jpg',
            playCount: 0,
            tracks: []
        },{
            id: 4,
            name: 'Sleeping with ghosts',
            artist: 'Placebo',
            coverImage: 'images/placebo-sleeping-with-ghosts.jpg',
            playCount: 0,
            tracks: []
        },{
            id: 5,
            name: 'Ok Computer',
            artist: 'Radiohead',
            coverImage: 'images/radiohead-ok-computer.jpg',
            playCount: 0,
            tracks: []
        },{
            id: 6,
            name: 'Dirty',
            artist: 'Sonic Youth',
            coverImage: 'images/sonic-youth-dirty.jpg',
            playCount: 0,
            tracks: [1,2,3,4,5,6,7,8,9,10,11,12]
        },{
            id: 7,
            name: 'Definitely Maybe',
            artist: 'Oasis',
            coverImage: 'images/oasis-definitely-maybe.jpg',
            playCount: 0,
            tracks: [13]
        }]

TRACKS = [
        {
            id: 1,
            name: 'Blew',
            order: 1,
            album: 1
        }, {
            id: 2,
            name: 'Floyd The Barber',
            order: 2,
            album: 1
        }, {
            id: 3,
            name: 'About A Girl',
            order: 3,
            album: 1
        }, {
            id: 4,
            name: 'School',
            order: 4,
            album: 1
        }, {
            id: 5,
            name: 'Love Buzz',
            order: 5,
            album: 1
        }, {
            id: 6,
            name: 'Paper Cuts',
            order: 6,
            album: 1
        }, {
            id: 7,
            name: 'Negative Creep',
            order: 7,
            album: 1
        }, {
            id: 8,
            name: 'Scoff',
            order: 8,
            album: 1
        }, {
            id: 9,
            name: 'Swap Meet',
            order: 10,
            album: 1
        } , {
            id: 10,
            name: 'Mr Moustache',
            order: 11,
            album: 1
        }, {
            id: 11,
            name: 'Sifting',
            order: 11,
            album: 1
        }, {
            id: 12,
            name: 'Big Cheese',
            order: 12,
            album: 1
        }, {
            id: 13,
            name: 'Downer',
            order: 13,
            album: 1
        }, {
            id: 14,
            name: "Rock 'n' Roll Star",
            order: 1,
            album: 2
        }]

App = null
pretender = null

module 'Acceptance: Dashboard',
  setup: ->
    pretender = new Pretender( ->
      @get('/api/albums', (request) ->
        all = JSON.stringify(albums: Object.keys(ALBUMS).map((k) -> ALBUMS[k]))
        [200, {"Content-Type": "application/json"}, all])

      @get('/api/tracks', (request) ->
        all = JSON.stringify(tracks: Object.keys(TRACKS).map((k) -> TRACKS[k]))
        [200, {"Content-Type": "application/json"}, all])
    )
    pretender.unhandledRequest = (verb, path, request) -> ok(false, "Unhandled server request")

    App = startApp()

  teardown: ->
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
    click('a:contains("Bleach")')

  andThen ->
    equal(currentPath(), 'album', "Should display the first album")
