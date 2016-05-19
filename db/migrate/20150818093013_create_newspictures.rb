class CreateNewspictures < ActiveRecord::Migration
  def change
    create_table :newspictures do |t|
      t.string :name
      t.references :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
