class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(email_params)

    if @email.save
      render json: @email
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    head :no_content
  end

  private

  def email_params
    params.require(:email).permit(:email)
  end
end
