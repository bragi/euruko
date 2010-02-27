class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.belongs_to :user, :null => false
      t.integer :seller_id, :null => false
      t.decimal :amount, :null => false, :precision => 10, :scale => 2
      t.string :description, :null => false
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
