class AddPhotoColumnToPresentations < ActiveRecord::Migration
  def self.up
    transaction do
      add_column :presentations, :photo_file_name,    :string
      add_column :presentations, :photo_content_type, :string
      add_column :presentations, :photo_file_size,    :integer
      add_column :presentations, :photo_updated_at,   :datetime
    end
  end

  def self.down
    transaction do
      remove_column :presentations, :photo_file_name
      remove_column :presentations, :photo_content_type
      remove_column :presentations, :photo_file_size
      remove_column :presentations, :photo_updated_at
    end
  end
end
