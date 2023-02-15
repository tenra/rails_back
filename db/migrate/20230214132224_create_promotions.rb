class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :content

      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
