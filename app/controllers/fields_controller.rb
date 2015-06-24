class FieldsController < ApplicationController
  def index
  	@fields = Field.all
  end

  def show
  	@cities = City.order(:city)
  	@field = Field.find(params[:id]).code
  	@category = Field.find(params[:id]).category
  	@variable = Field.find(params[:id]).variable
   @client =  CensusApi::Client.new(ENV["CENSUSAPIKEY"], {vintage: 2013, dataset: 'acs5'})
     end

  def import
  Field.import(params[:file])
  redirect_to root_url, notice: "Fields imported."
end
end