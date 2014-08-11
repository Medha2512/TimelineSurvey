class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username 
      t.string :email
      t.string :encrypted_password
      t.boolean :accepted, :default => false
      t.datetime :undergrad_end
      t.string :current_page
      t.string :undergrad_major
      t.boolean :is_admin
      t.integer :event_count
      t.timestamps
    end
  end
end
