class RoomChannel < ApplicationCable::Channel
  def subscribed
      stream_from "location"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

    # クライアント側でpost＿locationが実行された際に呼び出されるサーバー側の処理を書く
    # コントローラーみたいな働き
    # 位置情報モデルもしくはpost_locationの因数から、位置を取得する。ここで、データベースに保存しても良い
    
  
  def post_location(location)
    location = location['location']
    if GlPage.create(latitude: location['latitude'], longitude: location['longitude'], username: location['username']) then
      #他ユーザーの情報を取得
      users_hash = GlPage.pldist(location['latitude'], location['longitude'])
      #取得した情報をクライアントへ伝送
      ActionCable.server.broadcast 'location', users_hash
    else
      Rails.logger.error "失敗"
    end
  end

end
