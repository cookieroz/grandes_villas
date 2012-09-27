class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :villa

      t.timestamps
    end
    add_index :tags, :villa_id
  end
end
