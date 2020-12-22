class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,         foreign_key: true
      t.integer    :postal_code,   null: false
      t.integer    :prefecture_id, null:false
      t.string     :city,  null:false, default: ""
      t.string     :address,       null:false, default: ""
      t.string     :building_name, default: ""
      t.string     :phone_number,  null:false, default: ""
      t.timestamps
    end
  end
end
