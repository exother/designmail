class UserMailer < ApplicationMailer

  after_action :set_delivery_setting
  after_filter :save_campaign_mail

  def mailer_message(user, campaign)
    @mail_body = campaign.content
    @campaign = campaign
    @user = user
    @setting = campaign.setting
    mail(to: user.email, subject: @campaign.subject, from: "#{@campaign.from_name} <#{@campaign.from_email}>")
  end

  private

  def set_delivery_setting
    mail.delivery_method.settings = {
        authentication: "plain",
        address: @setting.host,
        port: 587,
        domain: "dotd.pl",
        user_name: @setting.user,
        password: @setting.password,
        enable_starttls_auto: true
    }
  end

  def save_campaign_mail
    CampaignMail.where(campaign_id: @campaign.id, email_id: @user.id).take.update status: 1
  end
end
