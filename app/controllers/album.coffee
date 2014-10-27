`import Ember from 'ember'`

AlbumController = Ember.ObjectController.extend

  actions:
    playAlbum: ->
      @get('model').incrementProperty('playCount')
      @get('model').save()

`export default AlbumController`
