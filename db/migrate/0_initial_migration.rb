class InitialMigration < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :status
      t.string :image_path

      t.timestamps
    end
    add_index :products, :title, unique: true

    create_table :orders do |t|
      t.references :user
      t.string :status

      t.timestamps
    end
    add_index :orders, :user_id

    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.integer :quantity
      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :selling_price, precision: 8, scale: 2
      t.decimal :percent_off, precision: 8, scale: 2

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :product_id

    create_table :categories do |t|
      t.string :title

      t.timestamps
    end
    add_index :categories, :title, unique: true

    create_table :categories_products do |t|
      t.references :category
      t.references :product
    end

    create_table :users do |t|
      t.string :email
      t.string :full_name
      t.string :display_name
      t.string :crypted_password,               :default => nil
      t.string :salt,                           :default => nil
      t.string :remember_me_token,              :default => nil
      t.datetime :remember_me_token_expires_at, :default => nil
      t.boolean :admin,                         :default => false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :remember_me_token

    create_table :ratings do |t|
      t.references :product
      t.references :user
      t.string :title
      t.text :body
      t.integer :stars, default: 0

      t.timestamps
    end

    create_table :sales do |t|
      t.integer :foreign_key
      t.integer :percent_off, default: 1
      t.string :group
      t.string :status

      t.timestamps
    end
  end
end
