App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (users)->
    for user in users
      element = document.createElement('tr')
      element.className = 'location-member'
      html_name = "<td>#{user.username}</td>"
      html_lat = "<td>#{user.latitude}</td>"
      html_lng = "<td>#{user.longitude}</td>"
      html_distance = "<td>#{user.distance}</td>"
      element.innerHTML = "#{html_name}#{html_lat}#{html_lng}#{html_distance}"
      document.getElementById('locations').appendChild(element)
    # Called when there's incoming data on the websocket for this channel

  post_location: (geolocation)->
    @perform 'post_location', location: geolocation
