class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.text :description
      t.string :subdomain
      t.string :email
      t.string :timezone
      t.string :language, null: false, default: "en"
      t.bigint :api_rate_limit
      t.string :access_token, null: false

      t.datetime :deleted_at

      t.timestamps

      t.index :uid, name: "uid_organizations_idx_01", unique: true
      t.index :name, name: "name_organizations_idx_02", unique: true
      t.index :subdomain, name: "subdomain_organizations_idx_03", unique: true
    end
  end
end
