class SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      render json: @setting
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    head :no_content
  end

  private

  def setting_params
    params.require(:setting).permit(:name, :host, :user, :password, :port)
  end
end
