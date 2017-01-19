class MailsController < ApplicationController
  def index
    @mails = Mail.all
  end

  def create
    @mail = Mail.new(mail_params)

    if @mail.save
      render json: @mail
    else
      render json: @mail.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mail = Mail.find(params[:id])
    @mail.destroy
    head :no_content
  end

  private

  def mail_params
    params.require(:mail).permit(:mail)
  end
end
