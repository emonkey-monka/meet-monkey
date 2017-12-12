App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (users)->
    for user in users
      element = document.createElement('tr')
      element.className = 'location-member'
      html_in = "<td>#{user.username}</td>"
      html_in = html_in + "<td>#{user.latitude}</td>"
      html_in = html_in + "<td>#{user.longitude}</td>"
      element.innerHTML = html_in + "<td>#{user.distance}</td>"
      document.getElementById('locations').appendChild(element)
    # Called when there's incoming data on the websocket for this channel

  post_location: (geolocation)->
    @perform 'post_location', location: geolocation
