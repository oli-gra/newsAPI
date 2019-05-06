class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :source
      t.string :title
      t.string :image
      t.datetime :published

      t.timestamps
    end
  end
end
