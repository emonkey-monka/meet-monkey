class GlPage < ApplicationRecord

  attr_accessor :distance
  
  def self.pldist(lat,lng)
    users = all.map{|glpage| glpage.calc_distance(lat, lng)}
    users.sort_by!(&:distance)
    users.map! do |user|
      {
        latitude: user.latitude,
        longitude: user.longitude,
        distance: user.distance
      }
    end
  end
  
  def calc_distance(lat1, lng1)
    # ラジアン単位に変換
    x1 = lat1.to_f * Math::PI / 180
    y1 = lng1.to_f * Math::PI / 180
    x2 = self.latitude.to_f * Math::PI / 180
    y2 = self.longitude.to_f * Math::PI / 180
    
    # 地球の半径 (km)
    radius = 6378.137
    
    # 差の絶対値
    diff_y = (y1 - y2).abs
    
    calc1 = Math.cos(x2) * Math.sin(diff_y)
    calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
    
    # 分子
    numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
    
    # 分母
    denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
    
    # 弧度
    degree = Math.atan2(numerator, denominator)
    
    # 大円距離 (km)
    @distance = degree * radius
    self
  end

end
