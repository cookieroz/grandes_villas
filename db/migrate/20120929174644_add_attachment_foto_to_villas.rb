class AddAttachmentFotoToVillas < ActiveRecord::Migration
  def self.up
    change_table :villas do |t|
      t.has_attached_file :foto
    end
  end

  def self.down
    drop_attached_file :villas, :foto
  end
end
