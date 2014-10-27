`import Ember from 'ember'`

DashboardController = Ember.Controller.extend
  needs: ['top-albums', 'top-tracks']

  albums: Ember.computed.alias 'controllers.top-albums.model'

  tracks: Ember.computed.alias 'controllers.top-tracks.model'


`export default DashboardController`
