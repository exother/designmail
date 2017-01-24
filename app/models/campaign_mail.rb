class CampaignMail < ApplicationRecord
  belongs_to :campaign
  belongs_to :email

  scope :not_sent, -> { where(status:0) }
end
