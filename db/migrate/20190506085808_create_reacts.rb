class CreateReacts < ActiveRecord::Migration[5.2]
  def change
    create_table :reacts do |t|
      t.references :new, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :like
      t.boolean :report
      t.string :alt_headline

      t.timestamps
    end
  end
end
