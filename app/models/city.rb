class City < ActiveRecord::Base

	def self.import(file)
    	csv_text = File.read(file.path)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  City.create!(row.to_hash)
end

    end

	def load_into_soulmate
		loader = Soulmate::Loader.new("cities")
		loader.add("term" => name, "id" => self.id, "data" => {
			"link" => Rails.application.routes.url_helpers.city_path(self)
	   	})
	end
 
	def remove_from_soulmate
		loader = Soulmate::Loader.new("cities")
	    loader.remove("id" => self.id)
	end


end
