namespace :forecast do

	task get_csv: :environment do
		filenames = ["Count1", "Africa", "Azia", "Australia", "Europe", "Severnaia", "South"]
		filenames.each do |filename|
			file = "#{Rails.root}/public/files/#{filename}.csv"

			data = Hash.from_xml(File.open("#{Rails.root}/public/#{filename}.xml"))["countrylist"]["country"]
			data = data.map {|d| [d["cname"], d["woeid"]]}

			CSV.open( file, 'w' ) do |csv|
				data.each do |d|
					csv << d
				end
			end
		end
	end

end
