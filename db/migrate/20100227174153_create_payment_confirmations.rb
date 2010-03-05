class CreatePaymentConfirmations < ActiveRecord::Migration
  def self.up
    create_table :payment_confirmations do |t|
      t.belongs_to :user, :null => false
      t.integer :seller_id, :null => false
      t.string :status, :null => false
      t.integer :t_id, :null => false
      t.decimal :amount, :null => false
      t.decimal :original_amount, :null => false
      t.string :email, :null => false
      t.integer :t_status, :null => false
      t.string :description, :null => false
      t.string :md5, :null => false
      t.timestamp :t_date, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_confirmations
  end
end
