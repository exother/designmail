

task :send_mails => :environment do
  CampaignMail.not_sent.limit(10).each do |campaign_mail|
    UserMailer.mailer_message(campaign_mail.email, campaign_mail.campaign).deliver_now
  end
end