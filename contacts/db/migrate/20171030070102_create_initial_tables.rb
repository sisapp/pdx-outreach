class CreateInitialTables < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :email, index: { unique: true }, null: false
      t.string :name, null: false
      t.string :password_digest
      t.datetime :created_at, null: false
    end

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :phone
      t.string :zip
      t.text   :notes
      t.datetime :created_at, null: false
    end

    create_table :groups do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description
      t.datetime :created_at, null: false
    end

    create_table :groups_users, id: false do |t|
      t.references :group, index: true, null: false
      t.references :user, index: true, null: false
      t.datetime :created_at, null: false
    end
    add_index :groups_users, [:group_id, :user_id], unique: true
    add_foreign_key :groups_users, :groups
    add_foreign_key :groups_users, :users


    create_table :contacts_groups, id: false do |t|
      t.references :group, index: true, null: false
      t.references :contact, index: true, null: false
      t.datetime :created_at, null: false
    end
    add_index :contacts_groups, [:group_id, :contact_id], unique: true
    add_foreign_key :contacts_groups, :groups
    add_foreign_key :contacts_groups, :contacts
  end

  def down
    tables = [:groups_users, :contacts_groups, :users, :contacts, :groups]
    tables.each do |tbl|
      drop_table tbl
    end
  end
end
