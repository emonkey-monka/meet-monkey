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
  
    if GlPage.create(latitude: location['location']['latitude'], longitude: location['location']['longitude']) then
      #他ユーザーの情報を取得
      users = GlPage.pldist(location['location']['latitude'], location['location']['longitude'])
      users_hash = users.map do |user|
        {
          latitude: user.latitude,
          longitude: user.longitude,
          distance: user.distance
        }
      end
      #取得した情報をクライアントへ伝送
      ActionCable.server.broadcast 'location', users_hash
    else
      Rails.logger.error "失敗"
    end
  end

end
