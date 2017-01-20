class CampaignMail < ApplicationRecord
  belongs_to :campaign
  belongs_to :mail
end
