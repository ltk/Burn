class CreateBurners < ActiveRecord::Migration
  def change
    create_table :burners do |t|
      t.string :slug, :null => false
      t.integer :user_id, :null => false
      t.integer :email_address_id

      t.timestamps
    end

    add_index :burners, :slug, :unique => true
    add_foreign_key(:burners, :users, dependent: :delete)
  end
end
