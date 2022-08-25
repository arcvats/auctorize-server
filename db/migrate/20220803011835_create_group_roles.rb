class CreateGroupRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :group_roles do |t|
      t.integer :group_id
      t.integer :role_id

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
