class LegislationController < ApplicationController
  #before_action :set_bill, only: [:show]
  before_action :authenticate_user!, except: [:allbills]

  def allbills
    response = HTTParty.get('https://congress.api.sunlightfoundation.com/bills?congress=113&apikey=' + ENV["sunlight_api_key"])
    @bills = response["results"]
  end
  #
  # def follow
  #   #@bill = Bill.find(params[:id])
  #   #current_user.follow(@bill)
  #   redirect_to root_path
  # end
  #
  # def unfollow
  #   #@bill = Bill.find(params[:id])
  #   #current_user.stop_following(@bill)
  #   redirect_to root_path
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_bill
  #   Sunlight::Congress.api_key = ENV["sunlight_api_key"]
  #   @bill = Sunlight::Congress::Bill.by_bill_id(params[:id])
  # end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def bill_params
  #   params.require(:bill).permit(:id)
  # end
end
