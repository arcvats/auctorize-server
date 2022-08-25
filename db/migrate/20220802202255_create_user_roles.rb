class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.integer :role_id
      t.integer :user_id

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
