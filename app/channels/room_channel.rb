class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_location
    クライアント側でpost＿locationが実行された際に呼び出されるサーバー側の処理を書く
    
    位置情報モデルもしくはpost_locationの因数から、位置を取得する。ここで、データベースに保存しても良い
    
  end
end
