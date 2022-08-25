class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.text :description

      t.datetime :deleted_at

      t.timestamps

      t.index :uid, name: "uid_roles_idx_01", unique: true
      t.index :name, name: "name_roles_idx_02", unique: true
    end
  end
end
