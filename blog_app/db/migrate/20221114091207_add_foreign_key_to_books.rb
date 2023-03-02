class AddForeignKeyToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :subject, index:true
    add_foreign_key :books,:subjects,primary_key: :subject_id
  end
end
