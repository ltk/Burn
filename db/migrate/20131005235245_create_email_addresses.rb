class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :address, :null => false
      t.integer :user_id, :null => false
      t.boolean :verified, :null => false, :default => false

      t.timestamps
    end

    add_index :email_addresses, [:address, :user_id], :unique => true
    add_index :email_addresses, :user_id
    add_foreign_key(:email_addresses, :users, dependent: :delete)
  end
end
