
FactoryGuy.define('track', {
  sequences:
    trackName: (num) ->
      'track-' + num

  default: {
    name: FactoryGuy.generate('trackName')
  }
});

FactoryGuy.define('album', {
  sequences: {
    albumName: (num) ->
      'Album' + num

    artistName: (num) ->
      'Artist' + num
  },
  default: {
    name: FactoryGuy.generate('albumName'),
    artist: FactoryGuy.generate('artistName')
  }
});

`export default {}`
