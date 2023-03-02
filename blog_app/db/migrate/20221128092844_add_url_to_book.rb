class AddUrlToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :url, :string
  end
end
