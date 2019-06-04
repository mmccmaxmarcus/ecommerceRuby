class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description, limit: 255
      t.references :membro, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
