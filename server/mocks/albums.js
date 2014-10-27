module.exports = function(app) {

  var ALBUMS = [
        {
            id: 1,
            name: 'Bleach',
            artist: 'Nirvana',
            coverImage: 'images/nirvana-bleach.jpg',
            playCount: 0,
            tracks: [1,2,3,4,5,6,7,8,9,10,11,12,13]
        },{
            id: 2,
            name: 'Ten',
            artist: 'Pearl Jam',
            coverImage: 'images/pearl-jam-ten.jpg',
            playCount: 0,
            tracks: [14]
        },{
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
            tracks: []
        },{
            id: 7,
            name: 'Definitely Maybe',
            artist: 'Oasis',
            coverImage: 'images/oasis-definitely-maybe.jpg',
            playCount: 0,
            tracks: []
        }
    ];
  var express = require('express');
  var albumsRouter = express.Router();

  function albumById(albums, id) {
      return albums.reduce(function(previousValue, currentValue, index, array) {
          if (currentValue.id == id) {
              return currentValue;
          } else {
              return previousValue;
          }});
  };

  albumsRouter.get('/', function(req, res) {
    res.send({"albums": ALBUMS});
  });

  albumsRouter.get('/:id', function(req, res) {
    var album = albumById(ALBUMS, req.params.id);
    res.send({"album": album });
  });

  albumsRouter.put('/:id', function(req, res) {
    var album = albumById(ALBUMS, req.params.id);
    album = req.params.album;
    res.send({"album": album});
  });
  app.use('/api/albums', albumsRouter);
};
