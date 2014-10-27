module.exports = function(app) {
  var express = require('express');
  var tracksRouter = express.Router();
    var tracks = [
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
            name: 'SOmething',
            order: 1,
            album: 2
        }
    ];

  tracksRouter.get('/', function(req, res) {
    res.send({"tracks": tracks});
  });

  function albumById(albums, id) {
      return albums.reduce(function(previousValue, currentValue, index, array) {
          if (currentValue.id == id) {
              return currentValue;
          } else {
              return previousValue;
          }});
  };
  tracksRouter.get('/:id', function(req, res) {
    var album = albumById(tracks, req.params.id);
    res.send({"track": album });
  });


  app.use('/api/tracks', tracksRouter);
};
