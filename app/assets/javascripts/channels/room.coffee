App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
　　データベースに保存されていなくてもここで表示dom作成できる、ビューに反映させる
  post_location: ->
    @perform 'post_location'
