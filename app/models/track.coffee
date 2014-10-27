`import DS from 'ember-data'`

Track = DS.Model.extend
  name: DS.attr('string')
  order: DS.attr('number')

  album: DS.belongsTo('album')


`export default Track`
