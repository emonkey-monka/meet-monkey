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
      ActionCable.server.broadcast 'location'
    else
      Rails.logger.error "失敗"
    end
  end

end