class Campaign < ApplicationRecord
  belongs_to :setting
  has_many :campaign_mails

  after_create :generate_campaign_mails

  def generate_campaign_mails
    Mail.all.each do |mail|
      CampaignMail.create campaign_id: self.id, mail_id: mail.id, status: 0
    end
  end
end
