class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :sitename
      t.attachment :favicon
      t.attachment :logotype
      t.attachment :watermark

      t.timestamps null: false
    end
  end
end
