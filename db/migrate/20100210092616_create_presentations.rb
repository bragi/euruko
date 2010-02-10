class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.string :topic, :null => false
      t.text :description, :null => false
      t.text :speaker_description
      t.string :length, :null => false
      t.belongs_to :user, :null => false

      t.timestamps
    end
    add_index :presentations, :user_id
  end

  def self.down
    drop_table :presentations
  end
end
