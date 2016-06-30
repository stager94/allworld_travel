class FixChudesasShowplacesRelationship < ActiveRecord::Migration
  def change

  	Showplace.all.find_each do |showplace|
  		if showplace.chudesa_id.present?
	  		showplace.chudesas = [Chudesa.where(id: showplace.chudesa_id).first]
	  		showplace.save
	  	end
  	end

  	remove_column :showplaces, :chudesa_id

  end
end
