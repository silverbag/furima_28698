class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :text,           null: false
      t.integer :price,           null: false
      t.integer :user_id,           foreign_key: true
      t.string :category_id,      foreign_key: true
      t.string :status_id,         foreign_key: true
      t.string :charge_id,        foreign_key: true
      t.string :city_id,          foreign_key: true
      t.string :day_id,         foreign_key: true
      t.timestamps
    end
  end
end
