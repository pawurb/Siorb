window.Siorb.Models.BaseEntity = Backbone.Model.extend(
  defaults:
    entity: null

  initialize: ->

  getEntity: ->
    @get "entity"

  remove: ->
    entity = @getEntity()
    entity.destroy()  if entity
)