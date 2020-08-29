class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code,       null: false
      # t.string :state,       null: false
      t.string :city_id,       null: false
      t.string :city,       null: false
      t.string :house_number,       null: false
      t.string :building
      t.string :phone_number,       null: false
      t.string :order_id,       foreign_key: true
      t.timestamps
    end
  end
end
