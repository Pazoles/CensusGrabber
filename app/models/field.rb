class Field < ActiveRecord::Base
after_save :load_into_soulmate
before_destroy :remove_from_soulmate


	def self.import(file)
    	CSV.foreach(file.path, headers: true) do |row|
     		field = find_by_id(row["id"]) || new
     		parameters = ActionController::Parameters.new(row.to_hash)
     		field.update(parameters.permit(:code,:category,:variable,:datatype))
     		field.save!
   		end
	end

	def full_variable
		[category, variable].join(' | ')
	end

private

	def load_into_soulmate
		loader = Soulmate::Loader.new("fields")
		loader.add("term" => [category, variable].join(' | '), "id" => self.id, "data" => {
			"link" => Rails.application.routes.url_helpers.field_path(self)
	   	})
	end
 
	def remove_from_soulmate
		loader = Soulmate::Loader.new("fields")
	    loader.remove("id" => self.id)
	end

end
