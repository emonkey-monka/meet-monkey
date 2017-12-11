App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (users)->
    for user in users
      console.log(user)
      element = document.createElement('tr')		
      element.className = 'location-member'
      element.innerHTML = "<td>#{user.latitude}</td><td>#{user.longitude}</td><td>#{user.distance}</td>"
      document.getElementById('locations').appendChild(element)
    # Called when there's incoming data on the websocket for this channel

  post_location: (geolocation)->
    @perform 'post_location', location: geolocation
