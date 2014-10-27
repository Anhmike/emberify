`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'album', 'Album', {
  # Specify the other units that are required for this test.
  needs: ['model:track']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model
