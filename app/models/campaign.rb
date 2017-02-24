class Campaign < ApplicationRecord
  belongs_to :setting
  has_many :campaign_mails

  after_create :generate_campaign_mails

  def generate_campaign_mails
    Email.all.each do |email|
      CampaignMail.create campaign_id: self.id, email_id: email.id, status: 0
    end
  end

  def self.emails_processed
    emails_processed = []
    Campaign.all.each do |campaign|
      all = campaign.campaign_mails.count
      processed = campaign.campaign_mails.where(status: 1).count
      emails_processed[campaign.id] = {all: all, processed: processed}
    end
    emails_processed
  end

end
