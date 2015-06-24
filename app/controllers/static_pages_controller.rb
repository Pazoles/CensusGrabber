class StaticPagesController < ApplicationController
  def home
  	city = 'PLACE:7000,37000,50000,51000'
    fields = 'B02001_002E'
    state = 'STATE:1'
   @client =  CensusApi::Client.new('7b00539839953f77a7d7f21fcad0d49aaf6f4a64', {vintage: 2013, dataset: 'acs5'})
   @data = @client.where({ level: city, within: state, fields: fields })
  end
end
