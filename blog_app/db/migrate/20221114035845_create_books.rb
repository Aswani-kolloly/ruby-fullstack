class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, :primary_key => :book_id do |t|
      t.string :title
      t.integer :price, null:false
      t.string :description, null:false
      #t.references :subject, null: false
      t.timestamps
    end
  end
end
