class CreateCafeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cafe_images do |t|
      t.string :photo
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
