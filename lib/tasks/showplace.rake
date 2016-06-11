namespace :showplace do
	task fix_placedas: :environment do
		Placeda.all.find_each { |placeda| placeda.update countries: placeda.showplace.country_ids }
	end
end
