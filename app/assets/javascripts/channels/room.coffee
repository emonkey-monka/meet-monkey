App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: ->
    # Called when there's incoming data on the websocket for this channel
　　
  post_location: (location)->
    @perform 'post_location', location:	location
    