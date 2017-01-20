class CampaignMail < ApplicationRecord
  belongs_to :campaign
  belongs_to :email
end
