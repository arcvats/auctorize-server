class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.integer :group_id
      t.integer :user_id

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
