class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects,:primary_key => :subject_id do |t|
      t.string :name,null:false
      t.timestamps
    end
  end
end
