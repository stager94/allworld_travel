class CreateChudesasShowplaces < ActiveRecord::Migration
  def change
    create_table :chudesas_showplaces, id: false do |t|
    	t.belongs_to :chudesa, index: true
    	t.belongs_to :showplace, index: true
    end
  end
end
