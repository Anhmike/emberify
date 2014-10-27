`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'track', 'Track', {
  # Specify the other units that are required for this test.
  needs: ['model:album']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model
