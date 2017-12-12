class AddUsernameToGlPages < ActiveRecord::Migration[5.1]
  def change
    add_column :gl_pages, :username, :string
  end
end
