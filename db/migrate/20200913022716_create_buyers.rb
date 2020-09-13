class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :postal,  null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
