class CitiesController < ApplicationController
  def index
  	@cities = City.all
  end

  def import
  City.import(params[:file])
  redirect_to root_url, notice: "Cities imported."
end

  private

  def city_params
    params.require(:city).permit(:statefp, :placefp, :concat, :city, :state, :placename, :county)
  end

end
