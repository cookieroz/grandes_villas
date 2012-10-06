class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity
      t.text :content
      t.string :activity_image

      t.timestamps
    end
  end
end
