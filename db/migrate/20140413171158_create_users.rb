class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :provider
      t.string  :uid
      t.string  :token
      t.integer :token_expires_at
      t.text    :auth_hash
      t.timestamps
    end
  end
end
