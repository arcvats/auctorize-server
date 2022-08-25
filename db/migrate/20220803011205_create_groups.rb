class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.text :description
      t.boolean :default, null: false, default: false
      t.datetime :deleted_at

      t.timestamps

      t.index :uid, name: "uid_groups_idx_01", unique: true
      t.index :name, name: "name_groups_idx_02", unique: true
    end
  end
end
