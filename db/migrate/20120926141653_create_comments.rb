class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :villa

      t.timestamps
    end
    add_index :comments, :villa_id
  end
end
