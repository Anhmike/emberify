`import DS from 'ember-data'`

AlbumAdapter = DS.RESTAdapter.extend
  namespace: 'api'

`export default AlbumAdapter`
