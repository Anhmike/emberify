`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->

  @route 'dashboard'
  @route 'album', path: '/album/:album_id'
  @route 'track', path: '/track/:track_id'
  @route 'album.new', path: '/album/new'

`export default Router;`
