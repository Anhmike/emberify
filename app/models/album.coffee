`import DS from 'ember-data'`

Album = DS.Model.extend
  name: DS.attr('string')
  artist: DS.attr('string')
  coverImage: DS.attr('string')
  year: DS.attr('date')
  playCount: DS.attr('number', {defaultValue: 0})
  tracks: DS.hasMany('track', { async: true })

`export default Album`
