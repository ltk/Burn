class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account_email
      t.string :crypted_password

      t.timestamps
    end
  end
end
