class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :active, null: false, default: false
      t.boolean :api_access, null: false, default: false

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at
      
      t.integer :sign_in_count, null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.string :verification_token
      t.datetime :verified_at
      t.datetime :verification_sent_at
      t.string :unverified_email

      t.integer :failed_attempts, null: false, default: 0
      t.string :unlock_token
      t.datetime :locked_at

      t.string :timezone
      t.string :language, null: false, default: "en"

      t.datetime :deleted_at

      t.integer :organization_id
      t.integer :manager_id

      t.timestamps

      t.index :uid, name: "uid_users_idx_01", unique: true
      t.index :email, name: "email_users_idx_02", unique: true
    end
  end
end
