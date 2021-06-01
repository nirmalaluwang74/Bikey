class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :frame_size
      t.string :type
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
