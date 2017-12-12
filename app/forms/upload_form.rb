require 'csv'
class UploadForm
  include ActiveModel::Model	
  attr_accessor :file
   
  validates :file, presence: true
   
  FILE_DIR = "#{Rails.root}/tmp"
   
 def import
   return false unless	save	
   CSV.read(filename).each do |row|
   Spot.create(name: row[0], latitude: row[1],longitude: row[2] )
   end	
   true
 end
           
private

  def filename
    "#{FILE_DIR}/#{file.original_filename}"
  end
      
  def save
    return false unless valid?		
    open(filename, "w") do |f|
    f.write file.read
    end		
    true
  end
end
