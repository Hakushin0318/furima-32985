class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :user,            foreign_key: true
      t.string  :name,               null: false, default: ""
      t.text    :details,            null: false
      t.integer :category_id,        null: false
      t.integer :state_id,           null: false
      t.integer :delivery_fee_id,    null: false
      t.integer :delivery_source_id, null: false
      t.integer :dalivery_day_id,    null: false
      t.integer :price,              null: false
      t.timestamps
    end
  end
end
