class CreateCampaignMails < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_mails do |t|
      t.references :campaign
      t.references :email
      t.integer :status

      t.timestamps
    end
  end
end
