class CreateGlPages < ActiveRecord::Migration[5.1]
  def change
    create_table :gl_pages do |t|
      t.decimal :latitude, :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.timestamps
    end
  end
end
