class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show]
  #before_action :authenticate_user!, except: [:index, :show]

  # GET /politicians
  # GET /politicians.json
  def index
    response = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators/locate?zip='+current_user.zipcode.to_s+'&apikey=' + ENV["sunlight_api_key"])
    @legislators = response["results"]
  end

  # GET /politicians/1
  # GET /politicians/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      #@politician = Politician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politician_params
      #params.require(:politician).permit(:name)
    end
end
