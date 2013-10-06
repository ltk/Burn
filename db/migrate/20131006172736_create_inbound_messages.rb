class CreateInboundMessages < ActiveRecord::Migration
  def change
    create_table :inbound_messages do |t|
      t.text :raw, :null => false
      t.text :headers, :null => false
      t.string :from_email, :null => false
      t.string :from_name
      t.text :to, :null => false
      t.string :email, :null => false
      t.text :subject, :null => false
      t.integer :spam_score, :null => false
      t.string :spf_result, :null => false
      t.boolean :dkim_valid, :null => false
      t.integer :burner_id, :null => false
      t.text :html
      t.text :text

      t.timestamps
    end

    add_index :inbound_messages, :burner_id

    add_foreign_key :inbound_messages, :burners, dependent: :delete
  end
end
