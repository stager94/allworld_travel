class CreateShowplacepanos < ActiveRecord::Migration
  def change
    create_table :showplacepanos do |t|
      t.string :title
      t.text :src
      t.integer :showplace_id, index: true

      t.timestamps null: false
    end

    add_attachment :showplacepanos, :thumb
  end
end
