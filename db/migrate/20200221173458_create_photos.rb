class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :caption
      t.boolean :hidden

      t.timestamps
    end
  end
end
