class CreateBillingInformations < ActiveRecord::Migration
  def self.up
    create_table :billing_informations do |t|
      t.belongs_to :user, :null => false
      t.string :name, :null => false
      t.text :address, :null => false
      t.string :taxid, :null => false
      t.text :other
      t.text :notes
      
      t.timestamps
    end
  end

  def self.down
    drop_table :billing_informations
  end
end
