class Campaign < ApplicationRecord
  belongs_to :setting
  has_many :campaign_mails

  after_create :generate_campaign_mails

  def generate_campaign_mails
    Email.all.each do |email|
      CampaignMail.create campaign_id: self.id, email_id: email.id, status: 0
    end
  end
end
