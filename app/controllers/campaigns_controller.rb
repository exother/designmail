class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    @settings = Setting.all
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    head :no_content
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :content, :setting_id)
  end
end
