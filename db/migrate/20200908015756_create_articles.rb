class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :nickname, null: false
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :kana_family_name, null: false
      t.string :kana_first_name, null: false
      t.date :birth_day, null: false
      t.timestamps
    end
  end
end
