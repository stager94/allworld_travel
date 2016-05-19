class CreateLinkobjtocounts < ActiveRecord::Migration
  def change
    create_table :linkobjtocounts do |t|
      t.references :showplace
      t.references :country

      t.timestamps
    end
    add_index :linkobjtocounts, :showplace_id
    add_index :linkobjtocounts, :country_id
  end
end
