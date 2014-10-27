`import Ember from 'ember'`

DashboardRoute = Ember.Route.extend

  setupController: (controller, model) ->
    @store.find('album').then (as) =>  @controllerFor('top-albums').set('model', as.sortBy('playCount').slice(0,5))
    @store.find('track').then (ts) =>  @controllerFor('top-tracks').set('model', ts.sortBy('playCount').slice(0,5))

`export default DashboardRoute`
